pragma solidity 0.5.0;

contract Timelock {
    
    //who can withdraw ?
    // how much ? 
    // when ?
    
    address payable public beneficiary;
    uint256 public releaseTime;
    uint256 public balance;
    
    event Release(
        address beneficiary,
        uint256 releaseTime,
        uint256 balance);
        
    constructor(uint256 _releaseTime) public payable{
        require(_releaseTime > block.timestamp);
        releaseTime = _releaseTime;
        balance = address(this).balance;
    }
    
    function release() public{
        beneficiary = msg.sender;
        require(block.timestamp >= releaseTime);
        address(beneficiary).transfer(address(this).balance);
        emit Release(beneficiary, releaseTime, balance);
        balance = 0;
    }
}
