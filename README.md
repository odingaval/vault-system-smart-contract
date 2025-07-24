# Vault Manager 🏦

A smart contract system to manage Ethereum vaults, allowing multiple users to deposit and withdraw funds securely.

## 🚀 Features

- Deposit and withdraw ETH
- Support for multiple users
- Custom vault logic
- Written in Solidity and tested using Foundry

## 🛠️ Built With

- [Foundry](https://book.getfoundry.sh/)
- Solidity ^0.8.0

## 🧪 Running Tests

Make sure you have [Foundry installed](https://book.getfoundry.sh/getting-started/installation.html), then:

```bash
forge test

📦 Deployment

    To deploy your contract:

    1.Set environment variables in a .env file:

    PRIVATE_KEY=your_private_key
    ETH_RPC_URL=https://sepolia.infura.io/v3/your_project_id

    2.Run the deploy script:

    forge script script/DeployVault.s.sol --broadcast --rpc-url $ETH_RPC_URL


🔍 Verifying on Etherscan

To verify after deployment:

forge verify-contract --contract src/VaultManager.sol:VaultManager <DEPLOYED_ADDRESS> $ETHERSCAN_API_KEY


📂 Structure

├── src/              # Contract source files
├── test/             # Test files
├── script/           # Deployment scripts
├── broadcast/        # Deployment logs
├── foundry.toml      # Foundry config
└── .env              # Env vars (not committed)


📄 License

MIT

