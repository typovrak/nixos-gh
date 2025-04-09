# nixos-gh

nixos-gh = fetchGit {
	url = "https://github.com/typovrak/nixos-gh.git";
	ref = "main";
};

(import "${nixos-gh}/configuration.nix")
