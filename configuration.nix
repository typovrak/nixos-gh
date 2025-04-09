{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.gh = ''
		mkdir -p ${home}/.config
		chown ${username}:${group} ${home}/.config
		chmod 700 ${home}/.config

		# no rm for keeping credentials, adding -p
		mkdir -p ${home}/.config/gh
		chown ${username}:${group} ${home}/.config/gh
		chmod 700 ${home}/.config/gh
		
		cp ${./config.yml} ${home}/.config/gh/config.yml
		chown ${username}:${group} ${home}/.config/gh/config.yml
		chmod 600 ${home}/.config/gh/config.yml
	'';

	environment.systemPackages = with pkgs; [
		gh
	];
}
