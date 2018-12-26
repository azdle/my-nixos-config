{...}: {
	# Describe your "deployment"
	network.description = "webserver";

	# A single machine description.
	sulfur = {
		imports = [
			./nginx.nix
		];

		#deployment.targetEnv = "none";
		deployment.targetHost = "sulfur.psbarrett.com";
		networking.hostName = "sulfur";

		fileSystems."/" = {
			device = "/dev/disk/by-uuid/2a84f053-fb89-45e4-ada5-b1ab70f5aa5c";
			fsType = "btrfs";
		};


		boot.loader.grub = {
			enable = true;
			version = 2;
			device = "/dev/vda";
		};
	};
}
