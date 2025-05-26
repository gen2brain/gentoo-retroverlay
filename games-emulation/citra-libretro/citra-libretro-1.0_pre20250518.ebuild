# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_COMMIT_SHA="8e634afee9e870620b40efedaef77478cd1f3c99"
LIBRETRO_REPO_NAME="libretro/citra"

inherit git-r3 libretro-core

DESCRIPTION="Nintendo 3DS for libretro"
HOMEPAGE="https://github.com/libretro/citra"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=""
DEPEND="${RDEPEND}"

PATCHES=( "${FILESDIR}/fix-build.patch" )

src_unpack() {
	git-r3_src_unpack
}

src_prepare() {
	eapply_user
	default
}

src_compile() {
	myemakeargs=(
		ARCH=x86_64
	)
	libretro-core_src_compile
}

src_install() {
	LIBRETRO_CORE_LIB_FILE="${S}/${LIBRETRO_CORE_NAME}_libretro.so"
	libretro-core_src_install
}
