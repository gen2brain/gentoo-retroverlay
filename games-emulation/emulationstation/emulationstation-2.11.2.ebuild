# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake desktop

DESCRIPTION="Frontend for emulators (RetroPie Fork)"
HOMEPAGE="https://github.com/RetroPie/EmulationStation"
SRC_URI="https://github.com/RetroPie/EmulationStation/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="emulationstation"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/EmulationStation-${PV}"

DEPEND="
	dev-cpp/eigen:3
	dev-libs/boost
	media-libs/freeimage[png,jpeg]
	media-libs/freetype
	media-libs/libsdl2
	media-video/vlc
	net-misc/curl
	dev-libs/pugixml
"

PATCHES=( "${FILESDIR}/${PN}-include-fix.patch" "${FILESDIR}/${PN}-resources.patch" )
DOCS=( README.md SYSTEMS.md THEMES.md GAMELISTS.md DEVNOTES.md CREDITS.md )

src_install() {
	cmake_src_install

	insinto "/usr/share/${PN}"
	doins -r resources/*

	doicon "${FILESDIR}/${PN}.png"
	domenu "${FILESDIR}/${PN}.desktop"
}

pkg_preinst() {
	if ! has_version "=${CATEGORY}/${PN}-${PVR}"; then
		first_install="1"
	fi
}

pkg_postinst() {
	ewarn ""
	ewarn "The first start of Emulation Station will fail but also creates"
	ewarn "an example config file at \"\${HOME}/.emulationstation/es_systems.cfg\""
	ewarn ""
	ewarn "Also, don't forget to install some themes."
	elog ""
	elog "Current valid platform names for scraping can be found at:"
	elog "\"https://github.com/RetroPie/EmulationStation/blob/master/es-app/src/PlatformId.cpp\""
	elog ""
}
