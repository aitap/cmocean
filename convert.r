#!/usr/bin/r
cmocean <- lapply(
	setNames(argv, sub('-rgb.txt', '', basename(argv), fixed=T)),
	function(f) rgb(read.table(f))
)
saveRDS(cmocean, 'cmocean.rds')
cat(
	'export(',
	paste(names(cmocean), collapse = ', '),
	')\n',
	'importFrom(grDevices, colorRampPalette)\n',
	file = 'NAMESPACE',
	sep = ''
)
cat(
	'cmocean <- readRDS("cmocean.rds")',
	vapply(
		names(cmocean),
		function(n) sprintf("%s <- grDevices::colorRampPalette(cmocean$%s)", n, n),
		character(1)
	),
	file = 'R/functions.R',
	sep = '\n'
)
