# Repository

Clone the repository into your user directory:

```shell
git clone https://github.com/bjchambers/dotfiles.git ~/dotfiles --recurse-submodules
mv ~/.vim ~/.vim.bak
ln -s ~/dotfiles/vim ~/.vim
```

# Setup vimrc

## Install Metals-Vim (Scala)
```shell
curl -L -o coursier https://git.io/coursier
chmod +x coursier
./coursier bootstrap --java-opt -Xss4m --java-opt -Xms100m --java-opt \
    -Dmetals.client=coc.nvim org.scalameta:metals_2.12:0.7.0 \
    -r bintray:scalacenter/releases -r sonatype:snapshots \
    -o $HOME/local/bin/metals-vim -f
```

## Build CPSM

```shell
sudo apt install cmake libboost-all-dev python-dev libicu-dev
cd ~/.vim/plugins_dir/cpsm
./install.sh
```
