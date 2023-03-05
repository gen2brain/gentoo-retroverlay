# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="libretro/lrps2"
LIBRETRO_COMMIT_SHA="1f88fb5e663ff8b516dbca00f81fac271333b4aa"

CMAKE_MAKEFILE_GENERATOR="emake"

inherit libretro-core cmake

DESCRIPTION="The Playstation 2 Emulator"
HOMEPAGE="https://github.com/libretro/lrps2"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-2"
SLOT="0"

DEPEND="dev-util/ccache"
RDEPEND="
	dev-cpp/yaml-cpp
	dev-libs/libchdr
	x11-libs/wxGTK:3.0-gtk3
"

S="${WORKDIR}/LRPS2-${LIBRETRO_COMMIT_SHA}"

src_prepare() {
	libretro-core_src_prepare
	mkdir build
	#cmake_src_prepare
}


src_configure() {
	cd build && cmake ..
	#cmake_src_configure
}

src_compile() {
	cd build && emake
}

src_install() {
	LIBRETRO_CORE_LIB_FILE="${S}/build/pcsx2/${LIBRETRO_CORE_NAME}_libretro.so"
	libretro-core_src_install
}
