## インストールする

```bash
$ brew install neovim
```

## バージョンを確認する

```bash
$ nvim -v
```

## 設定ファイルを配置する

以下のディレクトリがなければ作成します。

```bash
$ mkdir ~/.config/nvim
```

[hisasann/neovim](https://github.com/hisasann/neovim) を clone したディレクトリに移動した以下を実行します。

```bash
$ ln -fs "$PWD/init.vim" ~/.config/nvim/init.vim
$ ln -fs "$PWD/dein.toml" ~/.config/nvim/dein.toml
$ ln -fs "$PWD/dein_lazy.toml" ~/.config/nvim/dein_lazy.toml
```

## python3をインストールする

[Shougo/deoplete.nvim: Dark powered asynchronous completion framework for neovim/Vim8](https://github.com/Shougo/deoplete.nvim)

は python3 が必要になるので、ここでインストールしておきます。

    [deoplete] deoplete requires Python3 support("+python3").

```bash
$ brew install python3
$ pip3 install -U neovim
```

もし、エラーが出てしまった場合は、エラー内容を解消し、以下を nvim に打ち込みます。

    :UpdateRemotePlugins

## dein.vimをインストールする

```bash
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# For example, we just use `~/.cache/dein` as installation directory
$ sh ./installer.sh ~/.cache/dein
```

## dein.vimのキャッシュをクリアする

```
:call dein#recache_runtimepath()
```

## dein.vimでモジュールたちをインストールする

```
:call dein#install()
```

## coc.vimで困ったら

```
:call coc#util#install()
```

## 参考記事

[Neovimのセットアップ方法(Mac) - Qiita](https://qiita.com/uhooi/items/8a023c24c004ec0c8b84)

[はじめてのNeoVim（初期設定編） - Qiita](https://qiita.com/hisayuki/items/99ea1b667de71e908891)

[MacでNeovimをPythonの開発環境にする](https://python.ms/neovim/)

## defx.vim参考記事

defx.vim 公式の設定たちよ

[defx.nvim/defx.txt at master · Shougo/defx.nvim](https://github.com/Shougo/defx.nvim/blob/master/doc/defx.txt)

[Defx.nvim を使う! | 完成形で未完成](https://tech.39.gy/terminal/defx/)

[【Vim】defx.nvimで高速でリッチなファイラを実現する(アイコン、git status表示) - Qiita](https://qiita.com/arks22/items/9688ec7f4cb43444e9d9)

[defxを使ってみる - 環境構築・零](https://takkii.hatenablog.com/entry/2018/08/19/133847)

[【vim】defx.nvimを設定！defx-git！defx-icon！](https://castleobj.com/defx/)
