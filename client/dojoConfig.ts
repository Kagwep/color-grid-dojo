import manifest from "./manifest.json";
import { createDojoConfig } from "@dojoengine/core";

export const dojoConfig = createDojoConfig({
    manifest,
    rpcUrl: "https://api.cartridge.gg/x/color-grid-demo/katana",
    toriiUrl: "https://api.cartridge.gg/x/color-grid-demo/torii"
  });


  // export const dojoConfig = createDojoConfig({
  //   manifest
  // });