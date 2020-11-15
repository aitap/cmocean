cmocean <- function(
	name, version = getOption('cmocean-version', '2.0'), clip = 0,
	start = clip/2, end = 1 - clip/2, direction = 1, alpha = 1
) {
        name <- match.arg(name, names(palettes[[version]]))
	cols <- palettes[[version]][[name]]
	ncols <- nrow(cols) - 1
	rows <- (ncols*start):(ncols*end)
	if (direction < 0) rows <- rev(rows)
	colorRampPalette(rgb(red = cols[1 + rows,], alpha = alpha), alpha = TRUE)
}
