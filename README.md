# Use on Linux

### For connect to github with SSH Key
```ssh-keygen -t ed25519 -C "email@example.com"```\
```eval "$(ssh-agent -s)"```\
```ssh-add ~/.ssh/id_ed25519```\
```cat ~/.ssh/id_ed25519.pub```\

After this copy the key who begins by "ssh-ed25519" go to [Github](https://github.com/settings/keys/) and click New SSH Key and copy the key

### Use this command and launch
```chmod +x update.sh```

### Or if you are not root execute this command
```sudo SSH_AUTH_SOCK=$SSH_AUTH_SOCK ./update.sh```



# Use on Windows

### Just launch powershell and execute it
