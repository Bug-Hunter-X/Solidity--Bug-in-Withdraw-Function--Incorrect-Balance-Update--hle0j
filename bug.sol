```solidity
function withdraw(uint amount) public {
  require(amount > 0, "Amount must be greater than zero");
  require(balances[msg.sender] >= amount, "Insufficient balance");

  // This is the bug! It should be substraction
  balances[msg.sender] += amount; 
  // instead of this addition
  uint balanceBefore = balances[msg.sender];
  (bool success, ) = payable(msg.sender).call{value: amount}(new bytes(0));
  require(success, "Transfer failed.");
  uint balanceAfter = balances[msg.sender];
  require(balanceBefore - balanceAfter == amount, "Incorrect balance update after withdraw");
}
```