# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="libretro/yabause"
EGIT_BRANCH="kronos"

inherit libretro-core

DESCRIPTION="Yabause/YabaSanshiro/Kronos libretro ports (Sega Saturn emulators)."
HOMEPAGE="https://github.com/libretro/yabause"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-2"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}
	games-emulation/libretro-info"

S="${S}/yabause/src/libretro"
