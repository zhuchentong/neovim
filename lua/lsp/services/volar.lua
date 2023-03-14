local opts = {
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}

return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
