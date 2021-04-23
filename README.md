# :card_index_dividers: Dotfiles
> My personal set of linux configuration files

- I use [yadm](https://yadm.io/docs/overview) for managing my dotfiles. It's a wrapper for git, plus it will symlink the files for you.
- If you want to make your own dotfiles, have a look at <http://dotfiles.github.io>

## Tips
**To view changes with vscode's diff editor**
1. Create a symlink from `~/.config/yadm/repo.git` to `~/.git`. This tells vs code know that it's viewing a git repository.
2. Temporarily rename `.gitignore.dev` to `.gitignore`. This file hides most of the home directory from vs code's git integration.
3. Open the home directory in vs code.\
Note: When adding a file to git, you must a) edit the gitignore to include that file (`!foo.txt`), and b) use the `-f|--force` flag when running `git add foo.txt`
