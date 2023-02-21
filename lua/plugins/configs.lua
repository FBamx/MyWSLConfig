local configs = {}

configs.packer_init = function()

  return {
    auto_clean = true,
    compile_on_sync = true,
    git = { clone_timeout = 6000 },
    display = {
      working_sym = "ﲊ",
      error_sym = "✗ ",
      done_sym = " ",
      removed_sym = " ",
      moved_sym = "",
      open_fn = function()
        return require("packer.util").float { border = "single" }
      end,
    },
  }

end


configs.gruvbox = function()

  local gruvbox = require("gruvbox")

  gruvbox.setup {
    undercurl = true,
    underline = true,
    bold = true,
    italic = false,
    strikethrough = false,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = false,
    overrides = {
      GruvboxRedSign = { bg = "none" },
      GruvboxGreenSign = { bg = "none" },
      GruvboxYellowSign = { bg = "none" },
      GruvboxBlueSign = { bg = "none" },
      GruvboxPurpleSign = { bg = "none" },
      GruvboxAquaSign = { bg = "none" },
      GruvboxOrangeSign = { bg = "none" }
    },
    contrast = "soft",
    dim_inactive = false,
    transparent_mode = false,
  }

  -- vim.cmd[[colorscheme gruvbox]]
  vim.cmd.colorscheme "gruvbox"
  -- vim.opt.background = "dark" -- set this to dark or light
  -- vim.cmd.colorscheme "oxocarbon"

end

configs.dashboard = function()

  local dashboard = require("dashboard")

  dashboard.custom_header = {
    "                                                   ",
    "                                                   ",
    "                                                   ",
    "                                                   ",
    "                                                   ",
    "                                                   ",
    "                                                   ",
    " ██▓ ███▄ ▄███▓ ██▀███   ██▒   █▓ ██▀███    ██████ ",
    "▓██▒▓██▒▀█▀ ██▒▓██ ▒ ██▒▓██░   █▒▓██ ▒ ██▒▒██    ▒ ",
    "▒██▒▓██    ▓██░▓██ ░▄█ ▒ ▓██  █▒░▓██ ░▄█ ▒░ ▓██▄   ",
    "▒██▒▓██    ▓██░▓██ ░▄█ ▒ ▓██  █▒░▓██ ░▄█ ▒░ ▓██▄   ",
    "░██░▒██    ▒██ ▒██▀▀█▄    ▒██ █░░▒██▀▀█▄    ▒   ██▒",
    "░██░▒██▒   ░██▒░██▓ ▒██▒   ▒▀█░  ░██▓ ▒██▒▒██████▒▒",
    "░▓  ░ ▒░   ░  ░░ ▒▓ ░▒▓░   ░ ▐░  ░ ▒▓ ░▒▓░▒ ▒▓▒ ▒ ░",
    " ▒ ░░  ░      ░  ░▒ ░ ▒░   ░ ░░    ░▒ ░ ▒░░ ░▒  ░ ░",
    " ▒ ░░      ░     ░░   ░      ░░    ░░   ░ ░  ░  ░  ",
    " ░         ░      ░           ░     ░           ░  ",
    "                             ░                     "
  }

  dashboard.custom_center = {
    {
      icon = " ",
      desc = " ",
      action = "qa",
      shortcut = " "
    }
  }

end


configs.alpha = function ()

  local alpha = require("alpha")

  alpha.setup(require'alpha.themes.dashboard'.config)

end


configs.transparent = function()

  local transparent = require("transparent")

  transparent.setup {
    enable = true
  }

end


configs.devicons = function()

  local devicons = require("nvim-web-devicons")

  devicons.setup {
    override = {
      js = {
        icon = "",
        color = "#FFE800",
        name = "Js"
      },
      ts = {
        icon = "ﯤ",
        color = "#519aba",
        name = "Ts"
      }
    }
  }

end


configs.staline = function()

  local staline = require("staline")

  staline.setup {
    defaults = {
      true_colors = true,
      line_column = " [%l/%L] :%c  ",
      branch_symbol = " ",
      left_separator = "",
      right_separator = "",
      cool_symbol     = "",       -- Change this to override default OS icon.
    },

    mode_colors = {
      n = "#cccccc",
      i = "#ff6b6b",
      c = "#ffbc62",
      v = "#6b6bff"
    },

    sections = {
      left = { "- ", "-mode", "left_sep_double", " ", "file_name", " ", "lsp", "branch" },
      mid  = {},
      right = { "cool_symbol", "right_sep_double", "-line_column" }
    }
  }

