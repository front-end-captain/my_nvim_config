# My neovim config
> neovim >= 0.7

## config overview

```
├── README.md
├── init.lua
├── lua
│   ├── basic.lua
│   ├── keybindings.lua
│   ├── lsp
│   │   ├── config
│   │   ├── cmp.lua
│   │   ├── config
│   │   ├── setup.lua
│   │   └── ui.lua
│   ├── plugin-config
```

+ init.lua: all config entry file, and require other config file
+ basic.lua: basic config and override some default config
+ colorschema.lua: setup theme
+ keybindings.lua: setup key map
+ plugins.lua: manage which plugin installed
+ lsp: about setup language server protocol
  + config: include each language server config
  + cmp.lua: syntax complete
  + setup.lua: config builtin language server protocol
  + ui.lua: enhance language server protocol and ui beautify
  + formatter.lua: format code
+ plugin-config: include each plugin config


## usage

```shell
mkdir -p ~/.config/nvim
git clone https://github.com/front-end-captain/my_nvim_config.git ~/.config/nvim
```

install packer
```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

