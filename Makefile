ARCHS = armv7 arm64
include theos/makefiles/common.mk

TWEAK_NAME = EasyRespring
EasyRespring_FILES = Tweak.xm
EasyRespring_FRAMEWORKS = UIKit
EasyRespring_LDFLAGS += -Wl,-segalign,4000

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
