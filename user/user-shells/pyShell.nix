# nix-shell --indirect --add-root ~/.nix-gc-roots/python-dev shell.nix

{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [
    ( pkgs.python3.withPackages( pypkgs: with pypkgs; [
      pip
      #numpy
      #pandas

      ### The AI Guide
      #fastapi
      #uvicorn
      #streamlit
      #pandas
      #scikit-learn-extra
      #joblib
      #python-pptx
      #pytest
      #--
    ]))

    pkgs.docker
    pkgs.docker-compose
  ];
}
