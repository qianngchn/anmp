DOCKER:=docker
USERNAME:=qianngchn
IMAGENAME:=phpfpm
USERIMAGE:=$(USERNAME)/$(IMAGENAME)

.PHONY:all clean

all:
	$(DOCKER) build -t $(USERIMAGE) .

clean:
	$(DOCKER) rmi $(USERIMAGE)
