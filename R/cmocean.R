cmocean <- function(name, clip = 0, start = clip/2, end = 1 - clip/2) {
	cols <- palettes[[name]]
	ncols <- nrow(cols)-1
	grDevices::colorRampPalette(
		grDevices::rgb(
			cols[1 + (ncols*start):(ncols*end),]
		)
	)
}
