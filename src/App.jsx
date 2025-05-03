import { useState } from "react";
import AdderWrapper from "./wasm/adder_wasm";
import AdderBinary from "./wasm/adder_wasm.wasm?url";

const wasmModuleInstance = AdderWrapper({
  locateFile: () => {
    return AdderBinary;
  }
});

const App = () => {
  const [numbers, setNumbers] = useState({ a: 0, b: 0 });
  const [result, setResult] = useState(0);

  const handleClick = () => {
    wasmModuleInstance.then((core) => {
      const res = core._adder(numbers.a, numbers.b);
      setResult(res);
    });
  };

  return (
    <div>
      <input
        type="number"
        onChange={(e) => setNumbers({ ...numbers, a: Number(e.target.value) })}
      />
      <input
        type="number"
        onChange={(e) => setNumbers({ ...numbers, b: Number(e.target.value) })}
      />
      <button onClick={handleClick}>Submit</button>
      <br />
      <p>Result: {result}</p>
    </div>
  );
};

export default App;
