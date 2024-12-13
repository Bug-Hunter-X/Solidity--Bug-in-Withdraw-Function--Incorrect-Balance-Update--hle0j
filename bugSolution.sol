```solidity
function withdraw(uint amount) public {
  require(amount > 0, "Amount must be greater than zero");
  require(balances[msg.sender] >= amount, "Insufficient balance");

  balances[msg.sender] -= amount; // Corrected line: Subtracts the amount

  uint balanceBefore = balances[msg.sender];
  (bool success, ) = payable(msg.sender).call{value: amount}(new bytes(0));
  require(success, "Transfer failed.");
  uint balanceAfter = balances[msg.sender];
  require(balanceBefore - balanceAfter == amount, "Incorrect balance update after withdraw");
}
```