// First contract
contract Faucet {
    // give ether to requester
    function withdraw(uint256 withdraw_amount) public {
        //restrict withdraw_amount
        require(withdraw_amount <= 100000000000000000);

        //send withdraw_amount
        msg.sender.transfer(withdraw_amount);
    }

    //get
    function() public payable {}
}
