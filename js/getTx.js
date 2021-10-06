var  Web3  =  require('web3'); 
web3  =  new  Web3(new  Web3.providers.HttpProvider('https://mainnet.infura.io/v3/c965c67e8aaf4a78ac3702d34449fd95'));

var  ethTx  = ('0x82a00f45787e0a886bc214641af2cb0a8c479a73b317a83c01b5746f5c7e2194');

web3.eth.getTransaction(ethTx, function(err, result) { 

if (!err  &&  result  !==  null) {
    console.log(result); // Log all the transaction info
    console.log('From Address: '  +  result.from); // Log the from address
    console.log('To Address: '  +  result.to); // Log the to address
    console.log('Ether Transacted: '  + (web3.utils.fromWei(result.value, 'ether'))); // Get the value, convert from Wei to Ether and log it
}
else {
    console.log('Error!', err); // Dump errors here
}
});