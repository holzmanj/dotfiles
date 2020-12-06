{ nixpkgs ? import <nixpkgs> {} }:
let
  inherit (nixpkgs) pkgs;
  inherit (pkgs) haskellPackages;

  haskellDeps = ps : with ps; [
    # Haskell packages go here
  ];

  ghc = haskellPackages.ghcWithPackages haskellDeps;

  nixPackages = [
    ghc
    ghcid
    # Any other regular packages go here
  ];
in
  pkgs.stdenv.mkDerivation {
    name = "env";
    buildInputs = nixPackages;
  }
