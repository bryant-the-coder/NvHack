local markdown = {
	-- Header tags
	markdownH1 = { fg = C.red_1 },
	markdownH2 = { fg = C.red_1 },
	markdownH3 = { fg = C.red_1 },
	markdownH4 = { fg = C.red_1 },
	markdownH5 = { fg = C.red_1 },
	markdownH6 = { fg = C.red_1 },
	markdownHeadingDelimiter = { fg = C.red_1 },
	markdownHeadingRule = { fg = C.grey_3 },

	-- Bold and italic
	markdownBold = { fg = C.light_blue, style = "bold" },
	markdownItalic = { style = "italic" },

	-- Block quote which starts like this
	-- > bla bla bla
	markdownBlockquote = { fg = C.grey_1 },
	markdownBoldDelimiter = { fg = C.grey_1 },

	-- Code blocks which starts like this
	-- `bla bla bla`
	-- ```bla bla bla```
	markdownCode = { fg = C.green },
	markdownCodeBlock = { fg = C.green },
	markdownCodeDelimeter = { fg = C.green },

	markdownId = { fg = C.purple },
	markdownIdDelimeter = { fg = C.purple },
	markdownIdDeclaration = { fg = C.blue },

	-- Url form
	markdownUrl = { fg = C.cyan },

	markdownLinkDelimeter = { fg = C.purple },
	markdownLinkText = { fg = C.blue_3 },
	markdownListMarker = { fg = C.red },
	markdownOrderedListMarker = { fg = C.red },
	markdownRul = { fg = C.grey },
}

return markdown
