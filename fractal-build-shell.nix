with import <nixpkgs> {};

stdenv.mkDerivation {
	name = "rtl_443_shell";
	buildInputs = [
		gnumake
		ninja
		pkgconfig

		meson
		glib
		cairo
		openssl
		dbus
		atk
		pango
		gdk_pixbuf
		gtk3

		libffi
	];
}
