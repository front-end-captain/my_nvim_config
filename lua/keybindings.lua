vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

local pluginKeys = {}

map("n", "<leader>nl", ":nohlsearch<CR>", opt)

map("n", "<leader>sv", ":vsp<CR>", opt)
map("n", "<leader>sh", ":sp<CR>", opt)
map("n", "<leader>sc", "<C-w>c", opt)
map("n", "<leader>so", "<C-w>o", opt)

-- Alt + hjkl jump between windows
map("n", "<A-H>", "<C-w>h", opt)
map("n", "<A-J>", "<C-w>j", opt)
map("n", "<A-K>", "<C-w>k", opt)
map("n", "<A-L>", "<C-w>l", opt)

map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "<leader>s,", ":vertical resize -20<CR>", opt)
map("n", "<leader>s.", ":vertical resize +20<CR>", opt)
map("n", "<leader>sj", ":resize +10<CR>", opt)
map("n", "<leader>sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
map("n", "<leader>s=", "<C-w>=", opt)

-- open terminal
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- indent line
-- map("v", "<", "<gv", opt)
-- map("v", ">", ">gv", opt)
-- move current line
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- yank to system clipborad
map("v", "<leader>y", '"+y', opt)
-- paste from system clipborad
map("n", "<leader>p", '"+p', opt)

-- in visual mode, not paste while yank
map("v", "p", '"_dP', opt)

-- exit
-- map("n", "q", ":q<CR>", opt)
-- map("n", "qq", ":q!<CR>", opt)
-- map("n", "Q", ":qa!<CR>", opt)

-- insert mode, jump to line start and line end
-- map("i", "<C-h>", "<ESC>I", opt)
-- map("i", "<C-l>", "<ESC>A", opt)

-- jump to line start
map("n", "H", "^", opt)
-- delete to line end
map("n", "dH", "d^", opt)
-- yank to line end
map("n", "yH", "y^", opt)
-- jump to line end
map("n", "L", "$", opt)
-- delete to line end
map("n", "dL", "d$", opt)
-- yank to line end
map("n", "yL", "y$", opt)

-- bufferline
-- go to prev tab and next tab
map("n", "<leader>k", ":BufferLineCyclePrev<CR>", opt)
map("n", "<leader>j", ":BufferLineCycleNext<CR>", opt)
-- colose current active tab
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>q", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- find file
map("n", "<C-f>", ":Telescope find_files<CR>", opt)
-- global search
map("n", "<C-g>", ":Telescope live_grep<CR>", opt)
-- map("n", "<C-r>", ":Telescope resume<CR>", opt)
-- map("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", opt)
pluginKeys.telescopeList = {
	i = {
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
		["<Down>"] = "move_selection_next",
		["<Up>"] = "move_selection_previous",
		["<C-n>"] = "cycle_history_next",
		["<C-p>"] = "cycle_history_prev",
		["<C-c>"] = "close",
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}

-- nvim-treesitter
-- indent code
map("n", "<leader>fc", "gg=G", opt)
map(
	"n",
	"<leader>f",
	"<cmd>lua vim.lsp.buf.format({ filter = function(client) return client.name == 'null-ls' end })<CR>",
	opt
)
map("n", "zz", ":foldclose<CR>", opt)
map("n", "Z", ":foldopen<CR>", opt)

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>d", ":NvimTreeFocus<CR>", opt)
map("n", "<leader>H", ":NvimTreeResize +10<CR>", opt)
map("n", "<leader>L", ":NvimTreeResize -10<CR>", opt)
pluginKeys.nvimTreeList = {
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	{ key = "i", action = "toggle_ignored" }, -- Ignore (node_modules)
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	{ key = "<F5>", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
}

pluginKeys.mapLSP = function(mapbuf)
	-- rename
	mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
	-- code action
	mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
	-- go xx
	mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
	-- diagnostic
	mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
	mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
	mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
	mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opt)
	-- not used
	-- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
	-- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
	-- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
	-- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

pluginKeys.cmp = function(cmp)
	return {
		-- show complete list
		["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- hide complete list
		["<A-,>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
	}
end

return pluginKeys
