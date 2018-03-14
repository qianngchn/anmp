# anmp
Docker Deployment of ANMP(Alpine, Nginx, MySQL, PHP-FPM)

## Install
You should have installed `docker` first, then you can run the following commands.

    git clone https://github.com/qianngchn/anmp.git && cd anmp && make

After that, you will get docker images which can be checked with `docker images`.

## Deploy
First, put your virtual host config files, html docs and databases in the `www` directory.

* `data : MySQL databases and logs directory`
* `logs : Nginx and PHP-FPM logs directory`
* `host.d : Nginx virtual host config files directory`
* `htdocs : Nginx html docs directory of localhost`
* `html : Nginx html docs directory of public sites`

Second, change ip address of name `host` in `anmp.sh` to docker bridge ip address of yours.

    HOSTIP="172.17.42.1" # docker bridge ip address of host machine

Remember docker containers communicate with each other using name `host` not `localhost`.

Last, use `anmp.sh` to manage docker containers. It is very easy to use these commands.

* `./anmp.sh init : first init your MySQL database if <www/data> directory is empty.`
* `./anmp.sh status : show status of all docker containers, none stands for stopped.`
* `./anmp.sh start <all/nginx/mysql/phpfpm> : start single or all docker containers.`
* `./anmp.sh stop <all/nginx/mysql/phpfpm> : stop single or all docker containers.`
* `./anmp.sh restart <all/nginx/mysql/phpfpm> : restart single or all docker containers.`
* `./anmp.sh shell <nginx/mysql/phpfpm> : break into shell on running docker containers.`
