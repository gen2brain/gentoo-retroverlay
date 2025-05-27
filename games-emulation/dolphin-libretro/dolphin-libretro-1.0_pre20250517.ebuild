# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="libretro/dolphin"
LIBRETRO_COMMIT_SHA="a09f78f735f0d2184f64ba5b134abe98ee99c65f"

inherit libretro-core cmake

DESCRIPTION="A Gamecube/Wii emulator core for libretro"
HOMEPAGE="https://github.com/libretro/dolphin"
KEYWORDS="~amd64 ~x86"
IUSE="+opengl vulkan +X"

LICENSE="GPL-2"
SLOT="0"

RDEPEND="
	dev-libs/hidapi=
	dev-libs/libfmt=
	dev-libs/lzo=
	dev-libs/pugixml
	dev-qt/qtconcurrent
	media-libs/libpng
	media-libs/libsfml
	media-libs/mesa
	net-libs/enet
	net-libs/mbedtls
	net-misc/curl
	sys-libs/readline
	sys-libs/zlib
	x? (
		x11-libs/libXext
		x11-libs/libXi
		x11-libs/libXrandr
	)
	opengl? ( virtual/opengl )
	vulkan? ( media-libs/vulkan-loader )
	virtual/libusb
"
RDEPEND="${DEPEND}
	games-emulation/libretro-info"

PATCHES=( "${FILESDIR}/fix-build.patch" )

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCCACHE_BIN=CCACHE_BIN-NOTFOUND
		-DENABLE_LLVM=OFF
		-DBUILD_SHARED_LIBS=OFF
		-DLIBRETRO=ON
		-DLIBRETRO_STATIC=1
		-DENABLE_QT=0
		-DUSE_SHARED_ENET=ON
		-DCMAKE_BUILD_TYPE=Release
		-DCMAKE_INSTALL_PREFIX=/usr
		-DENABLE_X11=$(usex X)
	)
	cmake_src_configure
}

src_install() {
	LIBRETRO_CORE_LIB_FILE="${WORKDIR}/${PF}_build/${LIBRETRO_CORE_NAME}_libretro.so"
	libretro-core_src_install
}
