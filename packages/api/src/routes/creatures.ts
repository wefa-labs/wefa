import { FastifyInstance, FastifyRequest, FastifyReply } from "fastify";

import { detectPlantHealth } from "../modules/plant";
import { fetchCurrentWeather } from "../modules/weather";

export default async function creaturesController(fastify: FastifyInstance) {
  fastify.post("/seed", async function (req: FastifyRequest, reply: FastifyReply) {
    const body = req.body as { plantId: number; image: string; zipcode: number };

    try {
      // GET PLANT INPUTS
      const health = await detectPlantHealth(body.image);

      // Get plant inputs from image like color, shades, etc.

      // GET ENVIRONMENT INPUTS
      // const weather = await fetchCurrentWeather(body.zipcode);

      // HIT CREDENTIAL MICROSERVICE
      // Generate intial claim for creatures
      // Associate claim with DiD which may be 3 types
      // Key local based, Device, and Blockchain
      // Return claim/proof to client

      // HIT CREATURE GENERATION MICROSERVICE
      // Feed inputs to createure generation service
      // Return 2D image and 3D model to client
      // Post requests to the pythonservice that will return a JSOn object with the type structure of a creature.

      reply.send({ health });
    } catch (error) {
      console.log(error);

      reply.status(400).send({ error });
    }
  });

  fastify.post("/nurture/:id", async function (req: FastifyRequest, reply: FastifyReply) {
    const params = req.params as { id?: string };
    const body = req.body as { zipcode?: number; energy?: number; spaceAddrs?: `0x${string}` };

    try {
      if (!params.id) throw new Error("ID not specified");
      if (!body.zipcode) throw new Error("No zipcode specified");

      const id = parseInt(params.id);

      // VERIFY OWNERSHIP
      // Check user ownership with 3 options
      // Session ID if not authenticated
      // Device Credential ID from WebAuth or local DiD
      // Verifiable Credential generated when connecting on chain

      // FEED CREATURE AND DETERMINE SIDE EFFECTS
      // Determine if creature can be nurtured
      // Check weather to see if right time and environment to nurture
      const weather = fetchCurrentWeather(body.zipcode);

      // GENERATE CREDENTIAL/PROOF
      // Hit Polygon ID Node to generate claim
      // Chain claim of creature care for future evolving
      // Create proof and pass back to client and store in cache

      reply.send({ body });
    } catch (error) {
      console.log(error);

      reply.send({ error });
    }
  });

  fastify.post("/evolve/:id", async function (req: FastifyRequest, reply: FastifyReply) {
    const params = req.params as { id?: string };
    const body: { spaceAddrs?: `0x${string}`; zipcode?: number } = req.body as any;

    try {
      if (!params.id) throw new Error("ID not specified");
      if (!body.zipcode) throw new Error("No zipcode specified");

      const id = parseInt(params.id);

      // VERIFY OWNERSHIP
      // Check user ownership with 3 options
      // Session ID if not authenticated
      // Device Credential ID from WebAuth or local DiD
      // Verifiable Credential generated when connecting on chain

      // CHECK CREATURE XP
      // Detemine if creature can be evolved
      // Update creature XP and health
      // Get weather as input in evolving creature
      const weather = fetchCurrentWeather(body.zipcode);

      // GENERATE CREDENTIAL/PROOF
      // Hit Polygon ID Node to generate claim
      // Chain credential to previous creature evolutions
      // Create proof and pass back to client and store in cache

      reply.send({ body, id });
    } catch (error) {
      console.log(error);

      reply.send({ error });
    }
  });
}
