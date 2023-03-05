# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 libretro-core

DESCRIPTION="Nintendo 3DS for libretro"
HOMEPAGE="https://github.com/libretro/citra"

EGIT_REPO_URI="https://github.com/libretro/citra"
# These are used by citra and externals/dynarmic which seems to break with git-r3.eclass
EGIT_SUBMODULES=("*" "-externals/fmt" "-externals/xbyak")

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=""
DEPEND="${RDEPEND}"

src_unpack() {
	git-r3_src_unpack

	for i in fmt xbyak; do
		cp -a "${S}/externals/$i" "${S}/externals/dynarmic/externals/" || die
	done
}

src_prepare() {
	eapply_user

	sed -i 's/--disable-programs/--disable-programs --disable-vdpau --disable-vaapi/' Makefile || die "sed failed"
}

src_install() {
	LIBRETRO_CORE_LIB_FILE="${S}/${LIBRETRO_CORE_NAME}_libretro.so"
	libretro-core_src_install
}
