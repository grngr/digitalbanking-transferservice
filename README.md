# Docker based Digital Banking Fund Transfer Service

## 1. Define the project components

1.1: Create an empty project directory ($PROJECT_DIRECTORY = digitalbanking-transferservice)  
```
mkdir digitalbanking-transferservice  
cd digitalbanking-transferservice  
```

1.2: In $PROJECT_DIRECTORY create:  
* Dockerfile
* docker-compose.yml
* config/requirements.txt
* config/nginx/nginx.conf
* config/db/init.sql

> You may create one or more file(s) with any names in config/nginx and config/db

## 2. Create a Django project

2.1: Create the Django project using the docker-compose command  
```
cd $PROJECT_DIRECTORY
docker-compose run poc-bank-ft-web django-admin.py startproject poc_bank ./poc_bank
```
>The following message would be finally displayed:  
>WARNING: Image for service poc_bank_ft_web was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.

2.2: Modify $PROJECT_DIRECTORY/poc_bank/poc_bank/settings.py  
```
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql_psycopg2",
        "NAME": "poc_bank",
        "USER": "postgres",
        "PASSWORD": "",
        "HOST": "poc-bank-ft-db",
        "PORT": "",
    }
}
```

2.3: Run the container for the first time
```
docker-compose up -d (To stop use docker-compose stop)  
```

2.4: Access the project  

`http://localhost`

## 3. Create Django App and User
docker-compose run poc-bank-ft-web /usr/local/bin/python poc_bank/manage.py startapp fund_transfer  
docker-compose run poc-bank-ft-web /usr/local/bin/python poc_bank/manage.py makemigrations fund_transfer  
docker-compose run poc-bank-ft-web /usr/local/bin/python poc_bank/manage.py migrate  
docker-compose run poc-bank-ft-web /usr/local/bin/python poc_bank/manage.py createsuperuser  
docker-compose run poc-bank-ft-web /usr/local/bin/python poc_bank/manage.py collectstatic  

## 4. Docker Compose Commands
4.1: Container start stop from second time onwards  
```
docker-compose start
docker-compose stop
docker-compose restart
```

4.2 For shell accessing  
```
docker ps
docker exec -it poc-bank-ft-db-postgres-01 bash
docker exec -it poc-bank-ft-static-nginx-01 bash
docker exec -it poc-bank-ft-web-django-01 bash
```

4.3: For logs  
```
docker-compose logs -f poc-bank-ft-db  
docker-compose logs -f poc-bank-ft-web  
docker-compose logs -f poc-bank-ft-static  
```

4.4: Only for development purpose
```
docker-compose up --force-recreate --remove-orphans -d
docker-compose down
```
## 5. Application Login, Admin and REST URLS

5.1 Application Login URL  
http://localhost  

5.2 Admin URL  
http://localhost/admin  

5.3 REST URL  
http://localhost/api/same_payee/  
http://localhost/api/other_payee/  
http://localhost/api/customer/  
http://localhost/api/customer_account/  
http://localhost/api/fund_transfer/  

# 6. Note
Please user superuser account that you created to login Django Admin.
Create customer(s) and customer account(s) to begin using the Transfer service.

# 7. Screenshots
Available in docs/screenshots  
