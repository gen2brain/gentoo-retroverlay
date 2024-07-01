# Copyright 2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="schellingb/dosbox-pure"
LIBRETRO_COMMIT_SHA="87bf6365158325b76ff238c1ad8daf16a859bbe8"

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
