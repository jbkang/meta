% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/trimfill.R
\name{trimfill.meta}
\alias{trimfill.meta}
\alias{trimfill}
\alias{trimfill.default}
\title{Trim-and-fill method to adjust for bias in meta-analysis}
\usage{
\method{trimfill}{meta}(
  x,
  left = NULL,
  ma.fixed = TRUE,
  type = "L",
  n.iter.max = 50,
  level = x$level,
  level.comb = x$level.comb,
  comb.fixed = FALSE,
  comb.random = TRUE,
  hakn = x$hakn,
  method.tau = x$method.tau,
  method.tau.ci = x$method.tau.ci,
  prediction = x$prediction,
  level.predict = x$level.predict,
  backtransf = x$backtransf,
  pscale = x$pscale,
  irscale = x$irscale,
  irunit = x$irunit,
  silent = TRUE,
  ...
)

\method{trimfill}{default}(
  x,
  seTE,
  left = NULL,
  ma.fixed = TRUE,
  type = "L",
  n.iter.max = 50,
  sm = "",
  studlab = NULL,
  level = 0.95,
  level.comb = level,
  comb.fixed = FALSE,
  comb.random = TRUE,
  hakn = FALSE,
  method.tau = "DL",
  method.tau.ci = if (method.tau == "DL") "J" else "QP",
  prediction = FALSE,
  level.predict = level,
  backtransf = TRUE,
  pscale = 1,
  irscale = 1,
  irunit = "person-years",
  silent = TRUE,
  ...
)
}
\arguments{
\item{x}{An object of class \code{meta}, or estimated treatment
effect in individual studies.}

\item{left}{A logical indicating whether studies are supposed to be
missing on the left or right side of the funnel plot. If NULL,
the linear regression test for funnel plot symmetry (i.e.,
function \code{metabias(..., method="Egger")}) is used to
determine whether studies are missing on the left or right side.}

\item{ma.fixed}{A logical indicating whether a fixed effect or
random effects model is used to estimate the number of missing
studies.}

\item{type}{A character indicating which method is used to estimate
the number of missing studies. Either \code{"L"} or \code{"R"}.}

\item{n.iter.max}{Maximum number of iterations to estimate number
of missing studies.}

\item{level}{The level used to calculate confidence intervals for
individual studies. If existing, \code{x$level} is used as value
for \code{level}; otherwise 0.95 is used.}

\item{level.comb}{The level used to calculate confidence interval
for the pooled estimate. If existing, \code{x$level.comb} is used
as value for \code{level.comb}; otherwise 0.95 is used.}

\item{comb.fixed}{A logical indicating whether a fixed effect
meta-analysis should be conducted.}

\item{comb.random}{A logical indicating whether a random effects
meta-analysis should be conducted.}

\item{hakn}{A logical indicating whether the method by Hartung and
Knapp should be used to adjust test statistics and confidence
intervals.}

\item{method.tau}{A character string indicating which method is
used to estimate the between-study variance \eqn{\tau^2} and its
square root \eqn{\tau}. Either \code{"DL"}, \code{"PM"},
\code{"REML"}, \code{"ML"}, \code{"HS"}, \code{"SJ"},
\code{"HE"}, or \code{"EB"}, can be abbreviated.}

\item{method.tau.ci}{A character string indicating which method is
used to estimate the confidence interval of \eqn{\tau^2} and
\eqn{\tau}. Either \code{"QP"}, \code{"BJ"}, or \code{"J"}, or
\code{""}, can be abbreviated.}

\item{prediction}{A logical indicating whether a prediction
interval should be printed.}

\item{level.predict}{The level used to calculate prediction
interval for a new study.}

\item{backtransf}{A logical indicating whether results should be
back transformed in printouts and plots. If
\code{backtransf=TRUE}, results for \code{sm="OR"} are printed as
odds ratios rather than log odds ratios and results for
\code{sm="ZCOR"} are printed as correlations rather than Fisher's
z transformed correlations, for example.}

\item{pscale}{A numeric giving scaling factor for printing of
single event probabilities or risk differences, i.e. if argument
\code{sm} is equal to \code{"PLOGIT"}, \code{"PLN"},
\code{"PRAW"}, \code{"PAS"}, \code{"PFT"}, or \code{"RD"}.}

\item{irscale}{A numeric defining a scaling factor for printing of
single incidence rates or incidence rate differences, i.e. if
argument \code{sm} is equal to \code{"IR"}, \code{"IRLN"},
\code{"IRS"}, \code{"IRFT"}, or \code{"IRD"}.}

\item{irunit}{A character specifying the time unit used to
calculate rates, e.g. person-years.}

\item{silent}{A logical indicating whether basic information on
iterations shown.}

\item{\dots}{other arguments}

\item{seTE}{Standard error of estimated treatment effect.}

\item{sm}{An optional character string indicating underlying
summary measure, e.g., \code{"RD"}, \code{"RR"}, \code{"OR"},
\code{"ASD"}, \code{"HR"}, \code{"MD"}, \code{"SMD"}, or
\code{"ROM"}; ignored if \code{x} is of class \code{meta}.}

\item{studlab}{An optional vector with study labels; ignored if
\code{x} is of class \code{meta}.}
}
\value{
An object of class \code{c("metagen", "meta", "trimfill")}. The
object is a list containing the following components:
\item{studlab, sm, left, ma.fixed, type, n.iter.max}{As defined
  above.}
\item{level, level.comb, level.predict}{As defined above.}
\item{comb.fixed, comb.random, prediction}{As defined above.}
\item{hakn, method.tau, method.tau.ci,}{As defined above.}
\item{TE, seTE}{Estimated treatment effect and standard error of
  individual studies.}
\item{lower, upper}{Lower and upper confidence interval limits for
  individual studies.}
\item{statistic, pval}{Statistic and p-value for test of treatment
  effect for individual studies.}
\item{w.fixed, w.random}{Weight of individual studies (in fixed and
  random effects model).} 
\item{TE.fixed, seTE.fixed}{Estimated overall treatment effect and
  standard error (fixed effect model).}
\item{TE.random, seTE.random}{Estimated overall treatment effect
  and standard error (random effects model).}
\item{seTE.predict}{Standard error utilised for prediction
  interval.}
\item{lower.predict, upper.predict}{Lower and upper limits of
  prediction interval.}
\item{k}{Number of studies combined in meta-analysis.}
\item{Q}{Heterogeneity statistic Q.}
\item{tau}{Square-root of between-study variance.}
\item{method}{Pooling method: \code{"Inverse"}.} 
\item{call}{Function call.}
\item{n.iter}{Actual number of iterations to estimate number of
  missing studies.}
\item{trimfill}{A logical vector indicating studies that have been
  added by trim-and-fill method.}
\item{df.hakn}{Degrees of freedom for test of treatment effect for
  Hartung-Knapp method (only if \code{hakn=TRUE}).}
\item{title}{Title of meta-analysis / systematic review.}
\item{complab}{Comparison label.} 
\item{outclab}{Outcome label.}
\item{label.e}{Label for experimental group.}
\item{label.c}{Label for control group.}
\item{label.left}{Graph label on left side of forest plot.}
\item{label.right}{Graph label on right side of forest plot.}
\item{k0}{Number of studies added by trim-and-fill.}
\item{n.e}{Number of observations in experimental group (only for
  object \code{x} of class \code{metabin} or \code{metacont}).}
\item{n.c}{Number of observations in control group (only for object
  \code{x} of class \code{metabin} or \code{metacont}).}
\item{event.e}{Number of events in experimental group (only for
  object \code{x} of class \code{metabin}).}
\item{event.c}{Number of events in control group (only for object
  \code{x} of class \code{metabin}).} 
\item{mean.e}{Estimated mean in experimental group (only for object
  \code{x} of class \code{metacont}).}
\item{sd.e}{Standard deviation in experimental group (only for
  object \code{x} of class \code{metacont}).}
\item{mean.c}{Estimated mean in control group (only for object
  \code{x} of class \code{metacont}).} 
\item{sd.c}{Standard deviation in control group (only for object
  \code{x} of class \code{metacont}).}
\item{n}{Number of observations (only for object \code{x} of class
  \code{metaprop}).}
\item{event}{Number of events (only for object \code{x} of class
  \code{metaprop}).}
\item{cor}{Corelation (only for object \code{x} of class
  \code{metacor}).} 
\item{class.x}{Main class of object \code{x} (e.g. 'metabin' or
  'metacont').}
\item{version}{Version of R package \bold{meta} used to create
  object.}
}
\description{
Trim-and-fill method for estimating and adjusting for the number
and outcomes of missing studies in a meta-analysis.
}
\details{
The trim-and-fill method (Duval, Tweedie 2000a, 2000b) can be used
for estimating and adjusting for the number and outcomes of missing
studies in a meta-analysis. The method relies on scrutiny of one
side of a funnel plot for asymmetry assumed due to publication
bias.

Three different methods have been proposed originally to estimate
the number of missing studies. Two of these methods (L- and
R-estimator) have been shown to perform better in simulations, and
are available in this R function (argument \code{type}).

A fixed effect or random effects model can be used to estimate the
number of missing studies (argument \code{ma.fixed}). Furthermore,
a fixed effect and/or random effects model can be used to summaries
study results (arguments \code{comb.fixed} and
\code{comb.random}). Simulation results (Peters et al. 2007)
indicate that the fixed-random model, i.e. using a fixed effect
model to estimate the number of missing studies and a random
effects model to summaries results, (i) performs better than the
fixed-fixed model, and (ii) performs no worse than and marginally
better in certain situations than the random-random
model. Accordingly, the fixed-random model is the default.

An empirical comparison of the trim-and-fill method and the Copas
selection model (Schwarzer et al. 2010) indicates that the
trim-and-fill method leads to excessively conservative inference in
practice. The Copas selection model is available in R package
\bold{metasens}.

The function \code{\link{metagen}} is called internally.
}
\examples{
data(Fleiss1993bin)
m1 <- metabin(d.asp, n.asp, d.plac, n.plac, data = Fleiss1993bin, sm = "OR")
tf1 <- trimfill(m1)
summary(tf1)
funnel(tf1)
funnel(tf1, pch = ifelse(tf1$trimfill, 1, 16),
       level = 0.9, comb.random = FALSE)
#
# Use log odds ratios on x-axis
#
funnel(tf1, backtransf = FALSE)
funnel(tf1, pch = ifelse(tf1$trimfill, 1, 16),
       level = 0.9, comb.random = FALSE, backtransf = FALSE)

trimfill(m1$TE, m1$seTE, sm = m1$sm)

}
\references{
Duval S & Tweedie R (2000a):
A nonparametric "Trim and Fill" method of accounting for
publication bias in meta-analysis.
\emph{Journal of the American Statistical Association},
\bold{95}, 89--98

Duval S & Tweedie R (2000b):
Trim and Fill: A simple funnel-plot-based method of testing and
adjusting for publication bias in meta-analysis.
\emph{Biometrics},
\bold{56}, 455--63

Peters JL, Sutton AJ, Jones DR, Abrams KR, Rushton L (2007):
Performance of the trim and fill method in the presence of
publication bias and between-study heterogeneity.
\emph{Statisics in Medicine},
\bold{10}, 4544--62

Schwarzer G, Carpenter J, Rücker G (2010):
Empirical evaluation suggests Copas selection model preferable to
trim-and-fill method for selection bias in meta-analysis
\emph{Journal of Clinical Epidemiology},
\bold{63}, 282--8
}
\seealso{
\code{\link{metagen}}, \code{\link{metabias}},
  \code{\link{funnel}}
}
\author{
Guido Schwarzer \email{sc@imbi.uni-freiburg.de}
}
