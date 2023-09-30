// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FunctionsAndErrors{

    // public variables here
    string public tokenName = "MOONLIT";
    string public tokenAbbrv = "MNL";
    uint public totalSupply = 0;

    // mapping variable here
    mapping(address => uint) public balances;

    // mint function
    function mint(address _addr, uint _val) public {
        require(_val > 500, "Value for minting must be greater than 500.");
        totalSupply += _val;
        balances[_addr] += _val;
    }

    // burn function
    function burn(address _addr, uint _val) public {
        if(balances[_addr] >= _val){
            totalSupply -= _val;
            balances[_addr] -= _val;
        } else {
            revert("Insuffient balance.");
        }

        assert(totalSupply >= 0);
        assert(balances[_addr] >= 0);
    }

 
}
