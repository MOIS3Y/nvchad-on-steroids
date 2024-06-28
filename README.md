# NvChad on steroids

My configuration based on [NvChad starter](https://github.com/NvChad/starter)


Nothing special, a few additional plugins and preset settings.
`on steroids` is just a joke, maybe someday it will be true :)


I keep the NvChad configuration separate from the dotfiles
which are defined in the
[nixos-configurations](https://github.com/MOIS3Y/nixos-configurations) repo:


- I use [home-manager module nvchad4nix](https://github.com/MOIS3Y/nvchad4nix)
to add NvChad to user config
- it’s more convenient to do additional configuration in pure `.lua`
without mixing it with `.nix`
- I can branch and version the configuration and use it on different hosts
