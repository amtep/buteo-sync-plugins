TEMPLATE = app
TARGET = hcontacts-tests 
 
QT += core testlib sql

DEPENDPATH += . \
              ../ \
              ../../../syncmlcommon
              
INCLUDEPATH += . \
    ../ \
    /usr/include/libsynccommon \
    /usr/include/libsyncpluginmgr \
    /usr/include/sync \
    /usr/include/qt4/QtMobility \
    ../../../syncmlcommon

HEADERS += ContactsTest.h SyncMLConfig.h

SOURCES += main.cpp \
	   ContactsTest.cpp \
	   ContactsStorage.cpp \
	   ContactsBackend.cpp \
       SimpleItem.cpp \
	   SyncMLConfig.cpp

LIBS += -L ../
LIBS += -lQtTest -lsynccommon -lsyncpluginmgr -lsyncprofile -lQtContacts -lQtVersit

CONFIG += silent qtestlib

QMAKE_CLEAN += $(OBJECTS_DIR)/*.gcda $(OBJECTS_DIR)/*.gcno
QMAKE_CXXFLAGS += -fprofile-arcs -ftest-coverage
QMAKE_LFLAGS += -fprofile-arcs -ftest-coverage
#install
testfiles.path = /usr/share/sync-app-tests/
testfiles.files =  hcontacts-tests.ref vcard1.txt vcard2.txt vcard3.txt

target.path = /usr/bin/
INSTALLS += target \
            testfiles
