# Copyright 2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="schellingb/dosbox-pure"

inherit libretro-core

DESCRIPTION="DOSBox Pure libretro core"
HOMEPAGE="https://github.com/schellingb/dosbox-pure"
KEYWORDS=""

LICENSE="GPL-2+"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}
	games-emulation/libretro-info"

S="${S}/libretro"

src_compile() {
	libretro-core_src_compile
}
