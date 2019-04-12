#!/usr/bin/r
palettes <- Sys.glob('cmocean-python/cmocean/rgb/*-rgb.txt')
palettes <- lapply(
	setNames(palettes, sub('-rgb.txt', '', basename(palettes), fixed=T)),
	read.table
)
save(palettes, file = 'R/sysdata.rda')
tools::resaveRdaFiles('R/sysdata.rda')
roxygen2::roxygenise()
unlink(Sys.glob('cmocean_*.tar.gz'))
system('R CMD build .')
pkg <- Sys.glob('cmocean_*.tar.gz')
stopifnot(length(pkg) == 1)
system(paste('R CMD check --as-cran', pkg[1]))
system(paste('R CMD INSTALL', pkg[1]))
