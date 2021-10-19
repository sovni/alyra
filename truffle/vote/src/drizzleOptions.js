import Vote from "@/contracts/Vote.json";
const options = {
  web3: {
    block: false,
    fallback: {
      type: "ws",
      url: "ws://127.0.0.1:7545"
    }
  },
// The contracts to monitor
  contracts: [Vote],
  events: {
    //Guestbook: ["SignatureAdded"]
  },
  polls: {
    // check accounts ever 15 seconds
    accounts: 15000
  }
};
export default options;