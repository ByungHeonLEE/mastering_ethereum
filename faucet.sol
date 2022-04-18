// First contract
pragma solidity ^0.4.22;

contract owned {
    address owner;
    //owner address set
    constructor(){
        owner = msg.sender;
    }
    //msg.sender = owner
    modifier onlyOwner {
        require(msg.sender == owner,
                "Only the contract owner can call this function");
        _;
    }
}

contract mortal is owned {
    //destructor
    function destory() public onlyOwner{
        selfdestruct(owner);
    }
}

contract Faucet is mortal {
    event Withdrawl(address indexed to, uint amount);
    event Deposit(address indexed from, uint amount);;

    // give ether to requester
    function withdraw(uint256 withdraw_amount) public {
        //restrict withdraw_amount
        require(withdraw_amount <= 0.1 ether);
        require(this.balance >= withdraw_amount,
                "Insufficient balance in faucet for withdrawal request");

        //send withdraw_amount
        msg.sender.transfer(withdraw_amount);
        emit Withdrawal(msg.sender, withdraw_amount);
    }

    //get
    function() public payable {
        emit Deposit(msg.sender, msg.value);
    }
}
