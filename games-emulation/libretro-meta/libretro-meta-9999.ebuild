# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Meta package for various libretro implementations"
HOMEPAGE="http://www.libretro.com/"

SLOT="0"
LICENSE="metapackage"
KEYWORDS="~amd64 ~x86"

IUSE="+3do 3ds amiga +arcade c64 dos +dreamcast +ds +gameboy +gamecube +genesis +jaguar mame +n64 nes pce +psx +ps2 +psp +saturn +snes +wii"

RDEPEND="
	3do? ( games-emulation/opera-libretro )
	3ds? ( games-emulation/citra-libretro )
	amiga? ( games-emulation/puae-libretro )
	arcade? ( games-emulation/fbneo-libretro )
	c64? ( games-emulation/vice-x64-libretro )
	dos? ( games-emulation/dosbox-pure-libretro )
	dreamcast? ( games-emulation/flycast-libretro )
	ds? ( games-emulation/desmume-libretro )
	gameboy? ( games-emulation/mgba-libretro )
	gamecube? ( games-emulation/dolphin-libretro )
	genesis? ( games-emulation/genesis_plus_gx-libretro )
	jaguar? ( games-emulation/virtualjaguar-libretro )
	mame? ( games-emulation/mame-libretro )
	n64? ( games-emulation/parallel_n64-libretro )
	nes? ( games-emulation/mesen-libretro )
	pce? ( games-emulation/mednafen-pce-libretro )
	psx? ( games-emulation/swanstation-libretro )
	ps2? ( games-emulation/pcsx2-libretro )
	psp? ( games-emulation/ppsspp-libretro )
	saturn? ( games-emulation/kronos-libretro )
	snes? ( games-emulation/mesens-libretro )
	wii? ( games-emulation/dolphin-libretro )"

DEPEND=""
