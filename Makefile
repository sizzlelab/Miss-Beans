# ==============================================================================
# Generated by qmake (2.01a) (Qt 4.7.0) on: Fri 10. Sep 15:55:18 2010
# This file is generated by qmake and should not be modified by the
# user.
#  Name        : C:/Qt/nelimark/MissBeans//Makefile
#  Description : Wrapper Makefile for calling Symbian build tools
#
# ==============================================================================


MAKEFILE          = Makefile
QMAKE             = c:\qt\4.7.0-rc1\bin\qmake.exe
DEL_FILE          = del 2> NUL
DEL_DIR           = rmdir
MOVE              = move
CHK_DIR_EXISTS    = if not exist
MKDIR             = mkdir
XCOPY             = xcopy /d /f /h /r /y /i
ABLD              = ABLD.BAT
DEBUG_PLATFORMS   = winscw gcce armv5 armv6
RELEASE_PLATFORMS = gcce armv5 armv6
MAKE              = make

ifeq (WINS,$(findstring WINS, $(PLATFORM)))
ZDIR=$(EPOCROOT)epoc32\release\$(PLATFORM)\$(CFG)\z
else
ZDIR=$(EPOCROOT)epoc32\data\z
endif

DEFINES	 = -DSYMBIAN -DUNICODE -DQT_KEYPAD_NAVIGATION -DQT_SOFTKEYS_ENABLED -DQT_USE_MATH_H_FLOATS -DQT_NO_DEBUG -DQT_DECLARATIVE_LIB -DQT_XML_LIB -DQT_GUI_LIB -DQT_NETWORK_LIB -DQT_CORE_LIB
INCPATH	 =  -I"C:/Qt/4.7.0-rc1/include/QtCore" -I"C:/Qt/4.7.0-rc1/include/QtCore/tmp" -I"C:/Qt/4.7.0-rc1/include/QtNetwork" -I"C:/Qt/4.7.0-rc1/include/QtNetwork/tmp" -I"C:/Qt/4.7.0-rc1/include/QtGui" -I"C:/Qt/4.7.0-rc1/include/QtGui/tmp" -I"C:/Qt/4.7.0-rc1/include/QtXml" -I"C:/Qt/4.7.0-rc1/include/QtXml/tmp" -I"C:/Qt/4.7.0-rc1/include/QtDeclarative" -I"C:/Qt/4.7.0-rc1/include/QtDeclarative/tmp" -I"C:/Qt/4.7.0-rc1/include" -I"C:/Qt/4.7.0-rc1/include/tmp" -I"C:/Qt/4.7.0-rc1/mkspecs/common/symbian" -I"C:/Qt/4.7.0-rc1/mkspecs/common/symbian/tmp" -I"C:/S60/devices/Nokia_N97_SDK_v1.0/epoc32/include" -I"C:/S60/devices/Nokia_N97_SDK_v1.0/epoc32/include/osextensions/stdapis" -I"C:/S60/devices/Nokia_N97_SDK_v1.0/epoc32/include/osextensions/stdapis/sys" -I"C:/S60/devices/Nokia_N97_SDK_v1.0/epoc32/include/stdapis" -I"C:/S60/devices/Nokia_N97_SDK_v1.0/epoc32/include/stdapis/sys" -I"C:/Qt/nelimark/qxmpp/source" -I"C:/Qt/nelimark/qxmpp/source/tmp" -I"C:/S60/devices/Nokia_N97_SDK_v1.0/epoc32/include/osextensions/stdapis/stlport" -I"C:/S60/devices/Nokia_N97_SDK_v1.0/epoc32/include/stdapis/stlport" -I"C:/S60/devices/Nokia_N97_SDK_v1.0/epoc32/include/oem" -I"C:/S60/devices/Nokia_N97_SDK_v1.0/epoc32/include/middleware" -I"C:/S60/devices/Nokia_N97_SDK_v1.0/epoc32/include/domain/middleware" -I"C:/S60/devices/Nokia_N97_SDK_v1.0/epoc32/include/osextensions" -I"C:/S60/devices/Nokia_N97_SDK_v1.0/epoc32/include/domain/osextensions" -I"C:/S60/devices/Nokia_N97_SDK_v1.0/epoc32/include/domain/osextensions/loc" -I"C:/S60/devices/Nokia_N97_SDK_v1.0/epoc32/include/domain/middleware/loc" -I"C:/S60/devices/Nokia_N97_SDK_v1.0/epoc32/include/domain/osextensions/loc/sc" -I"C:/S60/devices/Nokia_N97_SDK_v1.0/epoc32/include/domain/middleware/loc/sc" -I"C:/Qt/nelimark/MissBeans/moc" -I"C:/Qt/nelimark/MissBeans/moc/tmp" -I"C:/Qt/nelimark/MissBeans/ui" -I"C:/Qt/nelimark/MissBeans/ui/tmp" -I"C:/Qt/nelimark/MissBeans" -I"C:/Qt/nelimark/MissBeans/tmp" -I"C:/Qt/nelimark/MissBeans/rcc" -I"C:/Qt/nelimark/MissBeans/rcc/tmp"
first: default
default: debug-winscw
all: debug release

