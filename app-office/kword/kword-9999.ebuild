# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

KMNAME="koffice"
KMMODULE="${PN}"
inherit kde4-meta

DESCRIPTION="KOffice word processor."

KEYWORDS=""
IUSE="wpd +wv2"

DEPEND="
	wpd? ( app-text/libwpd )
	wv2? ( >=app-text/wv2-0.4.2 )
"
RDEPEND="${DEPEND}"

KMEXTRA="filters/${KMMODULE}/"

KMEXTRACTONLY="
	filters/
	kspread/
	libs/
	plugins/
"

KMLOADLIBS="koffice-libs"

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with wpd)
		$(cmake-utils_use_with wv2)
	)

	kde4-meta_src_configure
}
