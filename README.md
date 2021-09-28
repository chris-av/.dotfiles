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
* [MacTex](https://tug.org/mactex/)
* [TexStudio](https://www.texstudio.org/)
* [JabRef](https://www.jabref.org/)
* [Dropbox](https://www.dropbox.com/downloading)
* [Insomnia](https://insomnia.rest/)
* [Slack](https://slack.com/)
* [Discord](https://discord.com/download)
* [iTerm2](https://iterm2.com/)
* [Snazzy Profile for terminal](https://github.com/sindresorhus/iterm2-snazzy)
* [Dashlane](https://www.dashlane.com/)
* [Visual Studio Code](https://code.visualstudio.com/)
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

## Todos

Make the installation agnostic whether it is run in darwin or linux


