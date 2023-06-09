# 简介

使用Nix和home manager的开发环境配置文件

# 使用方法

先安装Nix

`sh <(curl -L https://nixos.org/nix/install) --daemon` （多用户模式）

或者

`sh <(curl -L https://nixos.org/nix/install) --no-daemon` （单用户模式）

然后

`nix build .#homeConfigurations.rumia.activationPackage --extra-experimental-features 'nix-command flakes' && ./result/activate`

别忘了修改 `tools.nix` 和 `home.nix` 里的用户名~

第一次运行后，就可以用

`home-manager switch --flake .#rumia`

来运行啦

# 镜像

如果需要国内的镜像，命令行里加上

`--substituters https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store`

也就是

`nix build .#homeConfigurations.rumia.activationPackage --extra-experimental-features 'nix-command flakes' --substituters https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store && ./result/activate`

并在 `home.nix` 的 `extraOptions` 里加上

`substituters = https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store https://cache.nixos.org/`

