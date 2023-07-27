// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/

contract MyToken {
    // Public variables to store token details
    string public tokenName;
    string public tokenAbbrv;
    uint public tokenSupply;
    mapping(address => uint) public balances;

    constructor() {
        // Initialize token details
        tokenName = "Priya";
        tokenAbbrv = "Pri";
        tokenSupply = 1000000;
    }

    function mint(address _address, uint _value) public {
        // Increase the balance of the specified address
        balances[_address] += _value;
        // Increase the token supply
        tokenSupply += _value;
    }

    function burn(address _address, uint _value) public returns (string memory) {
        // Check if the address has sufficient balance to burn
        require(balances[_address] >= _value, "Insufficient balance to burn");

        // Deduct the specified value from the balance
        balances[_address] -= _value;
        // Deduct the specified value from the token supply
        tokenSupply -= _value;

        // Return success message
        return "Tokens burned successfully";
    }
}
