# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KDE_TEST="true"
VIRTUALX_REQUIRED="test"
inherit kde5

if [[ ${KDE_BUILD_TYPE} != live ]]; then
	SRC_URI="mirror://kde/stable/${PN}/${PV%.0}/src/${P}.tar.xz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Cross-platform web browser using QtWebEngine"
HOMEPAGE="https://www.falkon.org/"

LICENSE="GPL-3"
SLOT="0"
IUSE="dbus gnome-keyring kde libressl +X"

COMMON_DEPEND="
	$(add_qt_dep qtdeclarative 'widgets')
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork 'ssl')
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtsql 'sqlite')
	$(add_qt_dep qtwebchannel)
	$(add_qt_dep qtwebengine 'widgets')
	$(add_qt_dep qtwidgets)
	dbus? ( $(add_qt_dep qtdbus) )
	gnome-keyring? ( gnome-base/gnome-keyring )
	kde? (
		$(add_frameworks_dep kio)
		$(add_frameworks_dep kwallet)
	)
	libressl? ( dev-libs/libressl:= )
	!libressl? ( dev-libs/openssl:0= )
	X? (
		$(add_qt_dep qtx11extras)
		x11-libs/libxcb:=
		x11-libs/xcb-util
	)
"
DEPEND="${COMMON_DEPEND}
	$(add_qt_dep linguist-tools)
	$(add_qt_dep qtconcurrent)
	gnome-keyring? ( virtual/pkgconfig )
"
RDEPEND="${COMMON_DEPEND}
	!www-client/qupzilla
	$(add_qt_dep qtsvg)
"

src_configure() {
	local mycmakeargs=(
		-DDISABLE_DBUS=$(usex !dbus)
		-DBUILD_KEYRING=$(usex gnome-keyring)
		$(cmake-utils_use_find_package kde KF5Wallet)
		$(cmake-utils_use_find_package kde KF5KIO)
		-DNO_X11=$(usex !X)
	)
	kde5_src_configure
}

pkg_postinst() {
	kde5_pkg_postinst
	elog "If you were previously using QupZilla, you can manually migrate your profiles"
	elog "by moving the config directory from ~/.config/qupzilla to ~/.config/falkon"
}
