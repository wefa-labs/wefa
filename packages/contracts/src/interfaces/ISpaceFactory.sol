//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/// @title Wefa Space Factory interface.
/// @dev Interface of a Wefa Space Factory contract.
interface ISpaceFactory {
    enum FactoryStatus {
        ACTIVE,
        INACTIVE
    }

    // @dev Emitted when a Space is created.
    /// @param space: Address of the space.
    /// @param owner: Address of the user.
    /// @param name: Name of the porject set when created and can be updated.
    /// @param purpose: The stated purpose of the space set when created.
    /// @param metadata: CID url for metadata for spaces stored in IPFS.
    event CreatedSpace(address space, address owner, string name, string purpose, string metadata);

    /// @dev External function to create a space.
    /// @param _name: Name of the porject set when created and can be updated.
    /// @param _purpose: The stated purpose of the space set when created.
    /// @param _metadata: CID url for metadata for spaces stored in IPFS.
    /// @param _country: Country of the space.
    /// @param _zipcode: Zipcode of the space.
    function createSpace(
        string memory _name,
        string memory _purpose,
        string memory _metadata,
        string memory _country,
        uint32 _zipcode
    ) external returns (address);
}
