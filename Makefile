link: link-editorconfig link-tmux link-zsh link-git

link-editorconfig:
	ln -sf ~/.config/editorconfig/.editorconfig ~/.editorconfig

link-tmux:
	ln -sf ~/.config/tmux/.tmux.conf ~/.tmux.conf

link-zsh:
	ln -sf ~/.config/zsh/.zshrc ~/.zshrc

link-git:
	ln -sf ~/.config/git/.gitconfig ~/.gitconfig

clean:
	rm ~/.editorconfig ~/.tmux.conf ~/.zshrc ~/.gitconfig
