import { NextPage } from "next";

const Benchmarker: NextPage = () => {
  const currentTime = Date.now();
  const renderTime = currentTime - window.performance.timeOrigin;
  //requestStart

  return (
    <>
      <span>Request to render time: {renderTime}</span>
    </>
  );
};

export default Benchmarker;

// export const Benchmarker: React.FC<{ children: string }> = ({ children }) => {
//     return (
//       <div style={{ padding: "4rem" }}>
//         <img
//           src="https://upload.wikimedia.org/wikipedia/commons/8/8e/Nextjs-logo.svg"
//           style={{ width: "64px", marginTop: "2rem" }}
//           alt="NextJS logo"
//         />
//         <h1>Benchmark (NextJS On Vercel {children})</h1>

//         <h2>
//           <span>
//             Full request to render time :{" "}
//             <span id="overrideme" />
//             ms
//           </span>
//         </h2>
//         <script>
//           {`
//         const currentTime = new Date(); // round trip time
//         const fullTime = currentTime - window.performance.timing.requestStart;
//         console.log(\`REPORTS ON ${children}\`, fullTime);
//         document.getElementById(\`overrideme\`).innerHTML = fullTime;
//         const times = JSON.parse(localStorage.getItem(\`${children}store\`)) ?? [];
//         times.push(fullTime);
//         localStorage.setItem(\`${children}store\`, JSON.stringify(times));
//         console.table(times);
//           `}
//         </script>
//       </div>
//     );
//   };
