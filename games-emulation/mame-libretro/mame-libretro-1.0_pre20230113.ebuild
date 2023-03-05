# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="libretro/mame"
LIBRETRO_COMMIT_SHA="f7761a9902d59030882c58d4482446196e748c50"
inherit libretro-core

LIBRETRO_CORE_NAME="mamearcade"

DESCRIPTION="MAME (current) for libretro."
HOMEPAGE="https://github.com/libretro/mame"
KEYWORDS="~amd64 ~x86"

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

