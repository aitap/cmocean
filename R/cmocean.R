#' @details
#' This package contains colormaps for commonly-used oceanographic
#' variables. Most of the colormaps started from matplotlib
#' colormaps, but have now been adjusted using the viscm tool to be
#' perceptually uniform.
#'
#' @references 
#' Thyng, K. M., Greene, C. A., Hetland, R. D., Zimmerle, H. M., &
#' DiMarco, S. F. (2016). True colors of oceanography. Oceanography,
#' 29(3), 10.
#'
#' @keywords color
"_PACKAGE"

#' @name thermal
#' @templateVar description The thermal colormap is sequential with dark blue representing lower, cooler values and transitioning through reds to yellow representing increased warmer values.

#' @name haline
#' @templateVar description The haline colormap is sequential, and might be used with dark blue representing lower salinity or fresher water, transitioning through greens to light yellow representing increased salinity or saltier water. This colormap is based on matplotlib’s \dQuote{YlGnBu}, but was recreated from scratch using the \sQuote{viscm} tool.

#' @name solar
#' @templateVar description The solar colormap is sequential from dark brown for low values to increasingly bright yellow to potentially represent an increase in radiation in the water.

#' @name ice
#' @templateVar description The ice colormap is sequential from very dark blue (almost black) to very light blue (almost white). A use for this could be representations of sea ice.

#' @name cmgray
#' @templateVar description The gray colormap is sequential from black to white, with uniform steps through perceptual colorspace. This colormap is generic to be used for any sequential dataset.

#' @name oxy
#' @templateVar description The oxy colormap is sequential for most of the colormap, representing the normal range of oxygen saturation in ocean water, and diverging 80% of the way into the colormap to represent a state of supersaturation. The bottom 20% of the colormap is colored reddish to highlight hypoxic or low oxygen water, but to still print relatively seamlessly into grayscale in case the red hue is not important for an application. The top 20% of the colormap, after the divergence, is colored yellow to highlight the supersaturated water.

#' @name deep
#' @templateVar description The deep colormap is sequential from light yellow to potentially represent shallower water through pale green to increasingly dark blue and purple to represent increasing depth.

#' @name dense
#' @templateVar description The dense colormap is sequential with whitish-blue for low values and increasing in purple with increasing value, which could be used to represent an increase in water density.

#' @name algae
#' @templateVar description The algae colormap is sequential with whitish-green for low values and increasing in green with increasing value, which could be used to represent an increase in chlorophyll in the water.

#' @name matter
#' @templateVar description The matter colormap is sequential with whitish-yellow for low values and increasing in pink with increasing value, and could be used to represent an increase in material in the water.

#' @name turbid
#' @templateVar description The turbid colormap is sequential from light to dark brown and could be used to represent an increase in sediment in the water.

#' @name speed
#' @templateVar description The speed colormap is sequential from light greenish yellow representing low values to dark yellowish green representing large values. This colormap is the positive half of the \code{\link{delta}} colormap.

#' @name amp
#' @templateVar description The amp colormap is sequential from whitish to dark red and could be used to represent an increase in wave height values. This colormap is the positive half of the \code{\link{balance}} colormap.

#' @name tempo
#' @templateVar description The tempo colormap is sequential from whitish to dark teal and could be used to represent an increase in wave period values. This colormap is the negative half of the \code{\link{curl}} colormap.

#' @name rain
#' @templateVar description The rain colormap is sequential from light, dry colors to blue, wet colors, and could be used to plot amounts of rainfall.

#' @name phase
#' @templateVar description The phase colormap is circular, spanning all hues at a set lightness value. This map is intended to be used for properties such as wave phase and tidal phase which wrap around from 0° to 360° to 0° and should be represented without major perceptual jumps in the colormap.

#' @name topo
#' @templateVar description The topo colormap has two distinct parts: one that is shades of blue and yellow to represent water depths (this is the \code{\link{deep}} colormap) and one that is shades of browns and greens to represent land elevation.

#' @name balance
#' @templateVar description The balance colormap is diverging with dark blue to off-white to dark red representing negative to zero to positive values; this could be used to represent sea surface elevation, with deviations in the surface elevations as shades of color away from neutral off-white. In this case, shades of red have been chosen to represent sea surface elevation above the reference value (often mean sea level) to connect with warmer water typically being associated with an increase in the free surface.

#' @name delta
#' @templateVar description The delta colormap is diverging from darker blues to just off-white through shades of yellow green and could be used to represent diverging velocity values around a critical value (usually zero). This colormap was inspired by Francesca Samsel’s similar colormap, but generated from scratch using the \sQuote{viscm} tool.

#' @name curl
#' @templateVar description The curl colormap is diverging from darker teal to just off-white through shades of magenta and could be used to represent diverging vorticity values around a critical value (usually zero).

#' @name cmdiff
#' @templateVar description The diff colormap is diverging, with one side shades of blues and one side shades of browns.

#' @name tarn
#' @templateVar description The tarn colormap is diverging, with one side dry shades of browns and the other a range of greens and blues. The positive end of the colormap is meant to reflect the colors in rain and thus be a complementary colormap to rain for rain anomaly (around 0 or some other critical value).

#' @export
#' @name cmocean
cmocean <- function(name, clip = 0, start = clip/2, end = 1 - clip/2) {
	cols <- palettes[[name]]
	ncols <- nrow(cols)-1
	grDevices::colorRampPalette(
		grDevices::rgb(
			cols[1 + (ncols*start):(ncols*end),]
		)
	)
}