import { mudConfig } from "@latticexyz/world/register";

export default mudConfig({
  enums: {
    ElementEnum: ["Water", "Earth", "Fire", "Air"],
    GrowthLevelEnum: ["Seed", "Sprout", "Flowering", "Mature"],
    CellTypeEnum: ["Empty", "Plant", "Creature"],
    GridTypeEnum: ["TicTacToe", "Checkers", "Ludo", "Chess"],
    MapTypeEnum: ["Private", "Public"],
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
        type: "CellTypeEnum",
        entity: "address",
      },
    },
    Grid: {
      valueSchema: {
        x: "int32",
        y: "int32",
        type: "GridTypeEnum",
      },
    },
    Map: {
      valueSchema: {
        gridCount: "int32",
        type: "MapTypeEnum",
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
        contract: "address",
        account: "address",
      },
    },
    // LOCATION
    Coordinate: {
      valueSchema: {
        x: "int32",
        y: "int32",
        z: "int32",
      },
    },
    Tag: {
      valueSchema: {
        issuer: "address",
        did: "string",
      },
    },
    // SPACE
    Home: {
      valueSchema: "address",
    },
    Members: {
      valueSchema: "bytes32[]",
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
    PlantSystem: {
      name: "Plant",
      openAccess: true,
    },
    SpaceSystem: {
      name: "Space",
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
    GameCollectibleSystem: {
      name: "GameCollectible",
      openAccess: false,
      accessList: ["GameMoveSystem"],
    },
    MapSystem: {
      name: "Map",
      openAccess: false,
      accessList: ["SpaceSystem"],
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
      accessList: ["SpaceSystem", "PlantSystem", "CreatureSystem", "GameCollectibleSystem"],
    },
  },
  modules: [
    {
      name: "UniqueEntityModule",
      root: true,
      args: [],
    },
  ],
});
