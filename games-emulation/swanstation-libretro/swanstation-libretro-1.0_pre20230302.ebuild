# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="libretro/swanstation"
LIBRETRO_COMMIT_SHA="d27eb69e9e9dfd5efcb4c686fb48de9d8be3d17b"

CMAKE_MAKEFILE_GENERATOR="emake"

inherit libretro-core cmake

DESCRIPTION="Fast Sony Playstation emulator."
HOMEPAGE="https://github.com/libretro/swanstation"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	media-libs/vulkan-loader
"
RDEPEND="${DEPEND}
	games-emulation/libretro-info"

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
	#cmake_src_compile
}

src_install() {
	LIBRETRO_CORE_LIB_FILE="${S}/build/${LIBRETRO_CORE_NAME}_libretro.so"
	libretro-core_src_install
}
