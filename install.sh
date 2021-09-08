#===============================================================================
# git clone https://github.com/partysun/.dotfiles.git ~/.dotfiles
# cd ~/.dotfiles
# sh ./install.sh
#===============================================================================

#==============
# Variables
#==============
dotfiles_dir=~/.dotfiles

#==============
# Delete existing dot files and folders
#==============
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1

#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============
ln -sf $dotfiles_dir/vim ~/.vim
ln -sf $dotfiles_dir/vim/vimrc ~/.vimrc
ln -sf $dotfiles_dir/.tmux.conf ~/.tmux.conf
ln -sf $dotfiles_dir/zsh/config.zsh ~/.zshrc
ln -sf $dotfiles_dir/git/.gitconfig ~/.gitconfig

#==============
# Set zsh as the default shell
#==============
sudo chsh -s /bin/zsh

#==============
# Give the user a summary of what has been installed
#==============
echo "Welcome"
