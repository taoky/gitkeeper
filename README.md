# gitkeeper

Works like etckeeper, but tracks git repos specified instead of just `/etc`.

## Finding all git repos

```bash
sudo find / -name .git -type d -xdev 2>/dev/null
```

## `/etc/gitkeeper.conf` example

```json
{
    "rsyncd": "/etc/rsyncd",
    "systemd-network": "/etc/systemd/network",
}
```
