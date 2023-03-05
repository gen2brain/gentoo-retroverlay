# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="libretro/mame"
inherit git-r3 libretro-core

LIBRETRO_CORE_NAME="mamearcade"

DESCRIPTION="MAME (current) for libretro."
HOMEPAGE="https://github.com/libretro/mame"
KEYWORDS=""

LICENSE="MAME-GPL"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}
	games-emulation/libretro-info"

src_prepare() {
	default
}

src_compile() {
	myemakeargs=(
		SUBTARGET=arcade
	)
	libretro-core_src_compile
}

src_install() {
	LIBRETRO_CORE_LIB_FILE="${S}"/mamearcade_libretro.so
	libretro-core_src_install
}
