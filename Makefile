.PHONY:all clean

all clean:
	cd alpine && $(MAKE) $@
	cd nginx && $(MAKE) $@
	cd phpfpm && $(MAKE) $@
	cd mysql && $(MAKE) $@
	cd certbot && $(MAKE) $@
