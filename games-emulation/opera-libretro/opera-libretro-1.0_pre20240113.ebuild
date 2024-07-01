# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="libretro/opera-libretro"
LIBRETRO_COMMIT_SHA="35e16483be900ea8aa20e87d2710b677437f73ce"
inherit libretro-core

DESCRIPTION="libretro implementation of 4DO/libfreedo. (Panasonic 3DO)"
HOMEPAGE="https://github.com/libretro/opera-libretro"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-2"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}
		games-emulation/libretro-info"

pkg_postinst() {
	if [[ "${first_install}" == "1" ]]; then
		ewarn ""
		ewarn "You need to have the following file in your 'system_directory' folder:"
		ewarn "panafz10.bin (Panasonic FZ-10 BIOS)"
		ewarn ""
		ewarn ""
	fi
}
