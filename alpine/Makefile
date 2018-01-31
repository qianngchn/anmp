DOCKER:=docker
USERNAME:=qianngchn
IMAGENAME:=alpine
USERIMAGE:=$(USERNAME)/$(IMAGENAME)

.PHONY:all clean

all:
	$(DOCKER) build -t $(USERIMAGE) .

clean:
	$(DOCKER) rmi $(USERIMAGE)
