# Identity Vault com Zero-Knowledge Proofs

Prova localmente saldo ou KYC; apenas a prova ZK-SNARK vai on-chain.

## Stack

- Circom, SnarkJS, Solidity

## Teoria dos circuitos

Circuito `balance.circom`:

- Entradas privadas: `balance`, `salt`
- Pública: `commitment`, `threshold`
- Constraint: `balance >= threshold`
- Saída: prova π que verificador valida sem ver `balance`

Detalhes: [docs/ZK_CIRCUITS.md](docs/ZK_CIRCUITS.md)

## Tempo de geração local

| Hardware | Prova (Groth16) |
|----------|-----------------|
| Laptop 8 cores | ~3–8 s |
| Workstation | ~1–2 s |

## Deploy testnet

```bash
npm run compile:circuit
npm run setup:trusted
npx hardhat run scripts/deploy.ts --network sepolia
```

Contrato verificador: `contracts/Groth16Verifier.sol` (gerado por snarkjs)

## Estrutura

| Pasta | Função |
|-------|--------|
| `circuits/` | Circom |
| `contracts/` | Verifier + Vault |
| `scripts/` | prove / verify CLI |
