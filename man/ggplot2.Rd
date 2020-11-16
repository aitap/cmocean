\name{scale_colour_cmocean}
\alias{scale_colour_cmocean}
\alias{scale_color_cmocean}
\alias{scale_fill_cmocean}
\title{cmocean colour scales for ggplot2}
\description{
  Helper functions to allow the colour scale to be used effectively
  in \pkg{ggplot2}.
}
\usage{
  scale_colour_cmocean(
    \dots, alpha = 1, start = 0, end = 1, direction = 1, discrete = FALSE,
    name = "thermal", version = getOption('cmocean-version', '2.0')
  )
  scale_color_cmocean(
    \dots, alpha = 1, start = 0, end = 1, direction = 1, discrete = FALSE,
    name = "thermal", version = getOption('cmocean-version', '2.0')
  )
  scale_fill_cmocean(
    \dots, alpha = 1, start = 0, end = 1, direction = 1, discrete = FALSE,
    name = "thermal", version = getOption('cmocean-version', '2.0')
  )
}
\arguments{
  \item{\dots}{
    parameters to \pkg{ggplot2} functions \code{discrete_scale} or
    \code{scale_fill_gradientn}.
  }
  \item{alpha}{
    opacity of the palette in the range \eqn{[0, 1]}.
}
  \item{start}{
    fraction of the colormap to clip from its start, in \eqn{[0, 1]}.
}
  \item{end}{
    fraction of the colormap where it should stop, in \eqn{[0, 1]};
    \eqn{\mathtt{start} < \mathtt{end}}{start < end}.
}
  \item{direction}{
    set to \code{-1} to reverse the palette.
}
  \item{discrete}{
    set to \code{TRUE} to generate a discrete palette instead of a
    continuous one.
}
  \item{name}{
    the name of one of the available cmocean colormaps, see
    \code{\link{cmocean}} for the full list.
   }
  \item{version}{
    specific \code{cmocean} version you would like to use, passed as-is
    to \code{\link{cmocean}}. Defaults to the latest available version
    of the palette set.
  }
}
\value{
  A \code{ggplot} object to be used with other \code{ggplot} objects.
}
\author{
  As requested by Ilja Kocken in
  \url{https://github.com/aitap/cmocean/issues/5}.
}

\seealso{
  \code{\link{cmocean}}
}
\examples{if (require('ggplot2')) {
  dat <- data.frame(
    a = 1:10, b = 11:20, c = rnorm(10)
  )

  ggplot(dat, aes(x = a, y = b, fill = c)) +
  geom_raster() + scale_fill_cmocean()
}}
