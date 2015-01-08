include theos/makefiles/common.mk

TWEAK_NAME = EasyRespring
EasyRespring_FILES = Tweak.xm
EasyRespring_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
