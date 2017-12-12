# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KDE_HANDBOOK="forceoptional"
inherit kde5

DESCRIPTION="Application to take pictures and videos from your webcam by KDE"
HOMEPAGE="https://userbase.kde.org/Kamoso"

LICENSE="GPL-2+"
KEYWORDS=""
IUSE=""

DEPEND="
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	dev-libs/glib:2
	dev-libs/purpose:5
	media-libs/gstreamer:1.0
	media-libs/qt-gstreamer[qt5(+)]
"
RDEPEND="${DEPEND}
	$(add_frameworks_dep kirigami)
	$(add_qt_dep qtquickcontrols2)
	media-plugins/gst-plugins-meta:1.0[alsa,theora,vorbis,v4l]
"
