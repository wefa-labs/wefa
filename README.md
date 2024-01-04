## Overview

WEFA is a project focused on connecting nature to the emerging Web3 world of AI, AR, IoT and Blockchains with games and interactive activities.
It enables users to nurture a physical plant and earn rewards for daily care, with rewards used to feed and evolve digital creatures. These digital creatures are used as assets and entities in the AR games where you inlock different skins and skills from gameplay. Users embody the elemental characters of the WEFA story by choosing their element and earning skill points through plant care and gameplay, unlocking new abilities to use in games and competitions. Users based on skill points have larger voting power when it comes to governance of WEFA which involves, storyline crafting, game augmentation and rules, app development, and more.

## Getting Started 

The repo is based off the Web3 starter kit by Oba-One and is a monorepo using **pnpm** with all code held under packages directory.
Packages consists of API, Clients, and Contracts and can be ran simultonolesouly E2E in a local environment.

In order to run this project you need these dependencies:

- [Node](https://nodejs.org/en/download/current) version 18+ for running scripts and PNPM.
- [PNPM](https://pnpm.io/installation) version 6+ for package management.
- [Docker](https://docs.docker.com/get-docker) for database services Postgres and Redis.
- [Foundry](https://book.getfoundry.sh/getting-started/installation) for compiling/deploying smart contracts and running local blockchain node.

### Tests

Test can be ran at both the package level and root with `pnpm run test`.

Testing Structure:

- Clients use vitest and testing library for writing and running tests
- API uses Supertest in conjunction with Jest for writing and executing tests
- Contracts tests are written in Solidity and ran via MUD which uses Foundry's Forge for running tests.

## Architecture

The repo is architected with packages holding different code for dirrefent aspect of an application from clients to contracts. API and contract packages are singletons while clients may hold multiple for different interfaces (web, mobile) 

Languages used:

- [Typescript](https://www.typescriptlang.org/download) - Used for both client and API code with a types folder holding global type declerations and types created directly in routes, hooks, components, and views.
- [Solidity](https://docs.soliditylang.org/en/latest/installing-solidity.html#npm-node-js) - Language for writing Ethereum based contracts, compiling, and deploying. 

Core libraries:

- [React](https://react.dev) - Library for rendering UI and controlling basic state 
- [Vite](https://vitejs.dev) - Build library for client UIs
- [Express](https://expressjs.com) - Server based library handling server setup, routing, middleware
- [Prisma](https://www.prisma.io) - Database client and schema manager controlling SQL based DB
- [Mud](https://mud.dev) - On chain autonomous world based on ECS model with an indexer for querying chain state.

## Contributing

Project is open sourced and open for contributors who want to help with different aspects of the project. A roadmap for developers will be coming soon to have a clear view on work.


If you would like to contribute here are the following steps:

- Fork the repo and get your local environment up and running, if any issues post in the WEFA labs [discussion](https://github.com/orgs/wefa-labs/discussions) tab.
- Pick up an open task from the [project board](https://github.com/orgs/wefa-labs/projects/4) that's not assigned and fully defined, create a branch with the issue name.
- Once done open a [PR](https://github.com/wefa-labs/wefa/pulls) to merge into the development branch of the WEFA repo
- Once approved make sure your branch is up to date with main and complete the merge.
