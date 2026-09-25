# RTK - Rust Token Killer

Token-optimized CLI proxy, cuts up to 90% of bash output.

The Bash hook rewrites commands automatically (`git status` runs as
`rtk git status`), so nothing needs prefixing by hand.

Meta commands, which do have to be called directly:

```bash
rtk gain              # token savings analytics
rtk gain --history    # command usage history with savings
rtk discover          # analyze Claude Code history for missed opportunities
rtk proxy <cmd>       # run a command unfiltered, for debugging
```
