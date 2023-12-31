declare type PlantBadgeType =
  | "1st-plant"
  | "1st-flower"
  | "1st-fruit"
  | "1st-herb"
  | "1st-vegetable"
  | "all-plant-types";

enum PlantType {
  FLOWER = "flower",
  FRUIT = "fruit",
  VEGETABLE = "vegetable",
  HERB = "herb",
}

enum PlantZone {
  ZERO,
  ONE,
  TWO,
  THREE,
  FOUR,
  FIVE,
  SIX,
  SEVEN,
  EIGHT,
  NINE,
  TEN,
  ELEVEN,
  TWELVE,
  THIRTEEN,
}

declare interface PlantDetails {
  id: number;
  common_names: string[];
  scientific_name: string;
  structured_name?: {
    genus: string;
    species: string;
  };
  taxonomy?: {
    kingdom: string;
    order: string;
    family: string;
    genus: string;
    class: string;
  };
  watering?: {
    min: number;
    max: number;
  };
  edible_parts?: string[];
  wiki_image?: {
    value: string;
    citation: string;
    license_name: string;
    license_url: string;
  };
  wiki_description?: {
    value: string;
    citation: string;
    license_name: string;
    license_url: string;
  };
}

declare interface PlantResponse {
  id: number;
  custom_id?: null | string;
  meta_data: {
    latitude: null | number;
    longitude: null | number;
    date: string;
    datetime: string;
  };
  uploaded_datetime: number;
  finished_datetime: number;
  images: {
    file_name: string;
    url: string;
  }[];
  suggestions: {
    id: number;
    plant_name: string;
    plant_details: PlantDetails;
    probability: number;
    confirmed: boolean;
  }[];
  modifiers: any[];
  secret: string;
  fail_cause: null | string;
  countable: true | false;
  feedback: null | string;
  is_plant_probability: number;
  is_plant: boolean;
}

declare interface PlantHealth {
  id: number;
  custom_id: null | string;
  meta_data: {
    latitude: null | number;
    longitude: null | number;
    date: string;
    datetime: string;
  };
  uploaded_datetime: number;
  finished_datetime: number;
  images: {
    file_name: string;
    url: string;
  }[];
  suggestions: {
    id: number;
    plant_name: string;
    plant_details: {
      language: string;
      common_names: string[];
      scientific_name: string;
      structured_name: {
        genus: string;
        species: string;
      };
      taxonomy: {
        kingdom: string;
        order: string;
        family: string;
        genus: string;
        class: string;
      };
      watering: {
        min: number;
        max: number;
      };
      edible_parts: string[];
      wiki_image: {
        value: string;
        citation: string;
        license_name: string;
        license_url: string;
      };
    };
    probability: number;
    confirmed: boolean;
    common_names;
  }[];
  modifiers: string[];
  secret: string;
  fail_cause: null | string;
  countable: boolean;
  feedback: null | string;
  is_plant_probability: number;
  is_plant: boolean;
}

declare interface Plant
  extends PlantDetails,
    Identity,
    Timestamps,
    Asset,
    LocalProps {
  id?: string; // Address may
  localId: string;
  plantId: number;
  caretakerAddress: `0x${string}` | "local"; // Address
  // health: Health;
  // care: Care;
  // spaceAddress: `0x${string}`; // Address
}
