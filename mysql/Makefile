DOCKER:=docker
USERNAME:=qianngchn
IMAGENAME:=mysql
USERIMAGE:=$(USERNAME)/$(IMAGENAME)

.PHONY:all clean

all:
	$(DOCKER) build -t $(USERIMAGE) .

clean:
	$(DOCKER) rmi $(USERIMAGE)
