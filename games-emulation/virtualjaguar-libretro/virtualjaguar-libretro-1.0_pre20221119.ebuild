# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="libretro/virtualjaguar-libretro"
LIBRETRO_COMMIT_SHA="2cc06899b839639397b8b30384a191424b6f529d"

inherit libretro-core

DESCRIPTION="Port of Virtual Jaguar to Libretro"
HOMEPAGE="https://github.com/libretro/virtualjaguar-libretro"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}
		games-emulation/libretro-info"
