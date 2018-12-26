{...}: {
	# Describe your "deployment"
	network.description = "webserver-local";

	# A single machine description.
	sulfur = {
		imports = [
			./nginx.nix
		];

		deployment.targetEnv = "virtualbox";
		deployment.virtualbox.memorySize = 1024; # megabytes
		deployment.virtualbox.vcpu = 2; # number of cpus
	};
}
