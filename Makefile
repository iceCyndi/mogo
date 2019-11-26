CXX=g++

BIN_PATH = /usr/local/bin

INCLUDE_PATH = /usr/local/include
MYSQL_INCLUDE_PATH = /usr/include/mysql
MYSQL_PLUS_PLUS_INCLUDE_PATH = /usr/include/mysql++
TINYXML_INCLUDE_PATH = /usr/include

TINYXML_LIB_PATH = /usr/lib
LIB_PATH = /usr/lib
MYSQL_LIB_PATH = /usr/lib/mysql
LOCAL_LIB_PATH = /usr/local/lib

CFLAGS=-W -I$(INCLUDE_PATH) -I$(MYSQL_PLUS_PLUS_INCLUDE_PATH) -I$(MYSQL_INCLUDE_PATH) -I$(BIN_PATH) -I$(TINYXML_INCLUDE_PATH) \
		 -Icommon -Ibase -Icell -Itest -Icwmd -Ilogin -Idbmgr -Itimerd -c -g -std=c++0x -DSYNC_DB_TEST -D__LUA_5_2_1 -D_USE_REDIS -D__AOI_PRUNING \
		 -D__SPEED_CHECK  \
		 -D__PLUTO_ORDER \
		 -D__RELOGIN \
		 -D__PLAT_PLUG_IN_NEW \
		 #-D__OPTIMIZE_PROP_SYN
		 #-D__TEST
		 #-D__USE_MSGPACK \
		 #-D_GC_DEBUG
#-Icommon -Ibase -Icell -Itest -Icwmd -Ilogin -Idbmgr -Itimerd -c -g -DSYNC_DB_TEST -D_MYPROF -D_USE_REDIS -D_DEBUG_PLUTO
#-Icommon -Ibase -Icell -Itest -Icwmd -Ilogin -Idbmgr -Itimerd -c -g -DSYNC_DB_TEST -D_USE_RECV_BUFF 
#		 -Icommon -Ibase -Icell -Itest -Icwmd -Ilogin -Idbmgr -Itimerd -c -g -DSYNC_DB_TEST -D_GC_DEBUG
LFLAGS=-L$(LIB_PATH) -L$(MYSQL_LIB_PATH) -L$(LOCAL_LIB_PATH) -L$(TINYXML_LIB_PATH) \
		-llua -ltinyxml -ldl -lm  -g -lpthread -lmysqlclient -luuid -lhiredis -lcurl -lboost_regex -Wl,-E
		#-llua -ltinyxml -ldl -lm  -g -pg -lpthread -lmysqlclient -luuid -lhiredis -lcurl -Wl,-E
LUALIB=$(LOCAL_LIB_PATH)/liblua.a $(TINYXML_LIB_PATH)/libtinyxml.a $(LOCAL_LIB_PATH)/libssl.a $(LOCAL_LIB_PATH)/libcrypto.a \
       #$(LOCAL_LIB_PATH)/libmsgpack.a

COMMON_O = common/type_mogo.o common/entity_mgr.o common/mailbox.o common/world.o \
	common/defparser.o common/epoll_server.o common/net_util.o common/xmsg.o \
	common/entity.o common/lua_mogo.o common/pluto.o common/util.o common/xsem.o \
	common/rpc_mogo.o common/timer.o common/balance.o common/path_founder.o \
	common/logger.o common/cfg_reader.o common/exception.o common/bitcryto.o common/timer_action.o\
	common/md5.o common/memory_pool.o common/mutex.o common/lua_bitset.o common/debug.o common/cjson.o \
	common/stopword.o common/base64.o
BASE_O = base/entity_base.o  base/lua_base.o  base/world_base.o
CELL_O = cell/entity_cell.o  cell/aoi.o  cell/lua_cell.o  cell/space.o  cell/world_cell.o
TOOLS_O = tools/stop.o
OTHERS_O=$(COMMON_O) $(BASE_O) $(CELL_O)

#POLICY_SERVER_O = test/policy.o 
BASEAPP_O = base/baseapp.o
CELLAPP_O = cell/cellapp.o
LOGIN_O = loginapp/main.o
#TOOL_STOP_O = tools/stop.o


ALL_O = $(OTHERS_O)

BIN_HOME = ./bin/
APP=$(BIN_HOME)/loginapp
#		$(BIN_HOME)/login.cgi

%.o:%.cpp
	$(CXX) $(CFLAGS) $< -o $@
	

all:$(ALL_O)
	$(CXX) $(LFLAGS) $(OTHERS_O) $(LOGIN_O)       -o $(BIN_HOME)/loginapp $(LUALIB)
	
clean:
	-rm -f $(ALL_O) $(APP)



