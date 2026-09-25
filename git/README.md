# git

Config lives in `~/.config/git/`, never `~/.gitconfig`. Git reads both and
`~/.gitconfig` wins, so leaving it absent keeps this module as the only
source of truth. `ignore` is the global exclude file, read from that same
directory by default.

`config` carries no name, email or key. Those go in `~/.config/git/identity`,
which stays off this repo and is pulled in by an `[include]` at the end of
`config`.

## Copy

```bash
mkdir -p ~/.config/git
cp git/config git/ignore ~/.config/git/
cp git/identity.example ~/.config/git/identity
```

Edit `~/.config/git/identity` with your own name, email and key path.

## Setup

Commits and tags are signed with an SSH key, the same one used for GitHub
auth. Generate it if you don't have one:

```bash
ssh-keygen -t ed25519 -C "you@example.com" -f ~/.ssh/id_ed25519
```

Add the **public** key to GitHub under both *Authentication* and *Signing*
keys — two separate entries for the same key.

Then write the allowed-signers file, which is what lets git verify
signatures locally:

```bash
printf '%s namespaces="git" %s\n' \
  "$(git config user.email)" "$(cut -d' ' -f1,2 ~/.ssh/id_ed25519.pub)" \
  > ~/.config/git/allowed_signers
```

## Notes

- SSH signing has no keyring, so git refuses to verify any signature until
  an email is mapped to a public key in `allowed_signers`. Without it
  `git verify-commit` fails and every commit reports `N`, even your own.
- An absent `identity` file makes git fall back to its usual "Please tell
  me who you are" error, rather than silently committing under someone
  else's name.
- `merge.ff = only` refuses anything but a fast-forward, so a diverged
  branch has to be rebased (`pull.rebase` already does that on pull).
