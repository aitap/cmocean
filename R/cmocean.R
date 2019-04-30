cmocean <- function(name, version = getOption('cmocean-version', '2.0'), clip = 0, start = clip/2, end = 1 - clip/2) {
	cols <- palettes[[version]][[name]]
	ncols <- nrow(cols)-1
	grDevices::colorRampPalette(
		grDevices::rgb(
			cols[1 + (ncols*start):(ncols*end),]
		)
	)
}
