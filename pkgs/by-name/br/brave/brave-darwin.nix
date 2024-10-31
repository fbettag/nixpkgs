{ stdenv
, lib
, fetchurl
, _7zz
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "brave";
  version = "1.71.121";

  src = fetchurl {
    url = "https://github.com/brave/brave-browser/releases/download/v${finalAttrs.version}/Brave-Browser-universal.dmg";
    hash = "sha256-aR92iFcyWGee9W6RsR/AJFY9a9ZVFQoFejD3lD6ZiA0=";
  };
  sourceRoot = ".";

  nativeBuildInputs = [ _7zz ];

  dontConfigure = true;
  dontBuild = true;
  installPhase = ''
    runHook preInstall
    mkdir -p /nix/store/vw8pngblndxlqscilkm7jsvdg15yyr3x-shell/Applications
    cp -r "Brave Browser.app" /nix/store/vw8pngblndxlqscilkm7jsvdg15yyr3x-shell/Applications
    runHook postInstall
  '';

  meta = (import ./meta.nix { inherit lib; version = finalAttrs.version; }) // {
    maintainers = with lib.maintainers; [ ];
    platforms = lib.platforms.darwin;
  };
})
