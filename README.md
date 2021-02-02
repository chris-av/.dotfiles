# My-Personal-Setup

## Introduction

How to set up my personal computer and customized OS.

## Programs to Download via Browser

Here is what you should download via the browser: 

* [homebrew](https://brew.sh/)
* [Oh-My-ZSH](https://ohmyz.sh/)
  * make sure to set default shell to z-shell
  * also make sure to modify any paths as necessary
* [R](https://www.r-project.org/)
* [Rstudio](https://rstudio.com/)
* [Python](https://www.python.org/downloads/)
* [MacTex](https://tug.org/mactex/)
* [TexStudio](https://www.texstudio.org/)
* [JabRef](https://www.jabref.org/)
* [Dropbox](https://www.dropbox.com/downloading)
* [Insomnia](https://insomnia.rest/)
* [Postman](https://www.postman.com/)
* [Slack](https://slack.com/)
* [Discord](https://discord.com/download)
* [iTerm2](https://iterm2.com/)
* [Snazzy Profile for terminal](https://github.com/sindresorhus/iterm2-snazzy)
* [Dashlane](https://www.dashlane.com/)
* [Visual Studio Code](https://code.visualstudio.com/)
* [Atom](https://atom.io/)
* [Brave](https://brave.com/)
* [Chrome](https://www.google.com/chrome/)
* [WhatsApp](https://www.whatsapp.com/download)
* [Zoom](https://zoom.us/download)
* [Spotify](https://www.spotify.com/us/download/other/)


## Command-Line Downloads

First install Homebrew with the following command (confirm with [this](https://brew.sh/) page here): 

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

There is a `Brewfile` in this project directory. After downloading homebrew run the following command: 

```sh
brew bundle
```

## Other Notes

* Review whether to download the [dotfiles repo](https://github.com/mathiasbynens/dotfiles), which is where I got the code for my bash profiles. I think all of the bash files and the alias files are not necessary because all of the important stuff is included in the `.zshrc` file but I am not sure.

Not sure what the best way to download X-Code is. Might be better to do it via the Apple Store.

Consider downloading database software like MongoDB Compass and PostgresSQL.