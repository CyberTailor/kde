# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

KMNAME=kdegames
inherit kde4-meta

DESCRIPTION="Base library common to many KDE games."
KEYWORDS="~amd64"
IUSE="debug"

DEPEND=">=dev-games/ggz-client-libs-0.0.14"
RDEPEND="${DEPEND}"

#RESTRICT="test"
