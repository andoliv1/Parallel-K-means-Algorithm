.SUFFIXES:
.SUFFIXES: .o .cpp

TARGET1 = serial-kmeans
C_OBJS1 = kmeans.o

ALL_SOURCES = Makefile $(C_SOURCES) $(MY_INCLUDES)

CCX = g++
CXXFLAG = -g -Wall -std=c++11

all: $(TARGET1)

.o: .cpp $(MY_INCLUDES) $(CCX) -c $(CXXFLAGS) $<

$(TARGET1) : $(C_OBJS1)
	$(CCX) $(CXXFLAGS)   $^	$(LIBDIRS) -o $@


clean:
	rm -f $(TARGET1) $(C_OBJS1) *~