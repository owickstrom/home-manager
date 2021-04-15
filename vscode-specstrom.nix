{ pkgs }:
pkgs.vscode-utils.buildVscodeExtension {
  name = "vscode-specstrom";
  vscodeExtUniqueId = "vscode-specstrom";
  src = "${
      fetchTarball
      "https://github.com/quickstrom/specstrom/archive/4aaaf01fe76bcffd6f68b9238649546ea30cdfdf.tar.gz"
    }/editor-support/vscode";
}
