# 🐙 NixOS GH

> Declarative NixOS module to install GitHub CLI, ```gh```, and scaffold a secure per-user ```~/.config/gh/config.yml```.

## 📦 Features

- 🔒 **Secure config directory :** Creates ```~/.config/gh``` with ```700``` permissions and correct ownership.

- 📋 **Config deployment :** Installs ```config.yml``` into ```~/.config/gh``` with ```600``` permissions.

- 🚀 **GitHub CLI :** Ensures ```gh``` is available in ```environment.systemPackages```.

- 🔄 **Idempotent :** Safe to run on every ```nixos-rebuild```, preserves existing credentials.

- 💾 **Backup guidance :** Documentation includes commands to back up any existing ```~/.config/gh/config.yml```.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.config/gh/config.yml{,.bak}
```

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-gh = fetchGit {
    url = "https://github.com/typovrak/nixos-gh.git";
    ref = "main";
    rev = "f94f413f175db047e5c16c71f9d44f13db7423f1"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-gh}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

## 🎬 Usage

See all commands available with
```bash
gh help
```

Or login with
```bash
gh auth login
```

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
