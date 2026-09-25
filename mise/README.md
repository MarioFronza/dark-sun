# mise

Global tool versions, one alphabetical `[tools]` table. Everything tracks
`latest`, so `mise install` resolves against whatever is current on the
day a machine is set up rather than pinning a known set.

Build deps for the tools that compile from source (`re2c`, `gd` for php)
are installed via [`../packages/`](../packages/README.md).

## Copy

```bash
mkdir -p ~/.config/mise
cp mise/config.toml ~/.config/mise/config.toml
```

## Apply

```bash
mise install
```

Expect this to take a while on a fresh machine — ruby, php, python and
erlang build from source.

## Notes

- `opam` only installs the OCaml package manager. Run `opam switch create
  <version>` afterwards to get an actual compiler.
- `laravel`, `symfony` and `phoenix` are not mise tools, they are project
  generators on top of `php` and `elixir`:

  ```bash
  composer global require laravel/installer
  composer global require symfony/cli
  mix archive.install hex phx_new
  ```

- `mise/config.toml` is one of the paths mise treats as a project config,
  so inside a clone of this repo it loads on top of the global one. Same
  content either way while the copy step is kept up, but a stale clone
  will quietly override the real config there.
