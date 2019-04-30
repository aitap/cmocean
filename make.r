#!/usr/bin/r
palettes <- local({
	lastwd <- setwd('cmocean-python')
	on.exit({system('git checkout master'); setwd(lastwd)})

	lapply(setNames(nm = system('git tag -l --sort=version:refname', intern=T)), function(t) {
		system(paste('git checkout', t))
		rgb <- Sys.glob('cmocean/rgb/*-rgb.txt')
		lapply(
			setNames(rgb, sub('-rgb.txt', '', basename(rgb), fixed=T)),
			read.table
		)
	})
})

save(palettes, file = 'R/sysdata.rda', version = 2)
tools::resaveRdaFiles('R/sysdata.rda', version = 2)

unlink(Sys.glob('cmocean_*.tar.gz'))
system('R CMD build . --no-resave-data')

pkg <- Sys.glob('cmocean_*.tar.gz')
stopifnot(length(pkg) == 1)

system(paste('R CMD check', pkg[1]))
system(paste('R CMD INSTALL', pkg[1]))
