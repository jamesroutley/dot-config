link: link-editorconfig link-tmux link-zsh link-git link-cookbook

link-editorconfig:
	ln -sf ~/.config/editorconfig/editorconfig ~/.editorconfig

link-tmux:
	ln -sf ~/.config/tmux/tmux.conf ~/.tmux.conf

link-zsh:
	ln -sf ~/.config/zsh/zshrc ~/.zshrc

link-git:
	ln -sf ~/.config/git/gitconfig ~/.gitconfig

link-cookbook:
	ln -sf ~/.config/cookbook/cookbook ~/.config/bin/cookbook

clean:
	rm ~/.editorconfig ~/.tmux.conf ~/.zshrc ~/.gitconfig rm ~/.config/bin/cookbook
