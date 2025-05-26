# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="libretro/neocd_libretro"
LIBRETRO_COMMIT_SHA="5eca2c8fd567b5261251c65ecafa8cf5b179d1d2"

inherit libretro-core

DESCRIPTION="Neo Geo CD emulator for libretro"
HOMEPAGE="https://github.com/libretro/neocd_libretro"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}
		games-emulation/libretro-info"
