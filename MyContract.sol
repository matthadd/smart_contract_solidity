pragma solidity 0.5.1;

contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;
    
    function mint() public {
        balances[tx.origin] ++;
    }
}


contract MyContract {
    address payable wallet;
    address public token;
    
    /*event Purchase(
        address indexed _buyer,
        uint256 _amount,
        uint256 _token);*/
    
    constructor(address payable _wallet) public{
        wallet = _wallet;
    }
    
    function() external payable {
        buyToken();
    }
    
    function buyToken() public payable {
        // buy a token
        // send ether to wallet
        
        ERC20Token _token = ERC20Token(address(token));
        _token.mint();
        wallet.transfer(msg.value);
        //emit Purchase(msg.sender, msg.value, msg.value/2);
    }
    
    /*
    
    uint256 public peopleCount = 0;
    mapping (uint => Person) public people;
    
    uint256 public openingTime = 1614372600;
    uint256 public time = block.timestamp;
    address owner;
    
    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime);
        _;
    }

   
   struct Person{
       uint id;
       string _firstName;
       string _lastName;
   }
   
   constructor() public{
       owner = msg.sender;
   }
   
   function addPerson(string memory _firstName,
   string memory _lastName
   )
   public
   onlyWhileOpen
   {
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
   }
   
   function incrementCount() internal {
       peopleCount+=1;
   }
   */
}
