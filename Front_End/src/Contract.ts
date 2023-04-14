
import contractABI from '../contractABI.json'
import Web3 from 'web3';

let contractAddr = "0xe612F8Cb1d43AD832AA0EB22987B1ae09d9Ea436";

let web3;
export let contractInstance;
web3 = new Web3(window.ethereum);
contractInstance = new web3.eth.Contract(contractABI, contractAddr);
