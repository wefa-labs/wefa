## Overview

WEFA is a project focused on connecting nature to the emerging Web3 world of AI, AR, IoT and Blockchains with games and interactive activities.
It enables users to nurture a physical plant and earn rewards for daily care, with rewards used to feed and evolve digital creatures. These digital creatures are used as assets and entities in the AR games where you inlock different skins and skills from gameplay. Users embody the elemental characters of the WEFA story by choosing their element and earning skill points through plant care and gameplay, unlocking new abilities to use in games and competitions. Users based on skill points have larger voting power when it comes to governance of WEFA which involves, storyline crafting, game augmentation and rules, app development, and more.

## Getting Started 

The repo is based off the Web3 starter kit by Oba-One and is a monorepo using **pnpm** with all code held under packages.
Packages consists of API, Clients, and Contracts and can all be ran simultonolesouly E2E in a local environment.

In order to run this project you need these dependencies:

- [Node](https://nodejs.org/en/download/current) version 18+ for running scripts and PNPM.
- [PNPM](https://pnpm.io/installation) version 6+ for package management.
- [Docker](https://docs.docker.com/get-docker) for database services Postgres and Redis.
- [Foundry](https://book.getfoundry.sh/getting-started/installation) for compiling/deploying smart contracts and running local blockchain node.
- 

### Tests

Test can be ran at both the package level and root which runs all.

## Architecture

The repo is architected in a manner that seeks structure and minimalism. This manifest in clear heirarchy of folder and files at each package level that have self contained code and structure based on their function. For example having the same import order and variable/type declarations for every client component, hook, and view. This section will detail the core aspect that make WEFA from it PWA client and on chain smart contracts.

The languages used:

- Typescript
- Solidity

The core libraries used:

- React
- Vite
- Express
- Prisma
- Mud

### Clients

### API

### Contracts

## Contributing

Project is open sourced and ready for contributors who want to help with certain aspects of the project. A project board will be coming soon with issues and a roadmap for people to have a clear view on work for the project.


If you would like to contribute here are the following steps:

- Fork the repo and get your local environment up and running, if any issues post in the discussion tab.
- Pick up an open task from the project board that's not assigned and fully defined, create a branch with the issue name.
- Once done open a PR to merge into the development branch of the WEFA repo
- Once approved make sure your branch is up to date with main and complete the merge.
