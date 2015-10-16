ARCHS = armv7 arm64
include theos/makefiles/common.mk

TWEAK_NAME = EasyRespring2
EasyRespring2_FILES = Tweak.xm
EasyRespring2_FRAMEWORKS = UIKit
EasyRespring2_LDFLAGS += -Wl,-segalign,4000

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
