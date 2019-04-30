#!/usr/bin/r
palettes <- local({
	lastwd <- getwd()
	on.exit({system('git checkout master'); setwd(lastwd)})
	setwd('cmocean-python')

	lapply(setNames(nm = system('git tag -l --sort=version:refname', intern=T)), function(t) {
		system(paste('git checkout', t))
		rgb <- Sys.glob('cmocean/rgb/*-rgb.txt')
		lapply(
			setNames(rgb, sub('-rgb.txt', '', basename(rgb), fixed=T)),
			read.table
		)
	})
})
save(palettes, file = 'R/sysdata.rda')

tools::resaveRdaFiles('R/sysdata.rda')

unlink(Sys.glob('cmocean_*.tar.gz'))
system('R CMD build .')

pkg <- Sys.glob('cmocean_*.tar.gz')
stopifnot(length(pkg) == 1)

system(paste('R CMD check --as-cran', pkg[1]))
system(paste('R CMD INSTALL', pkg[1]))