qmake:
	$(QMAKE) "C:/Qt/nelimark/MissBeans/MissBeans.pro"  -spec ..\..\4.7.0-rc1\mkspecs\symbian-abld -after  OBJECTS_DIR=obj MOC_DIR=moc UI_DIR=ui RCC_DIR=rcc CONFIG+=release

bld.inf: C:/Qt/nelimark/MissBeans/MissBeans.pro
	$(QMAKE) "C:/Qt/nelimark/MissBeans/MissBeans.pro"  -spec ..\..\4.7.0-rc1\mkspecs\symbian-abld -after  OBJECTS_DIR=obj MOC_DIR=moc UI_DIR=ui RCC_DIR=rcc CONFIG+=release

$(ABLD): bld.inf
	bldmake bldfiles

debug: $(ABLD)
	$(ABLD) build winscw udeb
	$(ABLD) build gcce udeb
	$(ABLD) build armv5 udeb
	$(ABLD) build armv6 udeb

release: $(ABLD)
	$(ABLD) build gcce urel
	$(ABLD) build armv5 urel
	$(ABLD) build armv6 urel

debug-winscw: $(ABLD)
	$(ABLD) build winscw udeb
debug-gcce: $(ABLD)
	$(ABLD) build gcce udeb
debug-armv5: $(ABLD)
	$(ABLD) build armv5 udeb
debug-armv6: $(ABLD)
	$(ABLD) build armv6 udeb
release-gcce: $(ABLD)
	$(ABLD) build gcce urel
release-armv5: $(ABLD)
	$(ABLD) build armv5 urel
release-armv6: $(ABLD)
	$(ABLD) build armv6 urel

export: $(ABLD)
	$(ABLD) export

cleanexport: $(ABLD)
	$(ABLD) cleanexport

check: first

run:
	call /S60/devices/Nokia_N97_SDK_v1.0/epoc32/release/winscw/udeb/BeanQt2.exe $(QT_RUN_OPTIONS)

runonphone: sis
	runonphone $(QT_RUN_ON_PHONE_OPTIONS) --sis BeanQt2.sis BeanQt2.exe $(QT_RUN_OPTIONS)

sis:
	$(if $(wildcard BeanQt2_template.pkg), $(if $(wildcard .make.cache), $(MAKE) -f $(MAKEFILE) ok_sis MAKEFILES=.make.cache , $(if $(QT_SIS_TARGET), $(MAKE) -f $(MAKEFILE) ok_sis , $(MAKE) -f $(MAKEFILE) fail_sis_nocache ) ) , $(MAKE) -f $(MAKEFILE) fail_sis_nopkg )

ok_sis:
	createpackage.bat $(QT_SIS_OPTIONS) BeanQt2_template.pkg $(QT_SIS_TARGET) $(QT_SIS_CERTIFICATE) $(QT_SIS_KEY) $(QT_SIS_PASSPHRASE)

unsigned_sis:
	$(if $(wildcard BeanQt2_template.pkg), $(if $(wildcard .make.cache), $(MAKE) -f $(MAKEFILE) ok_unsigned_sis MAKEFILES=.make.cache , $(if $(QT_SIS_TARGET), $(MAKE) -f $(MAKEFILE) ok_unsigned_sis , $(MAKE) -f $(MAKEFILE) fail_sis_nocache ) ) , $(MAKE) -f $(MAKEFILE) fail_sis_nopkg )

ok_unsigned_sis:
	createpackage.bat $(QT_SIS_OPTIONS) -o BeanQt2_template.pkg $(QT_SIS_TARGET)

