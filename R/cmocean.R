cmocean <- function(
	name, version = getOption('cmocean-version', '2.0'), clip = 0,
	start = clip/2, end = 1 - clip/2, direction = 1, alpha = 1
) {
	.checkmatch <- function(arg, choices) {
		if (!(arg %in% choices)) stop(
			sQuote(deparse(substitute(arg))),
			' must be one of ',
			paste(dQuote(choices), collapse = ", "),
			call. = FALSE
		)
	}
	.checkmatch(version, names(palettes))
	.checkmatch(name, names(palettes[[version]]))
	.checkmatch(direction, c(-1, 1))
	stopifnot(
		clip >= 0, clip < 1, alpha >= 0, alpha <= 1,
		start < end, start >= 0, start <= 1, end >= 0, end <= 1
	)
	cols <- palettes[[version]][[name]]
	ncols <- nrow(cols) - 1
	rows <- (ncols*start):(ncols*end)
	if (direction < 0) rows <- rev(rows)
	colorRampPalette(rgb(red = cols[1 + rows,], alpha = alpha), alpha = TRUE)
}
