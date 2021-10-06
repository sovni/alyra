var  Web3  =  require('web3');  
web3  =  new  Web3(new  Web3.providers.HttpProvider('https://mainnet.infura.io/v3/c965c67e8aaf4a78ac3702d34449fd95'));

console.log('Calling Contract.....');

var  abi  =  [{"constant":true,"inputs":[],"name":"getEbola","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"kill","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"getInfo","outputs":[{"name":"","type":"string"},{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"tipCreator","outputs":[{"name":"","type":"string"},{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"}];
var  addr  =  "0xe16f391e860420e65c659111c9e1601c0f8e2818";

var  Contract  =  new  web3.eth.Contract(abi, addr);

Contract.methods.getInfo().call().then(console.log);
Contract.methods.getEbola().call().then(console.log);