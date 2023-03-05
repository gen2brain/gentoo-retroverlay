# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="libretro/beetle-pce-libretro"
LIBRETRO_COMMIT_SHA="f2750b72b58cbc9be0d7d9345bbdeeb634be64a8"

inherit libretro-core

DESCRIPTION="libretro implementation of Mednafen PCE. (PC Engine/TurboGrafx-16)"
HOMEPAGE="https://github.com/libretro/beetle-pce-libretro"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-2"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}
		games-emulation/libretro-info"

pkg_postinst() {
	if [[ "${first_install}" == "1" ]]; then
		ewarn ""
		ewarn "You need to have the following files in your 'system_directory' folder:"
		ewarn "syscard3.pce (PCE-CD BIOS)"
		ewarn ""
		ewarn ""
	fi
}
