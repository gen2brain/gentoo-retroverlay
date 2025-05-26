# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="libretro/mgba"
LIBRETRO_COMMIT_SHA="c9bbf28b091c4c104485092279c7a6b114b2e8ff"

inherit libretro-core

DESCRIPTION="libretro implementation of mGBA. (Game Boy Advance)"
HOMEPAGE="https://github.com/libretro/mgba"
KEYWORDS="~amd64 ~x86"

LICENSE="MPL-2.0"
SLOT="0"
IUSE="epoxy ffmpeg +gles2 lto lzma +opengl pgo pgopost png +zip zlib"
REQUIRED_USE="
	epoxy? ( gles2 )
	gles2? ( opengl )
	pgopost? ( pgo )
	png? ( zlib )
"

DEPEND="
	epoxy? ( media-libs/libepoxy:0= )
	ffmpeg? ( virtual/ffmpeg:0= )
	lzma? ( app-arch/xz-utils:0= )
	png? ( media-libs/libpng:0= )
	opengl? ( media-libs/mesa:0= )
	png? ( media-libs/libpng:0= )
	zlib? ( sys-libs/zlib:0= )
"
RDEPEND="${DEPEND}
		games-emulation/libretro-info"

src_unpack() {
	libretro-core_src_unpack

	# For safety, unbundle most bundled third-party libraries.
	mkdir "${S}"/src/third-party-unused
	mv \
		"${S}"/src/third-party/{libpng,lzma,zlib} \
		"${S}"/src/third-party-unused/
}
