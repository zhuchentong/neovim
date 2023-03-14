

local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

db.custom_header = {
  [[]],
  [[                                                   ]],
  [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
  [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
  [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
  [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
  [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
  [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
  [[                                                   ]],
  [[]],
}

db.setup({
  theme = "hyper",
  config = {
    week_header = {
      enable = true,
    },
    project = {
      enable = true,
    },
    header = db.custom_header,
    shortcut = {
      {
        desc = "Projects",
        group = "Normal",
        action = "Telescope projects",
        key="p"
      },
      {
        desc = "Recently files",
        action = "Telescope oldfiles",
        group = "Normal",
        key="r"
      },
      {
        desc = "Edit keybindings",
        action = "edit ~/.config/nvim/lua/keybindings.lua",
        group = "Normal",
        key="s"
      },
      {
        desc = "Edit Projects",
        action = "edit ~/.local/share/nvim/project_nvim/project_history",
        group = "Normal",
        key="e"
      },
    },
    project = { limit = 4, icon = "🎵" },
    mru = { limit = 4, icon = "🕹️" },
    footer = {
      "",
      "",
      "业精于勤，荒于嬉；行成于思，毁于随",
    }
  },
})

