import { mudConfig } from "@latticexyz/world/register";

export default mudConfig({
  enums: {
    ElementEnum: ["Water", "Earth", "Fire", "Air"],
    PlantEnum: ["Vegetable", "Flower", "Fruit", "Herb"],
    GrowthLevelEnum: ["Seed", "Sprout", "Flowering", "Ripe"],
  },
  tables: {
    Counter: {
      keySchema: {},
      valueSchema: "uint32",
    },
    Asset: {
      valueSchema: {
        image: "string",
        model: "string",
      },
    },
    Care: {
      valueSchema: {
        checkedAt: "uint256",
        growthLevel: "GrowthLevelEnum",
      },
    },
    Coordinate: {
      valueSchema: {
        x: "int32",
        y: "int32",
        z: "int32",
      },
    },
    Element: {
      valueSchema: "ElementEnum",
    },
    Energy: {
      valueSchema: "int32",
    },
    Genus: {
      valueSchema: {
        genus: "string",
        species: "string",
        plantType: "PlantEnum",
      },
    },
    Health: {
      valueSchema: {
        current: "int32",
        max: "int32",
      },
    },
    Home: {
      valueSchema: "address",
    },
    Identity: {
      valueSchema: {
        metadata: "string",
        createdAt: "uint256",
      },
    },
    Members: {
      valueSchema: {
        members: "address[]",
      },
    },
    Owner: {
      valueSchema: "address",
    },
    Power: {
      valueSchema: "int32",
    },
    Resources: {
      valueSchema: {
        water: "int32",
        earth: "int32",
        fire: "int32",
        air: "int32",
      },
    },
    Tag: {
      valueSchema: {
        did: "string",
        issuer: "address",
      },
    },
    Token: {
      valueSchema: {
        id: "uint256",
        contract: "address",
        account: "address",
      },
    },
  },
  systems: {},
  modules: [
    {
      name: "UniqueEntityModule",
      root: true,
      args: [],
    },
  ],
});
