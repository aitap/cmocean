#!/usr/bin/Rscript
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

save(palettes, file = 'R/sysdata.rda', version = 2, compress = 'xz')

# fix the version number to 3.6.3 to avoid binary changes in git
f <- xzfile('R/sysdata.rda', 'rb')
contents <- readBin(f, raw(), 1e7) # should be less than that
close(f)
h0 <- c( # see R Internals, 1.8 Serialization Formats
	charToRaw('RDX2\nX\n'),
	as.raw(c(0, 0, 0, 2, 0, unclass(getRversion())[[1]]))
)
stopifnot(length(contents) < 1e7, contents[seq_along(h0)] == h0)
contents[length(h0) - 2:0] <- as.raw(c(3, 6, 3))
f <- xzfile('R/sysdata.rda', 'wb', compression = 9)
writeBin(contents, f)
close(f)

unlink(Sys.glob('cmocean_*.tar.gz'))
system('R CMD build .')

pkg <- Sys.glob('cmocean_*.tar.gz')
stopifnot(length(pkg) == 1)

system(paste('R CMD check', pkg[1]))
system(paste('R CMD INSTALL', pkg[1]))
