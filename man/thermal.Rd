\name{thermal}
\alias{thermal}
\title{
Thermal colour palette
}
\description{
Thermal palette is equential with dark blue representing lower,
cooler values and transitioning through reds to yellow
representing increased warmer values.
}
\usage{
thermal(n)
}
\arguments{
  \item{n}{
    integer giving the number of colours (>= 1) to be produced;
	currently it does not make sense to ask for more than 256
}
}
\value{
  Vector of R colours (\code{'#RRGGBB'} strings) of length \code{n}.
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (n) 
{
    x <- ramp(seq.int(0, 1, length.out = n))
    if (ncol(x) == 4L) 
        rgb(x[, 1L], x[, 2L], x[, 3L], x[, 4L], maxColorValue = 255)
    else rgb(x[, 1L], x[, 2L], x[, 3L], maxColorValue = 255)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ colour }