end


configs.indent_blankline = function()

  local indent_blankline = require("indent_blankline")

  indent_blankline.setup {
    char = "▏"
  }

end


configs.todo_comments = function()

  local todo = require("todo-comments")

  todo.setup({
    signs = true,
    keywords = {
      NOTE = { icon = " ", color = "hint" },
      TODO = { icon = " ", color = "info" },
      WARN = { icon = " ", color = "warning" },
      FIX = { icon = " ", color = "error" },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      HACK = { icon = " ", color = "warning" },
    },
    colors = {
      hint = { "DiagnosticHint", "#10B981" },
      info = { "DiagnosticInfo", "#6b6bff" },
      warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
      error = { "DiagnosticError", "ErrorMsg", "#ff6b6b" }
    },
  })

end

configs.treesitter = function()

  local nvim_treesitter = require("nvim-treesitter.configs")

  local options = {
    ensure_installed = {
      "lua",
      "go",
      "python",
      "java",
      "javascript",
      "vim",
      "regex",
      "bash",
      "markdown",
      "markdown_inline",
      "rust"
    },

    highlight = {
      enable = true,
      use_languagetree = true,
    },

    rainbow = {
      enable = true,
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
    },

    indent = {
      enable = true,
    },
  }

  nvim_treesitter.setup(options)

end


configs.telescope = function()

  local telescope = require("telescope")

  telescope.setup {
    defaults = {
      prompt_prefix = "   ", selection_caret = " ",
      sorting_strategy = "ascending",
      layout_config = { prompt_position = "top" }
    },
  }

  telescope.load_extension("file_browser")
  telescope.load_extension("refactoring")

end


configs.lspconfig = function()

  vim.diagnostic.config({
    virtual_text = {
      prefix = ""
    },
    underline = {Error=true},
    float = {
      header = "",
      focusable = false,
      prefix = function(_, _, _) return "" , "String" end,
      suffix = ""
    }
  })

  local signs = { Error = "", Warn  = "", Hint  = "", Info  = "", other = "﫠" }

  for name, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. name
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  local on_attach = function(client, bufnr)
  end

  local lspconfig = require("lspconfig")

  local lsp_flags = {
    debounce_text_changes = 150,
  }

  capabilities = vim.lsp.protocol.make_client_capabilities()

  lspconfig['sumneko_lua'].setup {
    on_attach = on_attach,
    capabilities = capabilities,

    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  }

  lspconfig['pyright'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
  }

  lspconfig['gopls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
  }

  lspconfig['jdtls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
  }

  lspconfig['rust_analyzer'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
  }

  lspconfig['yamlls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
      yaml = {
        schemas = {
          ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
        },
      },
    }
  }

end


configs.lspconfig_w_mason = function()

  local mason = require("mason-lspconfig")

  mason.setup({
    -- list of servers for mason to install
    ensure_installed = {
      "gopls",
      "jdtls",
      "pyright",
      "quick_lint_js",
      -- "sumneko_lua",
      "lua-language-server",
      "yamlls",
      "rust_analyzer"
    },
    -- auto-install configured servers (with lspconfig)
    automatic_installation = true, -- not the same as ensure_installed
  })
end


configs.cmp = function()

  local cmp = require("cmp")

  vim.o.completeopt = "menu,menuone,noselect"

  local function border(hl_name)
    return {
      { "╭", hl_name },
      { "─", hl_name },
      { "╮", hl_name },
      { "│", hl_name },
      { "╯", hl_name },
      { "─", hl_name },
      { "╰", hl_name },
      { "│", hl_name },
    }
  end

  local cmp_window = require "cmp.utils.window"

  cmp_window.info_ = cmp_window.info
  cmp_window.info = function(self)
    local info = self:info_()
    info.scrollable = false
    return info
  end

  cmp.setup {
    window = {
      completion = {
        border = border "CmpBorder",
        winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
      },
      documentation = {
        border = border "CmpDocBorder",
      },
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    formatting = {
      format = function(_, vim_item)
        local icons = require("plugins.icons").lspkind
        vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
        return vim_item
      end,
    },
    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif require("luasnip").expand_or_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        else
          fallback()
        end
      end, {
          "i",
          "s",
        }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif require("luasnip").jumpable(-1) then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
        else
          fallback()
        end
      end, {
          "i",
          "s",
        }),
    },
    sources = {
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
    },
  }

end


