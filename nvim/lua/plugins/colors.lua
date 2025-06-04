-- return {
-- 	"ellisonleao/gruvbox.nvim",
-- 	lazy = false,
-- 	name = "gruvbox",
-- 	priority = 997,
-- 	config = function()
-- 		vim.cmd.colorscheme("gruvbox")
-- 	end,
-- }

return {
    "rebelot/kanagawa.nvim",
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "dragon",              -- Load "wave" theme
    background = {               -- map the value of 'background' option to a theme
        dark = "dragon",           -- try "dragon" !
        light = "lotus"
    },
    config = function()
        vim.cmd.colorscheme("kanagawa")
    end,

}

-- return {
--     "AlphaTechnolog/pywal.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--          Set up pywal and load the colors
--         require("pywal").setup()

--     end,
-- }

