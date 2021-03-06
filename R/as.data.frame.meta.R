#' Additional functions for objects of class meta
#' 
#' @description
#' The \code{as.data.frame} method returns a data frame containing
#' information on individual studies, e.g., estimated treatment effect
#' and its standard error.
#' 
#' @param x An object of class \code{meta}.
#' @param row.names \code{NULL} or a character vector giving the row
#'   names for the data frame.
#' @param optional logical. If \code{TRUE}, setting row names and
#'   converting column names (to syntactic names) is optional.
#' @param \dots other arguments
#' 
#' @return A data frame is returned by the function \code{as.data.frame}.
#' 
#' @author Guido Schwarzer \email{sc@@imbi.uni-freiburg.de}
#' 
#' @seealso \code{\link{metabin}}, \code{\link{metacont}},
#'   \code{\link{metagen}}, \code{\link{forest.meta}}
#' 
#' @examples
#' data(Fleiss1993cont)
#' #
#' # Generate additional variable with grouping information
#' #
#' Fleiss1993cont$group <- c(1, 2, 1, 1, 2)
#' #
#' # Do meta-analysis without grouping information
#' #
#' m1 <- metacont(n.psyc, mean.psyc, sd.psyc, n.cont, mean.cont, sd.cont,
#'                data = Fleiss1993cont, sm = "SMD",
#'                studlab = paste(study, year))
#' #
#' # Update meta-analysis object and do subgroup analyses
#' #
#' summary(update(m1, byvar = group))
#' 
#' # Same result using metacont function directly
#' #
#' m2 <- metacont(n.psyc, mean.psyc, sd.psyc, n.cont, mean.cont, sd.cont,
#'                data = Fleiss1993cont, sm = "SMD",
#'                studlab = paste(study, year), byvar = group)
#' summary(m2)
#' 
#' # Compare printout of the following two commands
#' #
#' as.data.frame(m1)
#' m1$data
#'
#' @export
#' @export as.data.frame.meta


as.data.frame.meta <- function(x, row.names = NULL,
                               optional = FALSE, ...) {
  
  
  ##
  ##
  ## (1) Check for meta object and upgrade older meta objects
  ##
  ##
  chkclass(x, "meta")
  x <- updateversion(x)
  
  
  ## Remove element 'call' from object of class meta to get rid
  ## of an error message in meta-analyses with six studies:
  ## 'Error: evaluation nested too deeply: infinite recursion ...'
  ##
  ## NB: Element 'call' which is of length six contains information
  ##     on the function call.
  ##
  x$call <- NULL
  
  if (!is.null(x$approx.TE) && all(x$approx.TE == ""))
    x$approx.TE <- NULL
  ##
  if (!is.null(x$approx.seTE) && all(x$approx.seTE == ""))
    x$approx.seTE <- NULL
  
  sel <- as.vector(lapply(x, length) == length(x$TE))
  
  res <- as.data.frame(x[names(x)[sel]], ...)
  
  attr(res, "version") <- packageDescription("meta")$Version
  
  res
}
