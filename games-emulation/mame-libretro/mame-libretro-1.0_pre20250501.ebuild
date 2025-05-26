# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="libretro/mame"
LIBRETRO_COMMIT_SHA="ee7155be0735e38f47c555a69217a2b77d6eca13"
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

PATCHES=( "${FILESDIR}/fix-build.patch" )

src_prepare() {
	default
}

src_compile() {
	myemakeargs=(
		SUBTARGET=arcade
		platform=linux
	)
	libretro-core_src_compile
}

src_install() {
	LIBRETRO_CORE_LIB_FILE="${S}"/mamearcade_libretro.so
	libretro-core_src_install
}

