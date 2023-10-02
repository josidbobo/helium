import dotenv from 'dotenv';
import { HardhatUserConfig } from 'hardhat/types';
import '@nomicfoundation/hardhat-toolbox';
import '@nomiclabs/hardhat-ethers';
import chains from './chains.json';
dotenv.config();

const config: HardhatUserConfig = {
    solidity: '0.8.18',
    networks: {
        polygon: {
            url: chains[0].rpc,
            accounts: [process.env.PRIVATE_KEY],
            network_id: 80001,
        },
        avalanche: {
            url: chains[1].rpc,
            accounts: [process.env.PRIVATE_KEY],
            network_id: 43113,
        },
    },
};
export default config;