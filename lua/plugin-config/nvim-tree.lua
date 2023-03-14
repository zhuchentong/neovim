local status, nvim_tree = pcall(require, "nvim-tree")

if not status then
    vim.notify("没有找到 nvim-tree")
  return
end

require('keybindings').nvimTree()

-- 列表操作快捷键
local list_keys = 

nvim_tree.setup({
    -- 不显示 git 状态图标
    git = {
        enable = false,
    },
    -- project plugin 需要这样设置
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    -- 隐藏 .文件 和 node_modules 文件夹
    filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },
    view = {
        -- 宽度
        width = 30,
        -- 也可以 'right'
        side = 'left',
        -- 隐藏根目录
        hide_root_folder = false,
        -- 自定义列表中快捷键
        mappings = {
            custom_only = false,
            list = require('keybindings').nvimTreeMappings,
        },
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件时关闭
            quit_on_open = false,
        },
    },
    -- wsl install -g wsl-open
    -- https://github.com/4U6U57/wsl-open/
    system_open = {
        cmd = 'open', -- mac 直接设置为 open
    },
})

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})

local function open_nvim_tree(data)
   -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  if not directory and no_name then
    return
  end

  -- open the tree, find the file but don't focus it
  require("nvim-tree.api").tree.toggle({ focus = false , find_file = true })
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })


