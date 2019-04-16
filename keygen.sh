default=$(./target/release/subkey generate | grep -o '`.*`' | tr -d '`')
mnemonic=${1:-$default}

stash_seed=$(./target/release/subkey -e inspect "${mnemonic}"//stash | grep -o ': .*' | sed '1!d' | tr -d ': ')
stash_pubkey=$(./target/release/subkey -e inspect "${mnemonic}"//stash | grep -o ': .*' | sed '2!d' | tr -d ': ')
stash_address=$(./target/release/subkey -e inspect "${mnemonic}"//stash | grep -o ': .*' | sed '3!d' | tr -d ': ')

controller_seed=$(./target/release/subkey -e inspect "${mnemonic}"//controller | grep -o ': .*' | sed '1!d' | tr -d ': ')
controller_pubkey=$(./target/release/subkey -e inspect "${mnemonic}"//controller | grep -o ': .*' | sed '2!d' | tr -d ': ')
controller_address=$(./target/release/subkey -e inspect "${mnemonic}"//controller | grep -o ': .*' | sed '3!d' | tr -d ': ')

authority_seed=$(./target/release/subkey -e inspect "${mnemonic}"//authority | grep -o ': .*' | sed '1!d' | tr -d ': ')
authority_pubkey=$(./target/release/subkey -e inspect "${mnemonic}"//authority | grep -o ': .*' | sed '2!d' | tr -d ': ')
authority_address=$(./target/release/subkey -e inspect "${mnemonic}"//authority | grep -o ': .*' | sed '3!d' | tr -d ': ')

echo "Mnemonic: ${mnemonic}"
echo "Stash seed: ${stash_seed}"
echo "Stash pubkey: ${stash_pubkey}"
echo "Stash address: ${stash_address}"
echo ""
echo "Controller seed: ${controller_seed}"
echo "Controller pubkey: ${controller_pubkey}"
echo "Controller address: ${controller_address}"
echo ""
echo "Authority seed: ${authority_seed}"
echo "Authority pubkey: ${authority_pubkey}"
echo "Authority address: ${authority_address}"