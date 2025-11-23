# Vim-garf

A Vim wrapper for running [garf](https://github.com/google/garf).

## Setup

1. Clone plugin into your `$HOME/.vim/pack/bundle/start/` folder or install it via Vundle:
```
Plugin 'AndreyMarkinPPC/vim-garf'
```

2. (Optional) Add your preferred defaults to `.vimrc`:

```
let g:garf_command="/path/to/garf"
```

3. Customizations:

```
" better logging
let g:garf_logger="rich"
```

## Commands

| Command          | Description                                                                                                                                                                                                                                                                            |
| :--------------  | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  |
| `:Garf`   | Runs `garf` command over the provided garf_config (specify as `g:garf_config` variable (`let g:garf_config=$HOME/path/to/garf_config.yaml`).                                                                        |

## Mappings

Plugin has several default mappings

```
nnoremap <silent> <localleader>grf :Garf<CR>
```
