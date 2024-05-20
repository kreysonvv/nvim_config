#!/usr/bin/env bash

# Скачиваем и устанавливаем в систему шрифт, потом его нужно выбрать в терминале
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
unzip JetBrainsMono.zip
sudo mv JetBrainsMono /usr/local/share/fonts
rm JetBrainsMono.zip
# Сохдаём необходимые файлы и папки
mkdir ~/.config/nvim ~/.config/nvim/lua ~/.config/nvim/lua/core ~/.config/nvim/lua/plugins
touch ~/.config/nvim/init.lua ~/.config/nvim/lua/core/plugins.lua
# Устанавливаем менеджер плагинов
cat > ~/.config/nvim/lua/core/plugins.lua <<EOF
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { 'phaazon/hop.nvim' },
})
EOF
# Подключаем плагины
cat > ~/.config/nvim/init.lua <<EOF
-- Basic
require('core.plugins')
EOF
