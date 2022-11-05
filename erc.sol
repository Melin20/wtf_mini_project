// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./miniprojectinterface.sol"; //we're importing the interface file to this present file

contract wealth is Iamwealthy { //since we're importing the other file here, we have to inherit the interface.

uint public override totalSupply = 10**6 * 10**18; //We put override so that the 'totalSupply' in our interface won't compete with the 'totalSupply' in this file
mapping(address => uint)public override balanceOf; //we declare a mapping that will map your address with your money (just like attaching your money to your account number), and save it as a variable
mapping(address => mapping(address => uint)) public override allowance; //to allow the spender, we'll mapping the address of the owner with the address of the spender and the amount we want to allow the spender to spend (nested mapping)
string public name = "Tech4Dev Token"; //the name of my token
string public symbol = "T4D"; //the symbol of my token
uint public decimals = 18; //the decimal of my token

function transfer(address recipient, uint amount) external override returns(bool){ //every function in interface is declared virtual by default. That's why it is easy to add override.
balanceOf[msg.sender] -= amount; //this code deducts money from the balance of the person that is doing the transfer (the msg.sender)
balanceOf[recipient] += amount; //this code increases the balance of the person that is receiving the money (ie the amount)
emit Transfer(msg.sender, recipient, amount); //the emit keyword implements the event. 
return true; //if the code worked succesffuly, return true.
}

function approve(address spender, uint amount) external override returns(bool){ //you want to approve the amount you can allow the spender to spend from your address.
allowance[msg.sender][spender] = amount; //to do that, we call the allowance mapping we created earlier in line 10. we use this code to capture the address of the spender and the address of the msg.sender.
emit Approval(msg.sender, spender, amount); //Emit follows the format of the event in the interface file.
return true; //return bool
}

function transferFrom(address sender, address recipient, uint amount) external override returns(bool){ //use this code to allow the recipient transfer money from your address
allowance[sender][msg.sender] -= amount; //the msg.sender, the one that wants to transfer from another person's account is the one that will call this function
balanceOf[sender] -= amount; //deducts the balance of the sender
balanceOf[recipient] += amount; //increases the balance of the recipient
emit Transfer(sender, recipient, amount); //emit transfer ie gossip or broadcast.
return true; //return bool
}

function mint(uint amount) external{ //the total supply is zero. there is no money in this contract, so we need to create money by calling the mint money function. we take an input of the amount we want to mint
balanceOf[msg.sender] += amount; //add the inputed amount (minted money) to the caller's balance. the balance of the person calling the mint function should increase by the minted amount.
totalSupply += amount; //increase total supply by the amount inputed.
emit Transfer(address(0), msg.sender, amount); // i'm emiting transfer. we normally transfer from one account to another, but this time, we're not transferring from any account. We're creating it. that's why the address is 0. and we're tranfering to msg.sender
}

function burn(uint amount)external{ //the burn removes some amount from circulation. we take an input of the amount we want to remove
    balanceOf[msg.sender] -= amount; //remove the inputed amount from the caller's balance
    totalSupply -= amount; //this code removes the inputed amount from the total supply
    emit Transfer(msg.sender, address(0), amount); //the burn function is coming from the msg.sender, and it is going no where, that's why the address is 0.
} 
} 

