with import <nixpkgs> {};

stdenv.mkDerivation {
	name = "rust-dev-shell"; # unused
	buildInputs = [
		gcc
		gdb
		openssl_1_1_0
		pkgconfig
		# for wasm
		gcc5
		gcc6
		gcc7
	];
}
