################################################################################
#
# midori
#
################################################################################

MIDORI_VERSION = 0.5.2
MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.bz2
MIDORI_SITE = http://archive.xfce.org/src/apps/midori/0.5/
MIDORI_LICENSE = LGPLv2.1+
MIDORI_LICENSE_FILES = COPYING
MIDORI_DEPENDENCIES = \
	host-intltool \
	host-pkgconf \
	host-vala \
	libgtk2 \
	libsexy \
	webkit \
	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
	$(if $(BR2_PACKAGE_LIBICONV),libiconv)

ifneq ($(BR2_PACKAGE_XORG7),y)
define MIDORI_WITHOUT_X11
	$(SED) "s/check_pkg ('x11')/#check_pkg ('x11')/" $(@D)/wscript
endef
endif

define MIDORI_CONFIGURE_CMDS
	$(MIDORI_WITHOUT_X11)
	(cd $(@D); \
		$(TARGET_CONFIGURE_OPTS)	\
		./waf configure			\
		--prefix=/usr			\
		--disable-libnotify		\
                --disable-zeitgeist             \
       )
endef

define MIDORI_BUILD_CMDS
       (cd $(@D); ./waf build -j $(PARALLEL_JOBS))
endef

define MIDORI_INSTALL_TARGET_CMDS
       (cd $(@D); ./waf --destdir=$(TARGET_DIR) install)
endef

$(eval $(generic-package))
