################################################################################
#
# libserial
#
################################################################################

LIBSERIAL_VERSION = 0.6.0rc1
LIBSERIAL_SITE = http://downloads.sourceforge.net/libserial
LIBSERIAL_INSTALL_STAGING = YES
LIBSERIAL_LICENSE = GPLv2+
LIBSERIAL_LICENSE_FILES = COPYING

$(eval $(autotools-package))
