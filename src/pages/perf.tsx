import ReactDOM from "react-dom";
import { useRef, useEffect } from "react";
import Benchmarker from "../components/benchmarker";

const perf: NextPage = () => {
  const ref = useRef();

  useEffect(() => {
    ReactDOM.render(<Benchmarker />, ref.current);
  }, []);

  return <div ref={ref} />;
};

export default perf;