BeanQt2.sis:
	$(MAKE) -f $(MAKEFILE) sis

installer_sis: BeanQt2.sis
	$(if $(wildcard BeanQt2_installer.pkg), $(MAKE) -f $(MAKEFILE) ok_installer_sis , $(MAKE) -f $(MAKEFILE) fail_sis_nopkg )

ok_installer_sis:
	createpackage.bat $(QT_SIS_OPTIONS) BeanQt2_installer.pkg - $(QT_SIS_CERTIFICATE) $(QT_SIS_KEY) $(QT_SIS_PASSPHRASE)

fail_sis_nopkg:
	$(error PKG file does not exist, 'sis' and 'installer_sis' target are only supported for executables or projects with DEPLOYMENT statement)

fail_sis_nocache:
	$(error Project has to be built or QT_SIS_TARGET environment variable has to be set before calling 'SIS' target)

stub_sis:
	$(if $(wildcard BeanQt2_template.pkg), $(if $(wildcard .make.cache), $(MAKE) -f $(MAKEFILE) ok_stub_sis MAKEFILES=.make.cache , $(if $(QT_SIS_TARGET), $(MAKE) -f $(MAKEFILE) ok_stub_sis , $(MAKE) -f $(MAKEFILE) fail_sis_nocache ) ) , $(MAKE) -f $(MAKEFILE) fail_sis_nopkg )

ok_stub_sis:
	createpackage.bat -s $(QT_SIS_OPTIONS) BeanQt2_stub.pkg $(QT_SIS_TARGET) $(QT_SIS_CERTIFICATE) $(QT_SIS_KEY) $(QT_SIS_PASSPHRASE)

store_build:
	@echo # ============================================================================== > .make.cache && echo # This file is generated by make and should not be modified by the user >> .make.cache && echo # Name : .make.cache >> .make.cache && echo # Part of : lineedits >> .make.cache && echo # Description : This file is used to cache last build target for >> .make.cache && echo # make sis target. >> .make.cache && echo # Version : >> .make.cache && echo # >> .make.cache && echo # ============================================================================== >> .make.cache && echo. >> .make.cache && echo QT_SIS_TARGET ?= $(QT_SIS_TARGET) >> .make.cache

deploy: sis
	call BeanQt2.sis

mocclean: compiler_moc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_source_make_all

compiler_moc_header_make_all: moc\moc_xmppcore.cpp moc\moc_mainwindow.cpp moc\moc_xmpp.cpp
compiler_moc_header_clean:
	-$(DEL_FILE) moc\moc_xmppcore.cpp moc\moc_mainwindow.cpp moc\moc_xmpp.cpp
moc\moc_xmppcore.cpp: xmppcore.h
	C:\Qt\4.7.0-rc1\bin\moc.exe $(DEFINES) $(INCPATH) -DSYMBIAN xmppcore.h -o moc\moc_xmppcore.cpp

moc\moc_mainwindow.cpp: mainwindow.h
	C:\Qt\4.7.0-rc1\bin\moc.exe $(DEFINES) $(INCPATH) -DSYMBIAN mainwindow.h -o moc\moc_mainwindow.cpp

moc\moc_xmpp.cpp: xmppcore.h \
		xmpp.h
	C:\Qt\4.7.0-rc1\bin\moc.exe $(DEFINES) $(INCPATH) -DSYMBIAN xmpp.h -o moc\moc_xmpp.cpp

compiler_rcc_make_all: rcc\qrc_qml.cpp
compiler_rcc_clean:
	-$(DEL_FILE) rcc\qrc_qml.cpp
rcc\qrc_qml.cpp: qml\qml.qrc \
		qml\Person.qml \
		qml\Bean.qml \
		qml\Beans.qml \
		qml\system.js \
		qml\media\button_next.png \
		qml\media\button_close.png \
		qml\media\button_new.png \
		qml\media\bg_login.png \
		qml\media\user_icon.png \
		qml\media\button_go.png \
		qml\media\button_prev.png \
		qml\media\beans\bean_yellow.png \
		qml\media\beans\bean_red.png \
		qml\media\beans\bean_blue.png \
		qml\media\beans\bean_green.png
	c:\Qt\4.7.0-rc1\bin\rcc.exe -name qml qml\qml.qrc -o rcc\qrc_qml.cpp

compiler_image_collection_make_all: qmake_image_collection.cpp
compiler_image_collection_clean:
	-$(DEL_FILE) qmake_image_collection.cpp
compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_uic_make_all: ui\ui_mainwindow.h
compiler_uic_clean:
	-$(DEL_FILE) ui\ui_mainwindow.h
ui\ui_mainwindow.h: mainwindow.ui
	c:\Qt\4.7.0-rc1\bin\uic.exe mainwindow.ui -o ui\ui_mainwindow.h

compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_moc_header_clean compiler_rcc_clean compiler_uic_clean 

create_temps:
	-@ if not exist "C:\Qt\4.7.0-rc1\include\QtCore\tmp" mkdir "C:\Qt\4.7.0-rc1\include\QtCore\tmp"
	-@ if not exist "C:\Qt\4.7.0-rc1\include\QtNetwork\tmp" mkdir "C:\Qt\4.7.0-rc1\include\QtNetwork\tmp"
	-@ if not exist "C:\Qt\4.7.0-rc1\include\QtGui\tmp" mkdir "C:\Qt\4.7.0-rc1\include\QtGui\tmp"
	-@ if not exist "C:\Qt\4.7.0-rc1\include\QtXml\tmp" mkdir "C:\Qt\4.7.0-rc1\include\QtXml\tmp"
	-@ if not exist "C:\Qt\4.7.0-rc1\include\QtDeclarative\tmp" mkdir "C:\Qt\4.7.0-rc1\include\QtDeclarative\tmp"
	-@ if not exist "C:\Qt\4.7.0-rc1\include\tmp" mkdir "C:\Qt\4.7.0-rc1\include\tmp"
	-@ if not exist "C:\Qt\4.7.0-rc1\mkspecs\common\symbian\tmp" mkdir "C:\Qt\4.7.0-rc1\mkspecs\common\symbian\tmp"
	-@ if not exist "C:\Qt\nelimark\qxmpp\source\tmp" mkdir "C:\Qt\nelimark\qxmpp\source\tmp"
	-@ if not exist "C:\Qt\nelimark\MissBeans\moc\tmp" mkdir "C:\Qt\nelimark\MissBeans\moc\tmp"
	-@ if not exist "C:\Qt\nelimark\MissBeans\ui\tmp" mkdir "C:\Qt\nelimark\MissBeans\ui\tmp"
	-@ if not exist "C:\Qt\nelimark\MissBeans\tmp" mkdir "C:\Qt\nelimark\MissBeans\tmp"
	-@ if not exist "C:\Qt\nelimark\MissBeans\rcc\tmp" mkdir "C:\Qt\nelimark\MissBeans\rcc\tmp"

extension_clean: compiler_clean
	-@ if EXIST "C:\Qt\4.7.0-rc1\include\QtCore\tmp" rmdir /s /q  "C:\Qt\4.7.0-rc1\include\QtCore\tmp"
	-@ if EXIST "C:\Qt\4.7.0-rc1\include\QtNetwork\tmp" rmdir /s /q  "C:\Qt\4.7.0-rc1\include\QtNetwork\tmp"
	-@ if EXIST "C:\Qt\4.7.0-rc1\include\QtGui\tmp" rmdir /s /q  "C:\Qt\4.7.0-rc1\include\QtGui\tmp"
	-@ if EXIST "C:\Qt\4.7.0-rc1\include\QtXml\tmp" rmdir /s /q  "C:\Qt\4.7.0-rc1\include\QtXml\tmp"
	-@ if EXIST "C:\Qt\4.7.0-rc1\include\QtDeclarative\tmp" rmdir /s /q  "C:\Qt\4.7.0-rc1\include\QtDeclarative\tmp"
	-@ if EXIST "C:\Qt\4.7.0-rc1\include\tmp" rmdir /s /q  "C:\Qt\4.7.0-rc1\include\tmp"
	-@ if EXIST "C:\Qt\4.7.0-rc1\mkspecs\common\symbian\tmp" rmdir /s /q  "C:\Qt\4.7.0-rc1\mkspecs\common\symbian\tmp"
	-@ if EXIST "C:\Qt\nelimark\qxmpp\source\tmp" rmdir /s /q  "C:\Qt\nelimark\qxmpp\source\tmp"
	-@ if EXIST "C:\Qt\nelimark\MissBeans\moc\tmp" rmdir /s /q  "C:\Qt\nelimark\MissBeans\moc\tmp"
	-@ if EXIST "C:\Qt\nelimark\MissBeans\ui\tmp" rmdir /s /q  "C:\Qt\nelimark\MissBeans\ui\tmp"
	-@ if EXIST "C:\Qt\nelimark\MissBeans\tmp" rmdir /s /q  "C:\Qt\nelimark\MissBeans\tmp"
	-@ if EXIST "C:\Qt\nelimark\MissBeans\rcc\tmp" rmdir /s /q  "C:\Qt\nelimark\MissBeans\rcc\tmp"

