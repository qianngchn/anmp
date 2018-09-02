# anmp
Docker Deployment of ANMP(Alpine, Nginx, MySQL, PHP with PHP-FPM)

## Install
You should have installed `docker` first, then you can run the following commands.

    git clone https://github.com/qianngchn/anmp.git && cd anmp && make

After that, you will get docker images which can be checked with `docker images`.

## Deploy
First, put your virtual host config files, html docs and databases in the `www` directory.

* `data : MySQL databases and logs directory`
* `host.d : Nginx virtual host config files directory`
* `htdocs : Nginx html docs directory of localhost`
* `html : Nginx html docs directory of public sites`
* `logs : PHP, PHP-FPM and Nginx logs directory`

Second, change ip address of name `host` in `anmp.sh` to docker bridge ip address of yours.

    HOSTIP="172.17.0.1" # docker bridge ip address of host machine

Remember docker containers communicate with each other using name `host` not `localhost`.

Last, use `anmp.sh` to manage docker containers. It is very easy to use these commands.

* `./anmp.sh init [all/mysql]: init MySQL database if <www/data> directory is empty.`
* `./anmp.sh start [all/nginx/mysql/phpfpm] : start single or all docker containers.`
* `./anmp.sh stop [all/nginx/mysql/phpfpm] : stop single or all docker containers.`
* `./anmp.sh restart [all/nginx/mysql/phpfpm] : restart single or all docker containers.`
* `./anmp.sh shell [nginx/mysql/phpfpm] : exec into shell on running docker containers.`
* `./anmp.sh status [all/nginx/mysql/phpfpm]: show status of single or all docker containers.`
