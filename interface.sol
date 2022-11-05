// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Iamwealthy{
    function totalSupply() external view returns(uint); //used to capture the total number of token in circulation
    function balanceOf(address account) external view returns(uint); //used to capture the balancd of an address
    function transfer(address recipient, uint amount) external returns(bool); //used to transfer money to a recipient.
    function allowance(address owner, address spender) external view returns(uint); // the owner uses it to allow another person (the spender) to spend money from his wallet
    function approve(address spender, uint amount) external returns(bool); //the owner uses it to approve the spender's limit. so the spender doesn't spend everything
    function transferFrom(address sender, address recipient, uint amount) external returns(bool);
    
    event Transfer(address indexed from, address indexed to, uint amount); //events are like gossips.
    event Approval(address indexed owner, address indexed spender, uint amount); //the owner is approving the spender to spend a particular amount
    }