pre_targetdeps: \
	generated_sources \
	all_source_deps \
	..\qxmpp\source\debug\libQXmppClient_d.a \
	ui\ui_mainwindow.h

generated_sources: \
	moc\moc_xmppcore.cpp \
	moc\moc_mainwindow.cpp \
	moc\moc_xmpp.cpp \
	rcc\qrc_qml.cpp

all_source_deps: \
	xmppcore.h \
	xmpp.h \
	mainwindow.h \
	ui\ui_mainwindow.h

finalize:

winscw_deployment:

winscw_deployment_clean:

deployment:

deployment_clean:

dodistclean:
	-@ if EXIST "c:\Qt\nelimark\MissBeans\BeanQt2_template.pkg" $(DEL_FILE)  "c:\Qt\nelimark\MissBeans\BeanQt2_template.pkg"
	-@ if EXIST "c:\Qt\nelimark\MissBeans\BeanQt2_stub.pkg" $(DEL_FILE)  "c:\Qt\nelimark\MissBeans\BeanQt2_stub.pkg"
	-@ if EXIST "c:\Qt\nelimark\MissBeans\BeanQt2_installer.pkg" $(DEL_FILE)  "c:\Qt\nelimark\MissBeans\BeanQt2_installer.pkg"
	-@ if EXIST "c:\Qt\nelimark\MissBeans\Makefile" $(DEL_FILE)  "c:\Qt\nelimark\MissBeans\Makefile"
	-@ if EXIST "c:\Qt\nelimark\MissBeans\Makefile_0xE1be7170.mk" $(DEL_FILE)  "c:\Qt\nelimark\MissBeans\Makefile_0xE1be7170.mk"
	-@ if EXIST "c:\Qt\nelimark\MissBeans\MissBeans_0xE1be7170.mmp" $(DEL_FILE)  "c:\Qt\nelimark\MissBeans\MissBeans_0xE1be7170.mmp"
	-@ if EXIST "c:\Qt\nelimark\MissBeans\BeanQt2_reg.rss" $(DEL_FILE)  "c:\Qt\nelimark\MissBeans\BeanQt2_reg.rss"
	-@ if EXIST "c:\Qt\nelimark\MissBeans\BeanQt2.rss" $(DEL_FILE)  "c:\Qt\nelimark\MissBeans\BeanQt2.rss"
	-@ if EXIST "c:\Qt\nelimark\MissBeans\BeanQt2.loc" $(DEL_FILE)  "c:\Qt\nelimark\MissBeans\BeanQt2.loc"
	-@ if EXIST "c:\Qt\nelimark\MissBeans\bld.inf" $(DEL_FILE)  "c:\Qt\nelimark\MissBeans\bld.inf"

distclean: clean dodistclean

clean: $(ABLD)
	-$(ABLD) reallyclean
	-bldmake clean

clean-debug: $(ABLD)
	$(ABLD) reallyclean winscw udeb
	$(ABLD) reallyclean gcce udeb
	$(ABLD) reallyclean armv5 udeb
	$(ABLD) reallyclean armv6 udeb

clean-release: $(ABLD)
	$(ABLD) reallyclean gcce urel
	$(ABLD) reallyclean armv5 urel
	$(ABLD) reallyclean armv6 urel

clean-debug-winscw: $(ABLD)
	$(ABLD) reallyclean winscw udeb
clean-debug-gcce: $(ABLD)
	$(ABLD) reallyclean gcce udeb
clean-debug-armv5: $(ABLD)
	$(ABLD) reallyclean armv5 udeb
clean-debug-armv6: $(ABLD)
	$(ABLD) reallyclean armv6 udeb
clean-release-gcce: $(ABLD)
	$(ABLD) reallyclean gcce urel
clean-release-armv5: $(ABLD)
	$(ABLD) reallyclean armv5 urel
clean-release-armv6: $(ABLD)
	$(ABLD) reallyclean armv6 urel

