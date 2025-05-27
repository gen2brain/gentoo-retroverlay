# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_COMMIT_SHA="35fc7a218673ef470244fc4c583ee8bf8851b753"
LIBRETRO_REPO_NAME="hrydgard/ppsspp"

inherit git-r3 libretro-core cmake

DESCRIPTION="Libretro port of PPSSPP"
HOMEPAGE="https://www.ppsspp.org/"

LICENSE="Apache-2.0 BSD BSD-2 GPL-2 JSON MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="opengl gles2 vulkan X wayland gbm ffmpeg"
RESTRICT="test"
REQUIRED_USE="
	|| ( gbm wayland X )
	opengl? ( !gles2 )
	gbm? ( !X )
"

RDEPEND="
	app-arch/snappy:=
	dev-libs/libzip:=
	dev-util/glslang:=
	media-libs/libpng:=
	media-libs/libsdl2[joystick]
	sys-libs/zlib:=
	opengl? (
		virtual/opengl
		media-libs/glew:=
		)
	ffmpeg? ( media-libs/ffmpeg )
	gles2? ( media-libs/mesa[egl(+),gles2] )
	vulkan? ( media-libs/vulkan-loader )
	gbm? ( media-libs/mesa[gbm(+)] )
	wayland? ( media-libs/mesa[wayland] )
	X? ( media-libs/mesa[X] )
	games-emulation/libretro-info
"
DEPEND="${RDEPEND}"
ASSETS_DIR="${LIBRETRO_DATA_DIR}"/PPSSPP

src_unpack() {
	git-r3_src_unpack
}

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DX86_64=ON
		-DCMAKE_SKIP_RPATH=ON
		-DLIBRETRO=ON
		-DHEADLESS=OFF
		-DUSE_DISCORD=OFF
		-DUSE_MINIUPNPC=OFF
		-DUSE_ARMIPS=OFF
		-DUSE_CCACHE=OFF
		-DUSE_SYSTEM_FFMPEG=ON
		-DUSE_SYSTEM_LIBZIP=ON
		-DUSE_SYSTEM_LIBPNG=ON
		-DUSE_SYSTEM_SNAPPY=ON
		-DUSE_SYSTEM_ZSTD=ON
		-DUSE_SYSTEM_LIBSDL2=ON
		-DUSE_SYSTEM_MINIUPNPC=ON
		-DUSING_QT_UI=OFF
		-DUSE_FFMPEG=$(usex ffmpeg)
		-DUSING_GLES2=$(usex gles2)
	)

	if use vulkan; then
		mycmakeargs+=( -DVULKAN=ON )
		if use gbm; then
			mycmakeargs+=( -DUSE_VULKAN_DISPLAY_KHR=ON )
		fi
		if use wayland; then
			mycmakeargs+=( -DUSE_WAYLAND_WSI=ON )
		fi
		mycmakeargs+=( -DUSING_X11_VULKAN=$(usex X) )
	fi

	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	LIBRETRO_CORE_LIB_FILE="${BUILD_DIR}"/lib/ppsspp_libretro.so
	libretro-core_src_install

	insinto "${ASSETS_DIR}"
	doins -r "${BUILD_DIR}"/assets/*
}
