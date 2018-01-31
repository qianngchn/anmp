DOCKER:=docker
USERNAME:=qianngchn
IMAGENAME:=nginx
USERIMAGE:=$(USERNAME)/$(IMAGENAME)

.PHONY:all clean

all:
	$(DOCKER) build -t $(USERIMAGE) .

clean:
	$(DOCKER) rmi $(USERIMAGE)
