1. Download the `adbwifi.sh` file
2. Change permission using command `chmod +x adbwifi.sh`

Run by following command:
```bash
    ./adbwifi.sh
```

# To use the command from anywhere in macOS:
```bash
    mkdir ~/bin
```
```bash
    mv adbwifi.sh ~/bin/adbwifi 
```
```bash
    nano ~/.zshrc
```
Add the following into the above file and save it : `export PATH="$PATH:/Users/bs1002/bin"`

```bash
    source ~/.zshrc
```
