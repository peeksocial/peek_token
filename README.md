# peek_token
cadence code to interact with the peek token on the flow blockchain


# Interactions
1. Install the [flow cli](https://docs.onflow.org/flow-cli/install).

2. Setup the CLI. Modify flow.json to include your private key testnet account.

3. Run `flow project deploy --network=testnet`

# Examples
Setup an account.

```bash
flow accounts create \
    --key public_key \
    --host access.testnet.nodes.onflow.org:9000 \
    --signer my-testnet-account 
```

Setups an account that can hold PeekTokens for a given users (signers) wallet:
```bash
flow transactions send cadence/transactions/setup_account.cdc --network=testnet --signer my-testnet-account
```

Mints a PeekToken and gives it to a specified Address:
```bash
flow transactions send cadence/transactions/mint_peek_token.cdc --arg Address:"0xa43afa97541f53f1" --arg String:"testid" --network=testnet --signer my-testnet-account
```

Read all the tokens held by a given user account.
```bash
flow scripts execute cadence/scripts/list_account_nfts.cdc --arg Address:"0xa43afa97541f53f1" --network=testnet
```

Read the UUID corresponding to a given token held by a user:
```bash
flow scripts execute cadence/scripts/read_peek_token_userid.cdc --arg Address:"0xa43afa97541f53f1" --arg UInt64:"0" --network=testnet
```
