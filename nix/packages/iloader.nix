{
  stdenvNoCC,
  fetchurl,
  ...
}: let
  # https://github.com/nab138/iloader/releases
  version = "2.2.6";
  sha256 = "sha256-Xo0rmVvMeUbtecvxqORd3O5eBnLYQs0LwyxOOghnHb4=";
in
  stdenvNoCC.mkDerivation {
    pname = "iloader";
    inherit version;

    src = fetchurl {
      url = "https://github.com/nab138/iloader/releases/download/v${version}/iloader-darwin-universal.app.tar.gz";
      inherit sha256;
    };

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall

      mkdir -p "$out/Applications"
      cp -r iloader.app "$out/Applications/"

      runHook postInstall
    '';
  }
