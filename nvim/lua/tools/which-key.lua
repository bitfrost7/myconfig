return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    delay = vim.o.timeoutlen,
	triggers = {
		{ "<auto>", mode = "nixso" },
	},
	plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				motions = false,
				operators = false,
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
	},
	win = {
			border = "none",
			padding = { 1, 2 },
			wo = { winblend = 0 },
	},
	expand = 1,
	spec = {
	  { "<leader>1", hidden = true },
      { "<leader>c", group = "Code/代码" },
      { "<leader>d", group = "Diagnostic/诊断" },
      { "<leader>s", group = "Search/查找", icon = " " },
      { "<leader>w", group = "Window/窗口", icon = " " },
      { "<leader>b", group = "Buffer/标签页", icon = "󰓩 " },
    },
	filter = function(mapping)
      return not mapping.lhs:match("^%s%d$")
    end
  }
}
