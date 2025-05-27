# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="EmulationStation themes meta package"
HOMEPAGE="https://github.com/RetroPie/EmulationStation"
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="+alekfull +carbon clean-look nbba pixel retrofit simple simple-dark zoid"

RDEPEND="
	alekfull?		( x11-themes/es-theme-alekfull-nx )
	carbon?			( x11-themes/es-theme-carbon )
	clean-look?		( x11-themes/es-theme-clean-look )
	nbba?			( x11-themes/es-theme-nbba )
	pixel?			( x11-themes/es-theme-pixel )
	retrofit?		( x11-themes/es-theme-retrofit-revisited )
	simple?			( x11-themes/es-theme-simple )
	simple-dark?		( x11-themes/es-theme-simple-dark )
	zoid?			( x11-themes/es-theme-zoid )
"
DEPEND=""
