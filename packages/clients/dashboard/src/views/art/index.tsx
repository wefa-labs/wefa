import { Outlet } from "react-router-dom";
import { a, useSpring, config } from "@react-spring/web";
import { Button, DropdownMenu } from "@radix-ui/themes";

import { ArtDataProps } from "../../hooks/views/useArt";

interface ArtProps extends ArtDataProps {}

export const ArtView: React.FC<ArtProps> = () => {
  const style = useSpring({
    to: {},
    config: {
      ...config.slow,
    },
  });

  return (
    <a.div
      className={`relative h-[calc(100svh+4rem)] py-4 sm:py-16 md:py-24`}
      style={style}
    >
      <div className="flex justify-between">
        <div className="join">
          <input
            className="join-item btn"
            type="radio"
            name="options"
            aria-label="Radio 1"
          />
          <input
            className="join-item btn"
            type="radio"
            name="options"
            aria-label="Radio 2"
          />
          <input
            className="join-item btn"
            type="radio"
            name="options"
            aria-label="Radio 3"
          />
        </div>
        <div className="dropdown">
          <label tabIndex={0} className="btn m-1">
            Click
          </label>
          <ul
            tabIndex={0}
            className="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-52"
          >
            <li>
              <a>Item 1</a>
            </li>
            <li>
              <a>Item 2</a>
            </li>
          </ul>
        </div>
      </div>
      <ul className="grid grid-cols-[repeat(auto-fill,_minmax(150px,_1fr)">
        <li></li>
        <li></li>
      </ul>
      {/* <Outlet /> */}
    </a.div>
  );
};
