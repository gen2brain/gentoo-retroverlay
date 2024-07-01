# Copyright 2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="schellingb/dosbox-pure"
LIBRETRO_COMMIT_SHA="ab78c4790ef832753f053886b843a469bef23ed0"

inherit libretro-core

DESCRIPTION="DOSBox Pure libretro core"
HOMEPAGE="https://github.com/schellingb/dosbox-pure"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-2+"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}
	games-emulation/libretro-info"

S="${WORKDIR}/dosbox-pure-${LIBRETRO_COMMIT_SHA}"

src_compile() {
	libretro-core_src_compile
}
