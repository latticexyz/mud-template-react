// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

import { IDeploy } from "std-contracts/test/MudTest.t.sol";
import { Vm } from "forge-std/Vm.sol";
import { World } from "solecs/World.sol";

// Generated from `deploy.json` via `mud codegen-libdeploy`
import { LibDeploy, DeployResult } from "./LibDeploy.sol";

contract Deploy is IDeploy {
  address constant HEVM_ADDRESS = address(bytes20(uint160(uint256(keccak256("hevm cheat code")))));
  Vm internal immutable vm = Vm(HEVM_ADDRESS);

  function deploy(address deployer) external returns (World world) {
    vm.startPrank(deployer);
    DeployResult memory result = LibDeploy.deploy(deployer, address(0), false);
    world = result.world;
    vm.stopPrank();
  }
}
