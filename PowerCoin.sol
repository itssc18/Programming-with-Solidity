// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.12;

//https://docs.soliditylang.org/en/v0.8.11/introduction-to-smart-contracts.html
contract Powercoin {
      // The keyword "public" makes variables
      // accessible from other contracts
      // The address type is a 160-bit value
      // does not allow any arithmetic operations
      address public minter;

      //The mapping type maps addresses to unsigned integers.
      mapping(address => uint) public balances;

      // Events allow clients to react to specific
      // contract changes you declare
      event Sent(address from, address to, uint amount);

      // Constructor code is only run when the contract
      // is created
      constructor() {
            minter = msg.sender;
      }

      // Sends an amount of newly created coins to an address
      // Can only be called by the contract creator
      function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
      }

      // Errors allow you to provide information about
      // why an operation failed. They are returned
      // to the caller of the function.
      error InsufficientBalance(uint requested, uint available);

      // Sends an amount of existing coins
      // from any caller to an address
      function send(address receiver, uint amount) public {
            if (amount > balances[msg.sender])
                  revert InsufficientBalance({
                  requested: amount,
                  available: balances[msg.sender]
                  });

            balances[msg.sender] -= amount;
            balances[receiver] += amount;
            emit Sent(msg.sender, receiver, amount);
      }
}