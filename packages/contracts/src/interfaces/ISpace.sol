//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {GrowthLevel, HealthStatus} from "../codegen/Types.sol";

/// @title Wefa Space interface.
/// @dev Interface of a Wefa Space  contract.
interface ISpace {
    enum Status {
        ACTIVE,
        INACTIVE,
        DEACTIVATED
    }

    enum Element {
        WATER,
        EARTH,
        FIRE,
        AIR
    }

    enum Action {
        TREE_PLANTING,
        GARDEN_PLANTING,
        LITER_CLEANUP,
        VEGETATION_CLEANUP,
        NATURAL_COMPOSTING
    }

    enum Planet {
        EARTH,
        MARS
    }

    struct Location {
        uint32 zipcode;
        Planet planet;
    }

    enum MemberStatus {
        ACTIVE,
        INACTIVE
    }

    struct Teammate {
        MemberStatus status;
        uint256 createdAt;
        uint256 updatedAt;
        uint32 plantsAdded;
        bool leader;
        bool exists;
    }

    struct Plant {
        string metadata; // Ceramic/IPFS CID Url
        uint256 createdAt;
        uint256 updatedAt;
        address creator; // Team member
        address[] caretakers;
    }

    /// @dev Emitted when a Space elements are updated.
    /// @param space: Address of the space.
    /// @param elements: WEFA elements
    event UpdatedCore(address space, Element[] elements);

    /// @dev Emitted when a Space details are updated.
    /// @param space: Address of the space.
    /// @param name: Name of the space.
    /// @param mission: Mission of the space.
    /// @param metadata: extra data stored in IPFS via ceramic.
    event UpdatedDetails(address space, string name, string mission, string metadata);

    /// @dev Emitted when a Space privacy is updated.
    /// @param space: Address of the space.
    /// @param isPrivate: Boolean value.
    event UpdatedPrivacy(address space, bool isPrivate);

    /// @dev Emitted when a team member is updated.
    /// @param space: Address of the space.
    /// @param member: Details of team member.
    event UpdatedTeammate(address space, Teammate member);

    /// @dev Emitted when a member is added to the space.
    /// @param space: Address of the space.
    /// @param member: Address of member added.
    event AddedMember(address space, address member);

    /// @dev Emitted when a member is removed from the space.
    /// @param space: Address of the space.
    /// @param member: Address of member removed.
    event RemovedMember(address space, address member);

    /// @dev Emitted when a plant is added to the space.
    /// @param space: Address of the space.
    /// @param entityId: Metadata of plant
    /// @param plantId: ID of plant added.
    /// @param metadata: extra data stored in IPFS via ceramic.
    event AddedPlant(address space, uint256 entityId, uint256 plantId, string metadata);

    /// @dev Function to update the space core elements and actions.
    /// @param _elements: root of tree
    function updateCore(Element[] calldata _elements) external;

    /// @dev Function to update the space details.
    /// @param _name: root of tree
    /// @param _mission: Nullifier hash.
    /// @param _metadata: Nullifier hash.
    function updateDetails(string calldata _name, string calldata _mission, string calldata _metadata) external;

    /// @dev Function to update the space settings.
    /// @param _bool: settings for spaces
    function updatePrivacy(bool _bool) external;

    /// @dev Function to add member to the space.
    /// @param _member: Address of the member.
    /// @param _leader: Weather the member is leader or not.
    function addMember(address _member, bool _leader) external;

    /// @dev Function to remove member from the space.
    /// @param _member: Address of the member.
    function removeMember(address _member) external;

    /// @dev Function to add a plant to the space.
    /// @param _image: Image of the plant as CID url.
    /// @param _meta: Metadata of the plant as CID url.
    /// @param _long: Longitude of the plant.
    /// @param _lat: Latitude of the plant.
    /// @param _healthStatus: Health status of the plant.
    /// @param _growthLevel: Growth level of the plant.
    /// @param _plantId: ID of the plant.
    function addPlant(
        string memory _image,
        string memory _meta,
        int32 _long,
        int32 _lat,
        HealthStatus _healthStatus,
        GrowthLevel _growthLevel,
        uint256 _plantId
    ) external returns (uint256);

    /// @dev Function to add a plant to the space.
    function getMembers() external view returns (Teammate[] memory);

    /// @dev Function to get elements of the space.
    function getElements() external view returns (Element[] memory);

    /// @dev Function to add a plant to the space.
    /// @param _member: Plant details to be added
    function isMember(address _member) external view returns (bool);

    /// @dev External function allowing team members to activate the space.
    function activate() external;

    /// @dev External function allowing team members to deactivate the space.
    function deactivate() external;
}
