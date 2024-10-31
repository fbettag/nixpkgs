{ stdenv, callPackage }:

{
  code-cursor = if stdenv.hostPlatform.isDarwin then
    callPackage ./cursor-darwin.nix { }
  else
    callPackage ./cursor-linux.nix { };
}
