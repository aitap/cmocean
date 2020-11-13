scale_fill_cmocean <- function(
	..., alpha = 1, start = 0, end = 1, direction = 1,
	discrete = FALSE, name = 'thermal'
) {
	loadNamespace('ggplot2')
	if (discrete) {
		ggplot2::discrete_scale(
			'fill', 'cmocean', cmocean(
				name = name, start = start, end = end,
				direction = direction, alpha = alpha
			),
			...
		)
	} else {
		ggplot2::scale_fill_gradientn(
			colours = cmocean(
				name = name, start = start, end = end,
				direction = direction, alpha = alpha
			)(256),
			...
		)
	}
}

scale_colour_cmocean <- scale_color_cmocean <- function(
	..., alpha = 1, start = 0, end = 1, direction = 1,
	discrete = FALSE, name = 'thermal'
) {
	loadNamespace('ggplot2')
	if (discrete) {
		ggplot2::discrete_scale(
			'colour', 'cmocean', cmocean(
				name = name, start = start, end = end,
				direction = direction, alpha = alpha
			),
			...
		)
	} else {
		ggplot2::scale_color_gradientn(
			colours = cmocean(
				name = name, start = start, end = end,
				direction = direction, alpha = alpha
			)(256),
			...
		)
	}
}
