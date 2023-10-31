import React from "react";
import { useWeb3 } from "../../hooks/providers/web3";
import { Link } from "react-router-dom";

interface HeaderProps {
  isStarted?: boolean;
}

export const Header: React.FC<HeaderProps> = () => {
  const { activeWallet, login, logout } = useWeb3();

  return (
    <header
      className={`py-2 px-8 flex items-center justify-between border-b-2`}
    >
      <h1 className="font-bold text-4xl">Art House</h1>
      <div>
        {activeWallet ? (
          <div className="dropdown">
            <label tabIndex={0} className="btn m-1">
              <div className="avatar">
                <div className="w-24 rounded-full">
                  {/* <img src="/images/stock/photo-1534528741775-53994a69daeb.jpg" /> */}
                </div>
              </div>
            </label>
            <ul
              tabIndex={0}
              className="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-52"
            >
              <li>
                <Link to="/account">Account</Link>
              </li>
              <li>
                <Link to="/account">Connect Square</Link>
              </li>
              <li>
                <button className="btn btn-primary btn-sm" onClick={logout}>
                  Logout
                </button>
              </li>
            </ul>
          </div>
        ) : (
          <button className="btn btn-primary btn-sm" onClick={login}>
            Login
          </button>
        )}
      </div>
    </header>
  );
};
