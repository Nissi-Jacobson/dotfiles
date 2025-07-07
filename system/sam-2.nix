{ pkgs ? import <nixpkgs> {}, ... }:

pkgs.python3Packages.buildPythonApplication {
  pname = "sam2";
  version = "0.1.0";
  
  src = pkgs.fetchFromGitHub {
    owner = "facebookresearch";
    repo = "segment-anything-2";
    rev = "main";
    sha256 = ""; # You'll need to fill this
  };
  
  propagatedBuildInputs = with pkgs.python3Packages; [
    torch
    torchvision
    opencv4
    pillow
    numpy
    tqdm
  ];
}
