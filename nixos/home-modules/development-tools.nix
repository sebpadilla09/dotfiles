{ config, pkgs, ... }:

{
  # IDE's
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      # LSPs
      gopls                                 # Go
      lua-language-server                   # Lua
      pyright                               # Python
      vscode-json-languageserver            # JSON
      typescript-language-server            # TypeScript / JavaScript
      yaml-language-server                  # YAML
      dockerfile-language-server-nodejs     # Docker
      vscode-langservers-extracted          # css, json, html
      helm-ls                               # Helm
    ];
  };


  home.packages = with pkgs; [
    # Languages
    nodejs
    go
    nil
    python312
    luajitPackages.luarocks

    #Containers
    docker
    kubectl
    helm

    #Shell
    tmux

    #Compilers
    cmake
    gnumake
    ninja
    pkg-config
    gcc
  ];
}
