# Solidity Bug: Incorrect Balance Update in Withdraw Function

This repository demonstrates a common bug in Solidity smart contracts: an incorrect balance update in a withdrawal function.

The `bug.sol` file contains the buggy code.  The `withdraw` function contains a critical error: it adds the withdrawal amount to the user's balance instead of subtracting it. This will lead to an incorrect balance and could allow users to withdraw more funds than they possess.

The `bugSolution.sol` file provides the corrected code with the fix.

## How to reproduce
1. Compile and deploy `bug.sol`.
2. Attempt to withdraw funds. Notice the balance is incorrectly updated.
3. Compile and deploy `bugSolution.sol`. The balance will be correctly updated this time.

This example highlights the importance of thorough testing and code review in smart contract development. Even seemingly small errors can have serious consequences.