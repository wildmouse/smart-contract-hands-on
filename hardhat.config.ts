import { HardhatUserConfig } from "hardhat/config";
import 'hardhat-watcher'

const config: HardhatUserConfig = {
  solidity: "0.8.19",
  watcher: {
    test: {
      tasks: [{ command: 'test', params: { testFiles: ['{path}'] } }],
      files: ['./test/**/*'],
      verbose: true,
      clearOnStart: true,
      start: 'echo Running my test task now..',
    }
  }
};

export default config;
