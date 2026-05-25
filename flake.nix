{
  inputs = {
    # --- 1. Core ---

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    # --- 2. Platform Specific ---

    # Darwin
    nix-darwin.url = "github:nix-darwin/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    # # Asahi
    # apple-silicon-support.url = "github:nix-community/nixos-apple-silicon";
    # apple-silicon-support.inputs.nixpkgs.follows = "nixpkgs";

    # # WSL
    # nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    # nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";

    # --- 3. etc ---

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.inputs.home-manager.follows = "home-manager";

    vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {imports = [./nix];};
}
