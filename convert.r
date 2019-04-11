#!/usr/bin/r
palettes <- Sys.glob('cmocean-python/cmocean/rgb/*-rgb.txt')
cmocean <- lapply(
	setNames(palettes, sub('-rgb.txt', '', basename(palettes), fixed=T)),
	function(f) rgb(read.table(f))
)
names(cmocean) <- ifelse(
	names(cmocean) %in% c('diff', 'gray'),
	paste0('cm', names(cmocean)),
	names(cmocean)
)
save(cmocean, file = 'R/sysdata.rda')

cat(
	'load("R/sysdata.rda")',
	vapply(
		names(cmocean),
		function(n) sprintf(
			paste(
				"#' @export",
				"%s <- grDevices::colorRampPalette(cmocean$%s)",
				sep = "\n"
			),
			n, n
		),
		character(1)
	),
	file = 'R/functions.R',
	sep = '\n'
)
roxygen2::roxygenise()
unlink(Sys.glob('cmocean_*.tar.gz'))
system('R CMD build .')
pkg <- Sys.glob('cmocean_*.tar.gz')
stopifnot(length(pkg) == 1)
system(paste('R CMD check --as-cran', pkg[1]))
system(paste('R CMD INSTALL', pkg[1]))
