cmocean <- function(
	name, version = getOption('cmocean-version', '2.0'), clip = 0,
	start = clip/2, end = 1 - clip/2, direction = 1, alpha = 1
) {
	 if (!name %in% c(
         	"thermal",
         	"haline",
          	"solar",
          	"ice",
          	"gray",
          	"oxy",
          	"deep",
          	"dense",
          	"algae",
          	"matter",
          	"turbid",
          	"speed",
          	"amp",
          	"tempo",
          	"rain",
          	"phase",
          	"topo",
          	"balance",
          	"delta",
          	"curl",
          	"diff",
          	"tarn")) {
            warning(paste0("Name '", name, "' does not exist. Defaulting to 'thermal'."))
            name <- "thermal"
        }

	cols <- palettes[[version]][[name]]
	ncols <- nrow(cols) - 1
	rows <- (ncols*start):(ncols*end)
	if (direction < 0) rows <- rev(rows)
	colorRampPalette(rgb(red = cols[1 + rows,], alpha = alpha), alpha = TRUE)
}
