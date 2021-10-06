const Web3 = require('web3')
const rpcURL = "https://mainnet.infura.io/v3/c965c67e8aaf4a78ac3702d34449fd95"
const Web3Client = new Web3(new Web3.providers.HttpProvider(rpcURL));

const minABI = [  
    // balanceOf
    {    
      constant: true,
  
      inputs: [{ name: "_owner", type: "address" }],
  
      name: "balanceOf",
  
      outputs: [{ name: "balance", type: "uint256" }],
  
      type: "function",
    },
];

const tokenAddress = "0xb683d83a532e2cb7dfa5275eed3698436371cc9f";
const walletAddress = "0xd804ab1667e940052614a5acd103dde4d298ce36";

const contract = new Web3Client.eth.Contract(minABI, tokenAddress);

async function getBalance() {
  const result = await contract.methods.balanceOf(walletAddress).call();
  
  const format = Web3Client.utils.fromWei(result);

  console.log(format);
}

getBalance();