-- explicit disable mason
-- not needed for NixOS, this can be used with programs.nix-ld.enable = true;

return {
  "mason-org/mason.nvim",
  enabled = false,
}