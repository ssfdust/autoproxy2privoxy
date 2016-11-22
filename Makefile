SHELL = /bin/sh

all : gfw.action

gfwlist.txt :
	/usr/bin/wget -O- https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt | base64 -d > $@

gfw.action : gfwlist.txt
	./autoproxy2privoxy $< > $@

.PHONY : clean
clean :
	-rm gfwlist.txt gfw.action
