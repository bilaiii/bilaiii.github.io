{
  description = "HTML/CSS/JS Dev Shell";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      # Boilerplate to support all systems
      forAllSystems = f: nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ] (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      devShells = forAllSystems ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            live-server
            vscode-langservers-extracted # HTML/CSS/JSON LSP
            typescript-language-server   # JS/TS LSP
						sass
						nodejs
          ];

          shellHook = ''
          '';
        };
      });
    };
}
