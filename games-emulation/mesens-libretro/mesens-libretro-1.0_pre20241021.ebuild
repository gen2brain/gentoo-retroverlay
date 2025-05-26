# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="libretro/Mesen-S"
LIBRETRO_COMMIT_SHA="d4fca31a6004041d99b02199688f84c009c55967"

inherit libretro-core

DESCRIPTION="Mesen-S is a cross-platform (Windows & Linux) SNES emulator built in C++ and C#"
HOMEPAGE="https://github.com/libretro/Mesen-S"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}
		games-emulation/libretro-info"

S="${S}/Libretro"
LIBRETRO_CORE_NAME="mesen-s"
