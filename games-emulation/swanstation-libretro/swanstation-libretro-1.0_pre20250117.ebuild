# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="libretro/swanstation"
LIBRETRO_COMMIT_SHA="10af0c78ba0e3516e70f4ed7c6020827bdb2647e"

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
}

src_configure() {
	cd build && cmake .. -DBUILD_LIBRETRO_CORE=ON -DBUILD_QT_FRONTEND=OFF -DENABLE_DISCORD_PRESENCE=OFF -DCMAKE_BUILD_TYPE=Release -DENABLE_CHEEVOS=ON -DBUILD_SHARED_LIBS=OFF
}

src_compile() {
	cd build && emake
}

src_install() {
	LIBRETRO_CORE_LIB_FILE="${S}/build/${LIBRETRO_CORE_NAME}_libretro.so"
	libretro-core_src_install
}
