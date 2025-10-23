# nix-shell --indirect --add-root ~/.nix-gc-roots/python-dev shell.nix

{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [
    ( pkgs.python3.withPackages( pypkgs: with pypkgs; [
      pip
      numpy
      pandas
      matplotlib
      scikit-learn
      scipy
      #logpy
      sympy
      ipython
      pybrowsers
      selenium
      requests
      pyppeteer
      pyquery
      pygame
      jaraco-itertools
    ]))
  ];
}
