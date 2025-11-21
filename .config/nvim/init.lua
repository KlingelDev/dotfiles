-- nvim Configuration

-- disable netrw
-- vim.g.loaded_netrw = 0
-- vim.g.loaded_netrwPlug = 0

-- Packer
require('plugins')
require('pluginconf')

-- Paq
require "paq" {
  'savq/paq-nvim', -- Let Paq manage itself
  'rktjmp/lush.nvim',
  'stevearc/resession.nvim',
}

-- Vim plugs
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/pack')

Plug('ms-jpq/coq_nvim')
Plug 'ms-jpq/coq.thirdparty'
Plug 'ms-jpq/coq.artifacts'
Plug 'dhruvasagar/vim-table-mode'
-- Plug 'jamessan/vim-gnupg'
-- Plug('rust-lang/rust')
Plug('KlingelDev/psychotropic.nvim')
-- Plug('tikhomirov/vim-glsl')
Plug('sheerun/vim-polyglot')

vim.call('plug#end')

vim.g.coq_settings = { auto_start = 'shut-up'; }
local coq = require "coq"

-- lsp
-- vim.lsp.config('pyright', coq.lsp_ensure_capabilities())
-- vim.lsp.enable('pyright')

vim.g.python_highlight_all = true
vim.g.python_highlight_builtins = true

vim.opt.undolevels = 5000

vim.cmd("colorscheme psychotropic")
vim.opt.showtabline = 2

vim.opt.mouse = "nv"
vim.opt.number = true
vim.opt.syntax = "on"
vim.opt.hlsearch = false

vim.g.python_recommended_style = 0
vim.g.rust_recommended_style = 0

vim.opt.autoindent = true
vim.opt.expandtab = true
--vim.opt.smartindent = true
vim.opt.equalalways = false
vim.opt.sts = 2
vim.opt.shiftwidth = 2
vim.opt.sw = 2
vim.opt.tabstop = 2
vim.opt.list = true
vim.opt.cindent = true

vim.bo.autoindent = true
vim.bo.expandtab = true
vim.bo.cindent = true
vim.bo.sts = 2
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.sw = 2

-- Python Files
vim.api.nvim_create_autocmd({"BufWrite", "BufRead"}, {
  pattern = { "*.py" },
  callback = function()
    vim.cmd("syntax match Optris \"\\soptris\"")
    vim.cmd("syntax match Optris \"\\sotc\"")
    vim.cmd("syntax match Optris \"\\sotcsdk\"")
    vim.cmd("syntax match pythonCase \"\\scase\"")
    vim.cmd("syntax match pythonmatch \"\\smatch\"")
    vim.cmd("set indentkeys-=:")
    vim.cmd("set indentkeys-=<:>")
    vim.cmd("set formatoptions +=cro")
  end
})

-- Show tabs / trailing spaces etc
vim.opt.listchars = {
  tab = "»·",
  trail = "·",
}

vim.opt.backspace = "indent,eol,start"

-- at search
vim.opt.ignorecase = true

-- spelling
vim.opt.spelllang = "de,en"

vim.opt.ruler = true
vim.opt.textwidth = 80
vim.opt.tw = 80
vim.opt.colorcolumn = "80,100,110"
vim.opt.cc = "80,100,110"
vim.opt.ttyfast = true
vim.opt.indentkeys = "0{,0},0),0],0#,!^F,o,O,e"

-- no swap or backupfiles
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Add filetypes to syntax highlighting
vim.filetype.add({
  extension = {
    xaml = 'xml',
    yuck = 'lisp',
    tmpl = 'html',
    dockerfile = 'dockerfile',
  }
})

-- Session
vim.opt.sessionoptions =
  "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions,globals"

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

