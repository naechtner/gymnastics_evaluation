{
    description = "my project description";

    inputs.flake-utils.url = "github:numtide/flake-utils";

    outputs = { self, nixpkgs, flake-utils }:
        flake-utils.lib.eachDefaultSystem
            (system:
                let pkgs = nixpkgs.legacyPackages.${system}; in
                with pkgs;
                {
                    devShells.default = mkShell {
                        buildInputs = [
                            nodejs
                            postgresql
                            pre-commit
                            yarn
                        ];

                        shellHook = ''
                            pre-commit install
                        '';
                    };
                }
            );
}