configs.luasnip = function()

  local luasnip = require("luasnip")
  local types = require("luasnip.util.types")

  luasnip.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { "●", "GruvboxOrange" } },
        },
      },
    },
  }

  require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.luasnippets_path or "" }
  require("luasnip.loaders.from_vscode").lazy_load()

  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
      if
        require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require("luasnip").session.jump_active
      then
        require("luasnip").unlink_current()
      end
    end,
  })

end


configs.noice = function()

  require("notify").setup {
    background_colour = "#000000",
  }

  require("noice").setup {
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
    },
  }

end


configs.dap = function()

  local dap = require("dap")
  local dapui = require("dapui")

  dap.adapters.delve = {
    type = 'server',
    port = '${port}',
    executable = {
      command = 'dlv',
      args = {'dap', '-l', '127.0.0.1:${port}'},
    }
  }

  -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
  dap.configurations.go = {
    {
      type = "delve",
      name = "Debug",
      request = "launch",
      program = "main.go"
    },
    {
      type = "delve",
      name = "Debug test", -- configuration for debugging test files
      request = "launch",
      mode = "test",
      program = "${file}"
    },
    -- works with go.mod packages and sub packages
    {
      type = "delve",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}"
    },
  }

  local dap_breakpoint_color = {
    breakpoint = {
      ctermbg=0,
      fg='#993939',
      -- bg='#31353f',
    },
    logpoing = {
      ctermbg=0,
      fg='#61afef',
      -- bg='#31353f',
    },
    stopped = {
      ctermbg=0,
      fg='#98c379',
      -- bg='#31353f'
    },
  }

  vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
  vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoing)
  vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)

  local dap_breakpoint = {
    error = {
      -- text = "",
      text = "",
      texthl = "DapBreakpoint",
      linehl = "DapBreakpoint",
      numhl = "DapBreakpoint",
    },
    condition = {
      text = 'ﳁ',
      texthl = 'DapBreakpoint',
      linehl = 'DapBreakpoint',
      numhl = 'DapBreakpoint',
    },
    rejected = {
      text = "",
      texthl = "DapBreakpint",
      linehl = "DapBreakpoint",
      numhl = "DapBreakpoint",
    },
    logpoint = {
      text = '',
      texthl = 'DapLogPoint',
      linehl = 'DapLogPoint',
      numhl = 'DapLogPoint',
    },
    stopped = {
      -- text = '',
      text = "",
      texthl = 'DapStopped',
      linehl = 'DapStopped',
      numhl = 'DapStopped',
    },
  }

  vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
  vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
  vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
  vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
  vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)

  -- start/close dapui when debugging session initialized/terminated
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open {}
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close {}
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close {}
  end

end


