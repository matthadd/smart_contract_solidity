pragma solidity 0.5.0;

contract Escrow {
    
    address payable agent;
    mapping(address => uint256) deposits;
    
    event Deposit(
        address sender,
        uint256 amount);
    event Withdraw(
        address beneficiary,
        uint256 amount); 
    
        
    modifier onlyAgent() {
        require(msg.sender == agent);
        _;
    }
    
    constructor() public{
        agent = msg.sender;
    }
    
    function deposit(address reciever) public payable { 
        deposits[reciever] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }
    function withdraw(address payable reciever) public onlyAgent{
        uint256 payement = deposits[reciever];
        deposits[reciever]= 0;
        reciever.transfer(payement);
        emit Withdraw(reciever, payement);
    }
}
