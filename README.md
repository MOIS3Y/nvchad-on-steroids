# NvChad on steroids

My `neovim` configuration based on [NvChad starter](https://github.com/NvChad/starter)

**Required** `>=neovim v0.11.0`

Nothing special, a few additional plugins and preset settings.
`on steroids` is just a joke, maybe someday it will be true :)


## Plugins
- default `NvChad` plugins collection
- lukas-reineke/virt-column.nvim
- m4xshen/smartcolumn.nvim
- HiPhish/rainbow-delimiters.nvim
- echasnovski/mini.indentscope


## LSP servers
- bashls
- blueprint_ls
- cssls
- docker_compose_language_service
- dockerls
- jsonls
- html
- nixd
- vala_ls
- emmet_language_server
- ts_ls
- pylsp


## Nix notes
I keep the NvChad configuration separate from the dotfiles
which are defined in the
[nixos-configurations](https://github.com/MOIS3Y/nixos-configurations) repo:


- I use [home-manager module nix4nvchad](https://github.com/nix-community/nix4nvchad)
to add NvChad to user config
- it’s more convenient to do additional configuration in pure `.lua`
without mixing it with `.nix`
- I can branch and version the configuration and use it on different hosts


## Manual installation
- Follow [official docs](https://nvchad.com/docs/quickstart/install) installation steps
- Replace `github:NvChad/starter` url on `github:MOIS3Y/nvchad-on-steroids` in commands