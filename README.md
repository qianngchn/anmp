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

Second, set your host ip address in the `anmp.sh`, containers will communicate with each other using host ip address.

    HOSTIP="192.168.1.90" # host ip address of machine

Last, use `anmp.sh` to manage docker containers. It is very easy to use these commands.

* `./anmp.sh init : first init your MySQL database if <www/data> directory is empty.`
* `./anmp.sh start <all/nginx/mysql/phpfpm> : start single or all docker containers.`
* `./anmp.sh stop <all/nginx/mysql/phpfpm> : stop single or all docker containers.`
* `./anmp.sh shell <nginx/mysql/phpfpm> : into shell on running docker containers.`
