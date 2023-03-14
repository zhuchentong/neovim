local status, mason = pcall(require, "mason")
if not status then
  vim.notify("没有找到 mason")
  return
end

local status, mason_config = pcall(require, "mason-lspconfig")
if not status then
  vim.notify("没有找到 mason-lspconfig")
  return
end

local status, lspconfig = pcall(require, "lspconfig")
if not status then
  vim.notify("没有找到 lspconfig")
  return
end

-- :h mason-default-settings
mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
mason_config.setup({
  ensure_installed = {
    "tsserver",
    "tailwindcss",
    "bashls",
    "html",
    "cssls",
    "emmet_ls",
    "jsonls",
    "yamlls",
    "rust_analyzer",
    "volar"
  },
})


-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  tsserver = require("lsp.services.typescript"),
  tailwindcss = require("lsp.services.tailwindcss"),
  bashls = require("lsp.services.bash"),
  html = require("lsp.services.html"),
  cssls = require("lsp.services.css"),
  emmet_ls = require("lsp.services.emmet"),
  jsonls = require("lsp.services.json"),
  yamlls = require("lsp.services.yaml"),
  rust_analyzer = require("lsp.services.rust"),
  volar = require("lsp.services.volar")
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现on_setup 方法
    config.on_setup(lspconfig[name])
  else
    -- 使用默认参数
    lspconfig[name].setup({})
  end
end

require("lsp.ui")

