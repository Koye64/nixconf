{ self, inputs, ... }: {
  perSystem = { pkgs, lib, ... }: {
    packages.ryubing = (pkgs.ryubing.override {
      buildDotnetModule = args: pkgs.buildDotnetModule ( args // {
        dotnet-sdk = pkgs.dotnetCorePackages.sdk_10_0;
        dotnet-runtime = pkgs.dotnetCorePackages.runtime_10_0;
        nugetDeps = ./deps.json;
      });
    }).overrideAttrs (prev: {
      version = "0-unstable-${lib.substring 0 8 inputs.ryubing.lastModifiedDate}";
      src = inputs.ryubing.outPath;
      nativeBuildInputs = prev.nativeBuildInputs ++ [ pkgs.makeWrapper ];
      postFixup = ''
        wrapProgram $out/bin/ryujinx --set PIPEWIRE_LATENCY "1024/48000"
      '';
    });
  };
}
