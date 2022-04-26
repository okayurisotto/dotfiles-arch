XDG_CONFIG_HOME ?= "${HOME}/.config"

.PHONY: set
set:
	mkdir -p "${XDG_CONFIG_HOME}"
	
	ln -fsv "${PWD}/src/alacritty"              "${XDG_CONFIG_HOME}"
	ln -fsv "${PWD}/src/cava"                   "${XDG_CONFIG_HOME}"
	ln -fsv "${PWD}/src/fontconfig"             "${XDG_CONFIG_HOME}"
	ln -fsv "${PWD}/src/fzf"                    "${XDG_CONFIG_HOME}"
	ln -fsv "${PWD}/src/git"                    "${XDG_CONFIG_HOME}"
	ln -fsv "${PWD}/src/i3"                     "${XDG_CONFIG_HOME}"
	ln -fsv "${PWD}/src/i3status-rust"          "${XDG_CONFIG_HOME}"
	ln -fsv "${PWD}/src/libskk"                 "${XDG_CONFIG_HOME}"
	ln -fsv "${PWD}/src/mpv"                    "${XDG_CONFIG_HOME}"
	ln -fsv "${PWD}/src/nvim"                   "${XDG_CONFIG_HOME}"
	ln -fsv "${PWD}/src/picom"                  "${XDG_CONFIG_HOME}"
	ln -fsv "${PWD}/src/rofi"                   "${XDG_CONFIG_HOME}"
	ln -fsv "${PWD}/src/yt-dlp"                 "${XDG_CONFIG_HOME}"
	ln -fsv "${PWD}/src/ytfzf"                  "${XDG_CONFIG_HOME}"
	
	ln -fsv "${PWD}/src/starship/starship.toml" "${XDG_CONFIG_HOME}"
	
	ln -fsv "${PWD}/src/tmux/.tmux.conf"  "${HOME}"
	ln -fsv "${PWD}/src/xorg/.Xresources" "${HOME}"
	ln -fsv "${PWD}/src/xorg/.xinitrc"    "${HOME}"
	ln -fsv "${PWD}/src/xorg/.xprofile"   "${HOME}"
	ln -fsv "${PWD}/src/zsh/.zshrc"       "${HOME}"

.PHONY: unset
unset:
	rm -f "${XDG_CONFIG_HOME}/alacritty"
	rm -f "${XDG_CONFIG_HOME}/cava"
	rm -f "${XDG_CONFIG_HOME}/fontconfig"
	rm -f "${XDG_CONFIG_HOME}/fzf"
	rm -f "${XDG_CONFIG_HOME}/git"
	rm -f "${XDG_CONFIG_HOME}/i3"
	rm -f "${XDG_CONFIG_HOME}/i3status-rust"
	rm -f "${XDG_CONFIG_HOME}/libskk"
	rm -f "${XDG_CONFIG_HOME}/mpv"
	rm -f "${XDG_CONFIG_HOME}/nvim"
	rm -f "${XDG_CONFIG_HOME}/picom"
	rm -f "${XDG_CONFIG_HOME}/rofi"
	rm -f "${XDG_CONFIG_HOME}/yt-dlp"
	rm -f "${XDG_CONFIG_HOME}/ytfzf"
	
	rm -f "${XDG_CONFIG_HOME}/starship.toml"
	
	rm -f "${HOME}/.Xresources"
	rm -f "${HOME}/.tmux.conf"
	rm -f "${HOME}/.xinitrc"
	rm -f "${HOME}/.xprofile"
	rm -f "${HOME}/.zshrc"
