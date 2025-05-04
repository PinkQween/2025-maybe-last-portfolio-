// import AdderWrapper from "./wasm/adder_wasm";
// import AdderBinary from "./wasm/adder_wasm.wasm?url";
import { useEffect } from "react";
import maia_oneko from "./assets/maia_oneko.gif";
import oneko from "./utils/oneko";

// const wasmModuleInstance = AdderWrapper({
//   locateFile: () => {
//     return AdderBinary;
//   }
// });

const App = () => {
  useEffect(() => {
    const isReduced = window.matchMedia(`(prefers-reduced-motion: reduce)`) === true || window.matchMedia(`(prefers-reduced-motion: reduce)`).matches === true;
    if (!isReduced) {
      oneko();
    }
  }, [])

  return (
    <>
      Test rwa 
    </>
  )
};

export default App;
