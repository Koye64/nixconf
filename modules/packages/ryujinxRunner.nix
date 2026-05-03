{ self, inputs, ... }: {
  perSystem = { pkgs, lib, self', ... }: {
    packages.ryujinxRunner = pkgs.writeShellScriptBin "ryujinx-runner" ''
      export PIPEWIRE_LATENCY=1024/48000
      exec ~/Games/bin/ryujinx-canary.AppImage
    '';
  };
}
