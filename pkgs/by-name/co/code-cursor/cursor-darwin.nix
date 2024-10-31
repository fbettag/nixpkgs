{
  stdenv,
  lib,
  fetchurl,
  _7zz,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "cursor";
  version = "0.42.3";

  src = fetchurl {
    url = "https://download.todesktop.com/230313mzl4w4u92/cursor-${finalAttrs.version}.dmg";
    hash = "sha256-R/NYPb7bvLbyDYntw2K75SC1/sqNO7HAJ3QUwGThvUg=";
  };

  sourceRoot = ".";

  nativeBuildInputs = [ _7zz ];

  dontConfigure = true;
  dontBuild = true;
  installPhase = ''
    runHook preInstall

    mkdir -p $out/Applications
    cp -r "Cursor.app" $out/Applications

    runHook postInstall
  '';

  meta = {
    description = "AI-powered code editor built on vscode";
    homepage = "https://cursor.com";
    license = lib.licenses.unfree;
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    maintainers = with lib.maintainers; [ sarahec fbettag ];
    platforms = lib.platforms.darwin;
  };
})
