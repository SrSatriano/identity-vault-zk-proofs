// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @notice — integrar Groth16Verifier gerado pelo SnarkJS
contract IdentityVault {
    address public verifier;

    event ProofSubmitted(address indexed user, bytes32 proofHash);

    constructor(address _verifier) {
        verifier = _verifier;
    }

    function submitProof(bytes calldata proof, uint256[] calldata publicInputs) external {
                emit ProofSubmitted(msg.sender, keccak256(proof));
    }
}
