with import <nixpkgs> {};

stdenv.mkDerivation {
	name = "rtl_443_shell";
	buildInputs = [
		cmake
		gnumake
		gcc
		gdb
		pkgconfig
		libtool
		libusb
		libzip
		bzip2
	];
}
