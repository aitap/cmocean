#!/usr/bin/r
cmocean <- lapply(
	setNames(argv, sub('-rgb.txt', '', basename(argv), fixed=T)),
	function(f) rgb(read.table(f))
)
save(cmocean, file = 'data/cmocean.rda')
cat(
	'export(',
	paste(names(cmocean), collapse = ', '),
	')\n',
	file = 'NAMESPACE',
	sep = ''
)
cat(
	vapply(
		names(cmocean),
		function(n) sprintf("%s <- grDevices::colorRampPalette(cmocean$%s)", n, n),
		character(1)
	),
	file = 'R/functions.R',
	sep = '\n'
)
