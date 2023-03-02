<img width="1415" alt="neovim" src="https://user-images.githubusercontent.com/64143/140373864-f8f11924-7b3f-4605-91a9-801e493071cf.png">

<img width="1732" alt="neovim" src="https://user-images.githubusercontent.com/64143/184177280-309e8cbf-e4d2-4471-aa04-7e0114026856.png">


[How to my coding style using Neovim, tmux, iTerm2 with fish - YouTube](https://www.youtube.com/watch?v=gsc0Mw8y-cY)

# My neovim settings

## Plugins

* [wbthomason/packer.nvim: A use-package inspired plugin manager for Neovim. Uses native packages, supports Luarocks dependencies, written in Lua, allows for expressive config](https://github.com/wbthomason/packer.nvim)
* [nvim-telescope/telescope.nvim: Find, Filter, Preview, Pick. All lua, all the time.](https://github.com/nvim-telescope/telescope.nvim)
  * [nvim-telescope/telescope-file-browser.nvim: File Browser extension for telescope.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim)
* [nvim-lualine/lualine.nvim: A blazing fast and easy to configure neovim statusline plugin written in pure lua.](https://github.com/nvim-lualine/lualine.nvim)
* [L3MON4D3/LuaSnip: Snippet Engine for Neovim written in Lua.](https://github.com/L3MON4D3/LuaSnip)
* [windwp/nvim-autopairs: autopairs for neovim written by lua](https://github.com/windwp/nvim-autopairs)
* [onsails/lspkind.nvim: vscode-like pictograms for neovim lsp completion items](https://github.com/onsails/lspkind.nvim)
* [windwp/nvim-ts-autotag: Use treesitter to auto close and auto rename html tag](https://github.com/windwp/nvim-ts-autotag)
* [nvim-treesitter/nvim-treesitter: Nvim Treesitter configurations and abstraction layer](https://github.com/nvim-treesitter/nvim-treesitter)
  * `brew install tree-sitter`
* [akinsho/bufferline.nvim: A snazzy bufferline for Neovim](https://github.com/akinsho/bufferline.nvim)
* [neovim/nvim-lspconfig: Quickstart configs for Nvim LSP](https://github.com/neovim/nvim-lspconfig) - TypeScript
  * [glepnir/lspsaga.nvim: neovim lsp plugin](https://github.com/glepnir/lspsaga.nvim)
  * [williamboman/nvim-lsp-installer: Neovim plugin that allow you to seamlessly manage LSP servers with :LspInstall. With full Windows support! Further development has moved to https://github.com/williamboman/mason.nvim!](https://github.com/williamboman/nvim-lsp-installer)
    * `npm install -g typescript typescript-language-server`
  * [sumneko/lua-language-server: A language server that offers Lua language support - programmed in Lua](https://github.com/sumneko/lua-language-server)
    * `brew install lua-language-server`
* [hrsh7th/nvim-cmp: A completion plugin for neovim coded in Lua.](https://github.com/hrsh7th/nvim-cmp) - IntelliSense
* [jose-elias-alvarez/null-ls.nvim: Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.](https://github.com/jose-elias-alvarez/null-ls.nvim) - formatter
  * [MunifTanjim/prettier.nvim: Prettier plugin for Neovim's built-in LSP client.](https://github.com/MunifTanjim/prettier.nvim)
  * [fsouza/prettierd: prettier, as a daemon, for ludicrous formatting speed.](https://github.com/fsouza/prettierd)
    * `npm install -g @fsouza/prettierd`
  * [JohnnyMorganz/StyLua: An opinionated Lua code formatter](https://github.com/JohnnyMorganz/StyLua)
    * `cargo install stylua`
    * Execute formatting `;a`

## Shell setup

### Dotfiles

[hisasann/dotfile](https://github.com/hisasann/dotfile)

* [fish shell](https://fishshell.com/)
  * [jorgebucaran/fisher: A plugin manager for Fish.](https://github.com/jorgebucaran/fisher)
* [ryanoasis/nerd-fonts: Iconic font aggregator, collection, & patcher. 3,600+ icons, 50+ patched fonts: Hack, Source Code Pro, more. Glyph collections: Font Awesome, Material Design Icons, Octicons, & more](https://github.com/ryanoasis/nerd-fonts)
* [jethrokuan/z: Pure-fish z directory jumping](https://github.com/jethrokuan/z)
* [exa · a modern replacement for ls](https://the.exa.website/) - Awesome ls command
* [jesseduffield/lazygit: simple terminal UI for git commands](https://github.com/jesseduffield/lazygit)
* [hisasann/ide](https://github.com/hisasann/ide) - tmux の画面分割いい感じにする shell

# Neovim setup

## Install Neovim

```bash
$ brew install neovim
```

## Install Neovim v0.5 or higher

If you want to use the version that supports lua, click here.

If it is already included, uninstall it and then install it.

We start with `unlink`, but if you have never installed neovim via brew, you only need to `install`.

```
$ brew unlink neovim
$ brew uninstall --force neovim
$ brew install --HEAD neovim
$ brew link neovim
```

If you get an Xcode error, do the following

```
$ sudo rm -rf /Library/Developer/CommandLineTools
$ sudo xcode-select --install
```

If you have not yet installed neovim, run this command.

```
$ brew install --HEAD neovim
```

## For init.lua configuration files

```bash
git clone git@github.com:hisasann/neovim.git ~/.config/nvim
```

### [Legacy]For init.vim configuration files

If the following directories do not exist, create them.

```bash
$ mkdir ~/.config/nvim
```

Clone [hisasann/neovim](https://github.com/hisasann/neovim) and execute the following once you are in that directory.

```bash
$ cd vim
$ ln -fs "$PWD/init.vim" ~/.config/nvim/init.vim
$ ln -fs "$PWD/dein.toml" ~/.config/nvim/dein.toml
$ ln -fs "$PWD/dein_lazy.toml" ~/.config/nvim/dein_lazy.toml
```

If you get an error with defx.nvim, etc., running the following on neovim may fix the problem.

    :UpdateRemotePlugins

### [For init.vim]Install dein.vim

```bash
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# For example, we just use `~/.cache/dein` as installation directory
$ sh ./installer.sh ~/.cache/dein
```

To clear the cache of dein.vim

```
:call dein#recache_runtimepath()
```

To install modules with dein.vim

```
:call dein#install()
```

To update dein.vim modules

```
:call dein#update()
```

## Type checking with nvim-lspconfig

### Built-in commands

If `lsp` is not working properly, you may want to check with the following command.

* `:LspInfo` shows the status of active and configured language servers.

The following support tab-completion for all arguments:

* `:LspStart <config_name>` Start the requested server name. Will only succesfully start if the command detects a root directory matching the current config. Pass `autostart = false` to your `.setup{}` call for a language server if you would like to launch clients solely with this command. Defaults to all servers matching current buffer filetype.
* `:LspStop <client_id>` Defaults to stopping all buffer clients.
* `:LspRestart <client_id>` Defaults to restarting all buffer clients.

[neovim/nvim-lspconfig: Quickstart configurations for the Nvim LSP client](https://github.com/neovim/nvim-lspconfig)

### lspsaga.nvim

This is useful because it can produce floating windows, etc., which was not possible with coc.nvim.

[glepnir/lspsaga.nvim: neovim lsp plugin](https://github.com/glepnir/lspsaga.nvim)

### What is required for TypeScript type checking.

If `typescript typescript-language-server` is not installed globally, then

```
client 1 quit with exit code 126 and signal 0
If not, you will get error messages like
```

error message will appear in the status bar.

Also, if you are using `.node-version` or other node version control, you will need to install the following in multiple npm environments.

If lsp does not work properly, make a habit of typing

```
npm i -g typescript typescript-language-server
```

[theia-ide/typescript-language-server: TypeScript & JavaScript Language Server](https://github.com/theia-ide/typescript-language-server)

### Learn Lua

If you want to learn Lua, read the following README, as you will be able to write neovim configuration files in **Lua**.

[nvim-lua-guide-ja/README.ja.md at master · willelz/nvim-lua-guide-ja](https://github.com/willelz/nvim-lua-guide-ja/blob/master/README.ja.md)

## [VimコマンドやTipsをまとめてみたよ！](https://github.com/hisasann/dotfile/wiki)

## 🍟 Author

- [github/hisasann](https://github.com/hisasann)
- [twitter/hisasann](https://twitter.com/hisasann)

## 🥫 License

MIT © [hisasann (Yoshiyuki Hisamatsu)](https://github.com/hisasann)
