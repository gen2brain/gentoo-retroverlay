# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils

DESCRIPTION="Powerful and versatile game scraper written in c++"
HOMEPAGE="https://github.com/muldjord/skyscraper"
SRC_URI="https://github.com/muldjord/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtxml:5
"
DEPEND="${RDEPEND}
"

src_prepare() {
	default

	if use examples; then
		sed -i 's:/usr/local/etc:/usr/share:g' skyscraper.pro || die "sed failed"
	else
		sed -i 's/ cacheexamples/ /g' skyscraper.pro || die "sed failed"
		sed -i 's/ impexamples/ /g' skyscraper.pro || die "sed failed"
		sed -i 's/ resexamples/ /g' skyscraper.pro || die "sed failed"
		sed -i 's/ examples/ /g' skyscraper.pro || die "sed failed"
	fi

	sed -i 's:/usr/local/bin:/usr/bin:g' skyscraper.pro || die "sed failed"
}

src_configure() {
	eqmake5 PREFIX="${EPREFIX}"/usr LIBDIR=$(get_libdir)
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
