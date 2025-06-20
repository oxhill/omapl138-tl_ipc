CC	= arm-arago-linux-gnueabi-gcc
CFLAGS  = -Wall -ffloat-store  -fPIC -Wunused -Dfar= -ggdb -D DEBUG 
LDFLAGS = -ggdb -Wall -Wl,-Map=$@.map
LDLIBS  = -lpthread -lc -lrt

srcs    = main.c 
objs	= $(patsubst %.c,%.o,$(srcs))

target  = app_host

all : $(target)

$(target) : $(objs)
	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS)

%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.d : %.c
	@set -e; rm -f $@; \
	$(CC) -M $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$

-include $(srcs:.c=.d)

.PHONY : clean

clean:
	-rm $(target) $(objs) *.d* *.map
