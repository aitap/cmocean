#' @title <%= tools::toTitleCase(name) %> colour palette
#' @description <%= description %>
#' @param n integer giving the number of colours (>= 1) to be produced;
#'          currently it does not make sense to ask for more than 256
#' @return Vector of R colours (\code{'#RRGGBB'} strings) of length \code{n}.
#' @examples
#' z <- xtabs(weight~Time+Chick, ChickWeight)
#' x <- sort(as.numeric(rownames(z)))
#' y <- sort(as.numeric(colnames(z)))
#' image(
#' 	x = x, y = y, z = z, col = <%= name %>(100),
#'  xlab = 'Time', ylab = 'Chick'
#' )
#' @keywords color
