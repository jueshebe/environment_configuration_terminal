-- Define la ruta del archivo de sesión
local session_file = vim.fn.getcwd() .. '/session.vim'

-- Función para cargar el archivo de sesión si existe
local function load_session()
  if vim.fn.filereadable(session_file) == 1 then
    vim.cmd('silent! source ' .. session_file)
    print('Sesión cargada desde ' .. session_file)
  else
    print('No se encontró el archivo de sesión')
  end
end

-- Llama a la función para cargar el archivo de sesión al inicio
load_session()

-- Autocomando para guardar la sesión automáticamente al salir de Neovim
vim.api.nvim_create_autocmd("VimLeavePre", {
  pattern = "*",
  command = "mksession! " .. session_file
})
