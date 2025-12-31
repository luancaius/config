# config

Personal configuration repo with a small helper script to sync to/from your machine.

## Sync script

The repo includes `scripts/config-sync`, which can **deploy** configs from this repo to your machine or **capture** them back.

It’s implemented as a single Python script: `scripts/config-sync`.

### Requirements

- **python3** (used to run the CLI)
- **rsync** (used for directory sync / status)
- **diff** (used for file status / dry-runs)

### Setup

Make it executable:

```bash
chmod +x scripts/config-sync
```

Optional: put it on your PATH:

```bash
mkdir -p "$HOME/bin"
ln -sf "$PWD/scripts/config-sync" "$HOME/bin/config-sync"
```

### Usage

List available components and their mappings:

```bash
scripts/config-sync list
```

See what would change (no writes):

```bash
scripts/config-sync nvim status
scripts/config-sync nvim deploy --dry-run
```

Deploy repo → machine:

```bash
scripts/config-sync all deploy
scripts/config-sync nvim deploy
scripts/config-sync tmux deploy
```

Capture machine → repo:

```bash
scripts/config-sync all capture
scripts/config-sync nvim capture
scripts/config-sync tmux capture
```

Directory mirroring (dangerous; deletes extra files on destination for directory components):

```bash
scripts/config-sync nvim deploy --delete
```

### Notes

- The script creates **backups before overwriting** by default in `~/.config-sync-backups/<timestamp>`.
- You can override backups with:
  - `--no-backup`
  - `--backup-dir /path/to/backups`
- tmux is provided in two variants:
  - `tmux` syncs to `~/.tmux.conf`
  - `tmux-xdg` syncs to `~/.config/tmux/tmux.conf`


