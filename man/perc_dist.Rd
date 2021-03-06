% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/perc_dist.R
\name{perc_dist}
\alias{perc_dist}
\title{Calculate a distribution of percentiles from an ordered categorical variable
and a continuous variable.}
\usage{
perc_dist(data_model, categorical_var, continuous_var, weights = NULL)
}
\arguments{
\item{data_model}{A data frame with at least the categorical and continuous
variables from which to estimate the percentiles}

\item{categorical_var}{The bare unquoted name of the categorical variable.
 This variable \strong{should} be an ordered factor. If not, will raise
an error.}

\item{continuous_var}{The bare unquoted name of the continuous variable from
which to estimate the percentiles}

\item{weights}{The bare unquoted name of the optional weight variable.
If not specified, then equal weights are assumed.}
}
\value{
A data frame with the scores and standard errors for each percentile
}
\description{
Calculate a distribution of percentiles from an ordered categorical variable
and a continuous variable.
}
\details{
\code{perc_dist} drops missing observations silently for calculating
the linear combination of coefficients.
}
\examples{

set.seed(23131)
N <- 1000
K <- 20

toy_data <- data.frame(id = 1:N,
                       score = rnorm(N, sd = 2),
                       type = rep(paste0("inc", 1:20), each = N/K),
                       wt = 1)


# perc_diff(toy_data, type, score)
# type is not an ordered factor!

toy_data$type <- factor(toy_data$type, levels = unique(toy_data$type), ordered = TRUE)

perc_dist(toy_data, type, score)
}
