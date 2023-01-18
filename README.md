# dotfiles-starter

[![forthebadge](https://forthebadge.com/images/badges/gluten-free.svg)](https://forthebadge.com)

[![forthebadge](https://forthebadge.com/images/badges/uses-badges.svg)](https://forthebadge.com)

[![forthebadge](https://forthebadge.com/images/badges/contains-tasty-spaghetti-code.svg)](https://forthebadge.com)

⚡ A robust cross-platform dotfiles setup using tools such as chezmoi & aqua.

I've tried a lot of tooling for more automated setup of my preferences and tooling, and this solution has many benefits.

I've been using this since Sept 2020, so it's well tested and I've not found anything better in all that time.

## Quick Start

1. Use the github release and download source.
1. Run `sh -c "$(wget -qO- git.io/chezmoi)" && sudo mv ./bin/chezmoi /usr/local/bin/chezmoi && rm -rf ./bin`
1. Tweak the chezmoi.toml file for your username.
1. Run this anywhere to bootstrap (you'll want to make sure there's a github token to avoid random API limiting failures):
   `chezmoi init --apply --force --one-shot --keep-going https://github:$GITHUB_OATH_TOKEN@github.com/{{YOUR USERNAME}}/chezmoi.git`

### After

- [Install Renovate GitHub app](https://github.com/marketplace/renovate)
- Config already included in this repo.
  If an onboarding PR comes go ahead and approve.
- Change the update schedule to weekly/monthly if you want in `renovate.json5` (chosen to allow comments over the normal `renovate.json`).
- Note: I have bundled all aqua tools together so you'll get a single pr for all your aqua config updates. 🎉

### Other useful commands

- `git chezmoi` is an alias provided that lets you autocommit all your recent changes and push up to your repo (no prompting for a message, just auto generates).
- `chezmoi update` grabs and applies latest from your repo.
- `chezmoi diff` views what has changed outside your chezmoi repo that would be overwritten.
- `chezmoi add/remove` files to stop or begin managing them.
- `trunk check` to run linting against this project, though if you [install trunk](https://trunk.io/) it should begin to do this automatically, providing automatic pre-commit and pre-push checks such as secret scanning, formatting, linting and more.

## What does this help me do?

- With one command you can initialize a new laptop, devcontainer, codespace, gitpod, windows laptop, or other machine with all your desired tooling and preferences.
  - NOTE: This doesn't have chocolatey package scripts, but that's easy enough to add following the exact same patterns.
- Have a zsh, bash, and powershell (cross-platform) shell with all your aliases, functions, preferences ready to go.
- Update any of these with: `chezmoi update` to grab anything updated in your github repo (which backs this) to target machines.
- Install all your binary tools with either lazy install (a second to setup) or full installs.
- Manage your gitconfig, exclusions, and other preferences in a cross-platform compatible way with the basic templating offered.
  AKA: No more dealing with OS quirks like line endings or paths with slashes being wrong if you copy/paste your gitconfig.
- Run apt install, brew install, aqua install, and others on first time setup and if the install list changes.
- Save your code snippets with a tool like `navi` for cross-machine availability of cheatsheets.
- Adjust your git credential manager dynamically based on the environment.

## Why Aqua

- The majority of my developer tools are binary cli tools.
- _FAST_ cross-platform binary (yeah for Go!).
- Aqua does not build from source.
  If you find yourself grabbing github releases, writing scripts to extra, match, and if you are diligent check the checksum... aqua solves all that very elegantly.
- It's very easy to contribute new tools, because the registry is just a yaml file and meant to be a community collaboration.
- Tooling can be automatically updated by github actions using Renovate, so you get the latest and greatest on your terms.
- Lazy installs let you bootstrap in seconds.

## Why Chezmoi

- [Why Use Chezmoi](https://www.chezmoi.io/why-use-chezmoi/)
- If you don't care about backing up your preferences and mostly work in a single long-lived machine then maybe you won't benefit.
  For me, I like to know the problems I solve or iterate on won't be lost with a change to a new machine so I automate all things.
- Sync across machines (on demand).
- Template to handle different OS or situations.
- It "just works".
- Learning curve for templating can be a little tough if new to Go templates, but it's worth the long-term benefits.
- Adding a new file is as simple as `chezmoi add myfile/app/path.yml` and now it's deployed and controlled by chezmoi.

## Alternatives

## Git and dotfiles clone

- Doesn't template for different OS.
- Can't easily add content from different paths.
- Not really meant for running scripts, detecting diffs across controlled files in other paths in the OS.

## For Just Installing Tools

- asdf
  - Non-Intuitive workflow with plugin and tool installation results in a confusing experience (and I used for a while and supported a team using it).
  - Difficult to contribute new plugins.
  - Not cross-platform and heavily based on shell scripts.
  - While it does help with runtime installation beyond binaries, I've found that there is often another solution besides the asdf approach that is equally useful (think Volta/fnm for node for example).
- brew
  - slow 🐌
  - builds from source for many project which is massively slower than grabbing a pre-compiled binary.

### For Setup Configuration

- Ansible
  - requires python3 and longer to setup than a binary.
  - slow
  - applying roles still ends up being scripts or other actions and is generally more steps of abstraction.
    While great for large scale VM maintenance with teams, it's more complex and time consuming for an individual developer.
  - Not really designed for cross-platform capability without a lot of work (looking at you Windows!)
