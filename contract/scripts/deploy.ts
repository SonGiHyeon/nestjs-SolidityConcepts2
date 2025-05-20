import { ethers } from 'hardhat';
import { makeAbi } from './abiGenerator';

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log(`Deploying contracts with the account: ${deployer.address}`);

  // Bank 컨트랙트 가져오기
  const BankFactory = await ethers.getContractFactory('Bank');

  // 배포
  const contract = await BankFactory.deploy();
  await contract.waitForDeployment();

  // 결과 출력
  console.log(`Bank contract deployed at: ${contract.target}`);

  // ABI 생성
  await makeAbi('Bank', contract.target);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