--
-- Commands
--
vim.api.nvim_create_user_command('SubEOLComment',
 string.format([[:1,$ s!\(\s\\+\|\)\(\w.*\)\s\(//.*\)$!\1\3\r\1\2!|norm!``]]), {})

vim.api.nvim_create_user_command('SubTrailingWhitespaces',
 string.format([[:1,$ s!\s\+$!!|norm!``]]), {})

vim.api.nvim_create_user_command('SubTabs',
 string.format([[:1,$ s!\t!  !g|norm!``]]), {})

vim.api.nvim_create_user_command('SubNightmares',
 string.format([[:1,$ s!\([A-Za-z0-9:"&*]\)\s\{2,\}!\1 !g|norm!``]]), {})

--
-- Keybinds
--

-- Unbind evil things
vim.api.nvim_set_keymap('n', "<F1>", "", { silent = true })
vim.api.nvim_set_keymap('n', "<c-w>q", "", { silent = true })
vim.api.nvim_set_keymap('i', "<c-w>q", "", { silent = true })
vim.api.nvim_set_keymap('v', "<c-w>q", "", { silent = true })

vim.api.nvim_set_keymap('n', "<c-w>d", "", { silent = true })
vim.api.nvim_set_keymap('i', "<c-w>d", "", { silent = true })
vim.api.nvim_set_keymap('v', "<c-w>d", "", { silent = true })

vim.api.nvim_set_keymap('n', "<c-o>", "", { silent = true })
vim.api.nvim_set_keymap('i', "<c-o>q", "", { silent = true })
vim.api.nvim_set_keymap('v', "<c-o>", "", { silent = true })

vim.api.nvim_set_keymap('n', "<c-i>", "", { silent = true })
vim.api.nvim_set_keymap('i', "<c-i>", "", { silent = true })
vim.api.nvim_set_keymap('v', "<c-i>", "", { silent = true })

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap( "n", "<F2>",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { silent = true })
vim.api.nvim_set_keymap( "n", "<C-e>",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { silent = true })

-- comments
vim.api.nvim_set_keymap( "v", "<c-c>", "gc", { silent = true })
vim.api.nvim_set_keymap( "v", "<c-b>", "gb", { silent = true })

-- Aerial
vim.api.nvim_set_keymap('n', "<F3>", ":AerialToggle<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<F4>", ":AerialNavToggle<CR>", { silent = true })

-- Tabs
vim.api.nvim_set_keymap( "n", "tn", ":tabnext<CR>", { silent = true })
vim.api.nvim_set_keymap( "n", "tp", ":tabprevious<CR>", { silent = true })
vim.api.nvim_set_keymap( "n", "tl", ":tablast<CR>", { silent = true })
vim.api.nvim_set_keymap( "n", "tf", ":tabfirst<CR>", { silent = true })
vim.api.nvim_set_keymap( "n", "tt", ":tabnew<CR>", { silent = true })

-- Coq
vim.api.nvim_set_keymap( "i", "<C-h>", "<Plug>(coc-snippets-select)", {})
vim.api.nvim_set_keymap( "i", "<C-l>", "g:coc_snippet_prev", {})

-- Resession
local resession = require("resession")
resession.setup({
  autosave = {
    enabled = true,
    interval = 60,
    notify = true,
  },
})

vim.api.nvim_create_user_command("LoadSession", function(opts)
  require("resession").load(opts.args)
end, {
  nargs = 1,
  complete = function(ArgLead, CmdLine, CursorPos)
    return require("resession").list()
  end
})

vim.api.nvim_create_user_command("SaveSession", function(opts)
  require("resession").save(opts.args)
end, {
  nargs = 1,
  complete = function(ArgLead, CmdLine, CursorPos)
    return require("resession").list()
  end
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    -- Always save a special session named "last"
    resession.save("last")
    resession.save("base")
  end,
})

-- local resession = require("resession")
-- resession.setup()

-- Resession does NOTHING automagically, so we have to set up some keymaps
vim.keymap.set("n", "<leader>ss", resession.save)
vim.keymap.set("n", "<leader>sl", resession.load)
vim.keymap.set("n", "<leader>sd", resession.delete)

-- Misc
