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

## Practice of SSH deploy key

Gitkeeper would not try to push repositories when it has a HTTP(S) remote (as you need to type in password/code in most cases). So you might what to use SSH deploy key.

However, GitHub does not support to use a same deploy key for multiple repositories. In this case you can create a deploy key for each repository:

1. Create a SSH key pair inside the `.git` directory of the repository.

    ```bash
    cd .git
    # RSA key pair
    ssh-keygen -f ./id_rsa -t rsa -b 4096 -N ""
    # or ED25519 key pair
    ssh-keygen -f ./id_ed25519 -t ed25519 -N ""
    ```

2. Update `.git/config` like this:

    ```ini
    [core]
        # ...
        # RSA key pair
        sshCommand = ssh -i .git/id_rsa
        # or ED25519 key pair
        sshCommand = ssh -i .git/id_ed25519
    ```

3. Add public key (`id_rsa.pub` or `id_ed25519.pub`) to the repository's deploy keys.
