{
  description = "Cachix + GitHub Actions example";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        # Dev environment
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [ curl jq ];
        };

        # Package output
        packages.default = pkgs.cowsay;
      });
}
