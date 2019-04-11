#!/usr/bin/r
cmocean <- lapply(
	setNames(argv, sub('-rgb.txt', '', basename(argv), fixed=T)),
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
