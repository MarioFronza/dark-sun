# github (gh CLI)

`config.yml` sets `git_protocol: ssh`, so `gh repo clone` and `gh pr
checkout` write SSH remotes and reuse the key the [`git/`](../git/README.md)
module already needs for signing. The default is HTTPS, which would ask
for a token on every push.

`hosts.yml` holds the auth token and is never tracked here — log in fresh
on each machine.

`github-cli` is installed via [`../packages/`](../packages/README.md).

## Copy

```bash
mkdir -p ~/.config/gh
cp github/config.yml ~/.config/gh/config.yml
```

## Apply

```bash
gh auth login
```

Pick SSH when it asks for the protocol, and let it use the existing key
rather than generating another one.

## Notes

- Several [`../claude/`](../claude/README.md) skills shell out to `gh`
  (`gh pr create`, `gh pr diff`, `gh issue view`, `gh api`). They fail
  with `You are not logged into any GitHub hosts` until `gh auth login`
  runs, and nothing else in the setup depends on it, so it is easy to
  leave undone on a new machine.