configs.dapui = function()

  local dapui = require("dapui")

  dapui.setup {
    icons = { expanded = "", collapsed = "", current_frame = "" },
    mappings = {
      -- Use a table to apply multiple mappings
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
      toggle = "t",
    },
    expand_lines = vim.fn.has("nvim-0.7") == 1,
    layouts = {
      {
        elements = {
          "breakpoints",
          "stacks",
          { id = "scopes", size = 0.25 },
          "watches",
        },
        size = 40, -- 40 columns
        position = "left",
      },
      {
        elements = {
          "repl",
          "console",
        },
        size = 0.25, -- 25% of total lines
        position = "bottom",
      },
    },
    controls = {
      enabled = true,
      element = "repl",
      icons = {
        pause = "",
        play = "",
        step_into = "",
        step_over = "",
        step_out = "",
        step_back = "",
        run_last = "",
        terminate = "",
      },
    },
    floating = {
      max_height = nil, -- These can be integers or a float between 0 and 1.
      max_width = nil, -- Floats will be treated as percentage of your screen.
      border = "single", -- Border style. Can be "single", "double" or "rounded"
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    windows = { indent = 1 },
    render = {
      max_type_length = nil, -- Can be integer or nil.
      max_value_lines = 100, -- Can be integer or nil.
    }
  }

end


configs.nvim_tree = function()

  local tree = require("nvim-tree")

  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  vim.opt.termguicolors = true

  tree.setup{
    filters = {
      dotfiles = false,
      exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
    },
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = false,
    },
    view = {
      adaptive_size = true,
      side = "left",
      width = 25,
      hide_root_folder = true,
    },
    git = {
      enable = false,
      ignore = true,
    },
    filesystem_watchers = {
      enable = true,
    },
    actions = {
      open_file = {
        resize_window = true,
      },
    },
    renderer = {
      highlight_git = false,
      highlight_opened_files = "none",

      indent_markers = {
        enable = false,
      },

      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = false,
        },

        glyphs = {
          default = "",
          symlink = "",
          folder = {
            default = "",
            empty = "",
            empty_open = "",
            open = "",
            symlink = "",
            symlink_open = "",
            arrow_open = "",
            arrow_closed = "",
          },
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
  }

end


configs.hop = function()

  local hop = require("hop")

  hop.setup { keys = 'etovxqpdygfblzhckisuran' }

end


configs.isBufValid = function(bufnr)

  return vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted

end


configs.bufilter = function()

  local bufs = vim.t.bufs or nil

  if not bufs then
    return {}
  end

  for i = #bufs, 1, -1 do
    if not configs.isBufValid(bufs[i]) then
      table.remove(bufs, i)
    end
  end

  return bufs

end


configs.bufferPrev = function()

  local bufs = configs.bufilter() or {}
  for i, v in ipairs(bufs) do
    if vim.api.nvim_get_current_buf() == v then
      vim.cmd(i == 1 and "b" .. bufs[#bufs] or "b" .. bufs[i - 1])
      break
    end
  end

end


configs.closeBuffer = function(bufnr)

  if vim.bo.buftype == "terminal" then
    vim.cmd(vim.bo.buflisted and "set nobl | enew" or "hide")
  else
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    configs.bufferPrev()
    vim.cmd("confirm bd" .. bufnr)
  end

end

configs.sessionManager = function ()

  local session_manager = require("session_manager")
  local path = require("plenary.path")

  session_manager.setup{
    sessions_dir = path:new(vim.fn.stdpath('data'), 'sessions'),
    path_replacer = '__',
    colon_replacer = '++',
    autoload_mode = require('session_manager.config').AutoloadMode.LastSession,
    autosave_last_session = true,
    autosave_ignore_not_normal = true,
    autosave_ignore_dirs = {},
    autosave_ignore_filetypes = {
      'gitcommit',
    },
    autosave_ignore_buftypes = {},
    autosave_only_in_session = false,
    max_path_length = 80,
  }

end

configs.bufferline = function()

  local bufferline = require("bufferline")

  bufferline.setup {
    options = {
      mode = "buffers",
      numbers = "none",
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      left_mouse_command = "buffer %d",
      middle_mouse_command = nil,
      indicator = {
        icon = '▎',
        style = 'icon',
      },
      buffer_close_icon = '',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 18,
      max_prefix_length = 15,
      truncate_names = true,
      tab_size = 18,
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true
        }
      },
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_buffer_default_icon = true,
      show_close_icon = true,
      show_tab_indicators = true,
      show_duplicate_prefix = true,
      separator_style = "slack",
      persist_buffer_sort = true,
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      hover = {
        enabled = true,
        delay = 200,
        reveal = {'close'}
      },
    }
  }

end


configs.autopairs = function()

  local autopairs = require("nvim-autopairs")
  local cmp = require("cmp")

  local options = {
    fast_wrap = {},
    disable_filetype = { "TelescopePrompt", "vim" },
  }

  autopairs.setup(options)

  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

end


configs.toggleterm = function()

  local toggleterm = require("toggleterm")

  toggleterm.setup{
    open_mapping = [[<a-i>]],
    terminal_mappings = true,
    insert_mappings = true,
    direction = "float"
  }

end


configs.refactoring = function()

  local ok, refactoring = pcall(require, "refactoring")
  if not ok then
    return
  end

  refactoring.setup{
    prompt_func_return_type = {
      go = false,
      java = false,

      cpp = false,
      c = false,
      h = false,
      hpp = false,
      cxx = false,
    },
    prompt_func_param_type = {
      go = false,
      java = false,

      cpp = false,
      c = false,
      h = false,
      hpp = false,
      cxx = false,
    },
    printf_statements = {},
    print_var_statements = {},
  }

  -- Remaps for the refactoring operations currently offered by the plugin
  vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
  vim.api.nvim_set_keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
  vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
  vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

  -- Extract block doesn't need visual mode
  vim.api.nvim_set_keymap("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {noremap = true, silent = true, expr = false})
  vim.api.nvim_set_keymap("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], {noremap = true, silent = true, expr = false})

  -- Inline variable can also pick up the identifier currently under the cursor without visual mode
  vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
end


configs.leap = function()

  local leap = require("leap")
  leap.add_default_mappings()

end

return configs
