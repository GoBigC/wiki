{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    python3
    python3Packages.mkdocs
    python3Packages.mkdocs-material
  ];

  shellHook = ''
    zsh
  '';
}