include (../caQtDM/qtdefs.pri)

unix {
  TEMPLATE = subdirs
  SUBDIRS = caQtDM_Lib1
  exists("/home/ACS/Control/Lib/libDEV.so") {
         SUBDIRS += caQtDM_Lib2
  }
}

win32 {


win32-msvc* {
        DEFINES +=_CRT_SECURE_NO_WARNINGS
        DEFINES += CAQTDM_LIB_LIBRARY
        
        DebugBuild {
                EPICS_LIBS=$$(EPICS_BASE)/lib/win32-x86
                OBJECTS_DIR = debug/obj
                LIBS += $$(QWTHOME)/lib/qwtd.lib
                LIBS += $${EPICS_LIBS}/ca.lib
                LIBS += $${EPICS_LIBS}/COM.lib
                LIBS += $$(QTCONTROLS_LIBS)/debug/qtcontrols.lib
        }
        ReleaseBuild {
                EPICS_LIBS=$$(EPICS_BASE)/lib/win32-x86-debug
                OBJECTS_DIR = release/obj
                LIBS += $$(QWTHOME)/lib/qwt.lib
                LIBS += $${EPICS_LIBS}/ca.lib
                LIBS += $${EPICS_LIBS}/COM.lib
                LIBS += $$(QTCONTROLS_LIBS)/release/qtcontrols.lib
                QMAKE_POST_LINK = $${QMAKE_COPY} .\\release\\caQtDM_Lib.dll $$(BINARY_LOCATION)
        }
 }
     win32-g++ {
	LIBS += $${QWTHOME}/lib/libqwt.a
	LIBS += $${QTCONTROLS_LIBS}/libqtcontrols.a
	LIBS += $${EPICS_LIBS}/ca.lib
	LIBS += $${EPICS_LIBS}/COM.lib
     }
MOC_DIR = ./moc
VPATH += ./src
INCLUDEPATH += ./src
DESTDIR = ./
UI_DIR += ./
INCLUDEPATH += ../caQtDM_QtControls/src
INCLUDEPATH += $$(EPICS_BASE)/include
INCLUDEPATH += $$(EPICS_BASE)/include/os/win32
include (./caQtDM_Lib.pri)




}