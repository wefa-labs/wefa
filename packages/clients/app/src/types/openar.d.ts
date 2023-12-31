enum Size {
  MINI,
  SMALL,
  MEDIUM,
  LARGE,
}

enum ARStatus {
  ACTIVE,
  FROZEN,
}

declare interface TicTacToe {
  worldId: string;
  spaceId: string;
  gameId: string;
  name: string;
  board: (0 | 1 | 7)[];
  turn: number;
  currentPlayer: `0x${string}`; // Address
  winner: `0x${string}`; // Address
  createdAt: number;
}

declare interface ARCell {
  owner: `0x${string}`; // Address of user or gane system in control
  spaceId: string;
  x: number;
  y: number;
  values: string[];
}

// For Three.js Visualization
declare interface ARSpace {
  owner: `0x${string}`; // Address of user or gane system in control
  status: ARStatus;
  game?: "TicTacToe" | null; // This combines with status to determine color state
  name: string;
  position: number;
  description?: ?string;
  image: string; // CID,
  cells: ARCell[];
}

declare interface ARWorld {
  name: string;
  description?: ?string;
  image: string; // CID
  size: Size;
  status: ARStatus;
  spaces: ARSpace[];
  createdAt: number;
}
