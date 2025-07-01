let
  pkgs = import <nixpkgs> { };

  aapt1 =
    with pkgs;
    aapt.overrideAttrs (oldAttrs: {
      postInstall = ''
        mv $out/bin/aapt2 $out/bin/aapt
      '';
    });

in
pkgs.mkShell {
  packages = with pkgs; [
    jq
    unzip
    zip
    aapt1
    apksigner
  ];

}
