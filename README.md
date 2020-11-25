# Docker Starter KIT - Nginx/MariaDB/PHP



## Install

You can use one of envoronmets **dev** or **prod**.  

The difference between dev and prod is that xdebug and phpMyAdmin are available in the dev environment.

To Install desired envoronment run in console next command:

### Dev environment:
```
git clone https://github.com/zaytseff/nmp-dsk.git && cd ./nmp-dsk/ && sh ./docker/env/init.sh dev
``` 

Prod environment:
```
git clone https://github.com/zaytseff/nmp-dsk.git && cd ./nmp-dsk/ && sh ./docker/env/init.sh prod
``` 

Build containers:

```
docker-compose build
```

Run containers:

```
docker-compose up -d
```

