import { mudConfig } from "@latticexyz/world/register";

export default mudConfig({
  enums: {
    ElementEnum: ["Water", "Earth", "Fire", "Air"],
    GrowthLevelEnum: ["Seed", "Sprout", "Flowering", "Mature"],
    CellTypeEnum: ["Empty", "Plant", "Creature"],
    GridTypeEnum: ["TicTacToe", "Checkers", "Ludo", "Chess"], // TODO: New Games Scrabble, Candyland, Catan, Life, Connect Four, Checkers, Mancala
    MapTypeEnum: ["Private", "Public"],
    SizeEnum: ["Small", "Medium", "Large", "Massive"],
    TransferStatusEnum: ["Pending", "Completed", "Failed"],
    AccountTypeEnum: ["Keeper", "Space", "Plant", "Creature"],
  },
  tables: {
    // WEFA
    Water: {
      valueSchema: "int32",
    },
    Earth: {
      valueSchema: "int32",
    },
    Fire: {
      valueSchema: "int32",
    },
    Air: {
      valueSchema: "int32",
    },
    Element: {
      valueSchema: "ElementEnum",
    },
    // OPENAR
    Cell: {
      valueSchema: {
        position: "int32",
        cellType: "CellTypeEnum",
        entity: "address",
      },
    },
    Grid: {
      valueSchema: {
        x: "int32",
        y: "int32",
        gridType: "GridTypeEnum",
      },
    },
    Map: {
      valueSchema: {
        gridCount: "int32",
        mapType: "MapTypeEnum",
      },
    },
    // GAMES
    Match: {
      valueSchema: {
        winner: "bytes32",
        turn: "bytes32",
        game: "GridTypeEnum",
        players: "bytes32[]",
      },
    },
    Player: {
      valueSchema: {
        name: "string",
      },
    },
    // GENERAL
    Asset: {
      valueSchema: {
        image: "string",
        model: "string",
      },
    },
    Identity: {
      valueSchema: {
        createdAt: "uint256",
        name: "string",
        metadata: "string",
      },
    },
    // OWNERSHIP
    Owner: {
      valueSchema: "bytes32",
    },
    Token: {
      valueSchema: {
        id: "uint256",
        addrs: "address",
        account: "address",
      },
    },
    // PLANT & CREATURE
    Health: {
      valueSchema: {
        current: "int32",
        max: "int32",
      },
    },
    Care: {
      valueSchema: {
        checkedAt: "uint256",
        growthLevel: "GrowthLevelEnum",
      },
    },
    Species: {
      valueSchema: {
        species: "string",
        genus: "string",
        family: "string",
      },
    },
    Energy: {
      valueSchema: "int32",
    },
    Power: {
      valueSchema: "int32",
    },
    // SANITY CHECK
    Counter: {
      keySchema: {},
      valueSchema: "uint32",
    },
  },
  systems: {
    CreatureSystem: {
      name: "Creature",
      openAccess: true,
    },
    GameStartSystem: {
      name: "GameStart",
      openAccess: true,
    },
    GameMoveSystem: {
      name: "GameMove",
      openAccess: true,
    },
    MapSystem: {
      name: "Map",
      openAccess: false,
      accessList: ["GameStartSystem"],
    },
    GridSystem: {
      name: "Grid",
      openAccess: false,
      accessList: ["GameStartSystem", "GameMoveSystem"],
    },
    CellSystem: {
      name: "Cell",
      openAccess: false,
      accessList: ["GameStartSystem", "GameMoveSystem"],
    },
    TokenSystem: {
      name: "Token",
      openAccess: false,
      accessList: ["CreatureSystem"],
    },
  },
  modules: [
    {
      name: "UniqueEntityModule",
      root: true,
      args: [],
    },
    {
      name: "KeysWithValueModule",
      root: true,
      args: [],
    },
  ],
});
