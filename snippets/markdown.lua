return {
	s("end", t("<!-- end_slide -->")),
	s("pause", t("<!-- pause -->")),
	s("align", fmt([[<!-- alignment: {} -->]], c(1, { t("left"), t("center"), t("right") }))),
	s(
		"cll",
		fmt([[<!-- column_layout: [{},{}] -->]], {
			i(1),
			i(2),
		})
	),
	s(
		"col",
		fmt([[<!-- column: {} -->]], {
			i(1),
		})
	),
	s("res", t("<!-- reset_layout -->")),
	s(
		"ilist",
		fmt([[<!-- incremental_lists: {} -->]], {
			c(1, { t("true"), t("false") }),
		})
	),
}
