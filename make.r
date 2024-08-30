#!/usr/bin/Rscript
palettes <- local({
	lastwd <- setwd('cmocean-python')
	on.exit({system('git checkout main'); setwd(lastwd)})

	lapply(setNames(nm = system('git tag -l --sort=version:refname', intern=T)), function(t) {
		system(paste('git checkout', t))
		rgb <- Sys.glob('cmocean/rgb/*-rgb.txt')
		lapply(
			setNames(rgb, sub('-rgb.txt', '', basename(rgb), fixed=T)),
			read.table
		)
	})
})
names(palettes) <- sub('^v', '', names(palettes))
stopifnot(
	`Expecting no changes in palettes after 2.0` = vapply(
		palettes[(which(names(palettes) == '2.0')+1):length(palettes)],
		identical, FALSE, palettes[['2.0']]
	)
)
palettes <- palettes[1:(which(names(palettes) == '2.0'))]

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
