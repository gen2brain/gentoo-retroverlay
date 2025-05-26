# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="flyinghead/flycast"
LIBRETRO_COMMIT_SHA="ffaada9e9d23a4a8eedc5f312e315fe63cd22275"

EGIT_SUBMODULES=("*")

inherit git-r3 libretro-core cmake

DESCRIPTION="Multiplatform Sega Dreamcast emulator"
HOMEPAGE="https://github.com/flyinghead/flycast"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gles +opengl openmp vulkan"

REQUIRED_USE="
	|| ( gles opengl )
	opengl? ( !gles )
"

RDEPEND="
	dev-libs/libzip
	opengl? ( virtual/opengl )
	openmp? ( llvm-runtimes/openmp )
	vulkan? ( media-libs/vulkan-loader )
	gles? ( media-libs/mesa[egl(+),gles2] )
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${P}"

src_unpack() {
	git-r3_src_unpack
}

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_SKIP_RPATH=ON
		-DLIBRETRO=ON
		-DUSE_HOST_GLSLANG=ON
		-DUSE_HOST_LIBZIP=ON
		-DUSE_HOST_SDL=ON
		-DWITH_SYSTEM_ZLIB=ON
		-DUSE_LIBAO=OFF
		-DUSE_PULSEAUDIO=OFF
		-DUSE_BREAKPAD=OFF
		-DUSE_OPENGL=$(usex opengl)
		-DUSE_OPENMP=$(usex openmp)
		-DUSE_GLES2=$(usex gles)
		-DUSE_VULKAN=$(usex vulkan)
		-DCMAKE_BUILD_TYPE=Release
	)
	cmake_src_configure

	sed -i 's/SONAME = zip\.so\.5/SONAME = libzip.so.5/' "${BUILD_DIR}"/build.ninja || die "sed failed"
}

src_install() {
	LIBRETRO_CORE_LIB_FILE="${BUILD_DIR}"/${LIBRETRO_CORE_NAME}_libretro.so
	libretro-core_src_install
}
