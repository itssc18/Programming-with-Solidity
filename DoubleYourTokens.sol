// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.10 and less than 0.9.0
pragma solidity ^0.8.12;

contract DoubleYourTokens {
      uint value =1;
      
      function get() public view returns(uint){
            return value;
      }

      function double() public {
            value *= 2;
      }
}

