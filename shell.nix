with import <nixpkgs> { };
with pkgs;
mkShell {
  nativeBuildInputs = [
    dhall-lsp-server
    dhall-json
    dhall
    python310
  ];
}
