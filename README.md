# Docker based Digital Banking Fund Transfer Service

## 1. Define the project components

### Step 1.1: Create an empty project directory ($PROJECT_DIRECTORY = digitalbanking-transferservice)

mkdir digitalbanking-transferservice  
cd digitalbanking-transferservice  


### Step 1.2: Create a new file called Dockerfile in $PROJECT_DIRECTORY

### Step 1.3: Create a file called docker-compose.yml in $PROJECT_DIRECTORY

### Step 1.4: Create a requirements.txt in $PROJECT_DIRECTORY/config

### Step 1.5: Create a nginx.conf (any name - >= 1 file) in $PROJECT_DIRECTORY/config/nginx

### Step 1.6: Create an init.sql (any name - >= 1 file) in $PROJECT_DIRECTORY/config/db

## 2. Create a Django project

### Step 2.1: Create the Django project using the docker-compose command

cd $PROJECT_DIRECTORY  
docker-compose run poc_bank_ft_web django-admin.py startproject poc_bank ./poc_bank  

The following message would be finally displayed:
WARNING: Image for service poc_bank_ft_web was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.

### Step 2.2: Modify $PROJECT_DIRECTORY/poc_bank/poc_bank/settings.py

DATABASES = {  
    "default": {  
        "ENGINE": "django.db.backends.postgresql_psycopg2",  
        "NAME": "poc_bank",  
        "USER": "postgres",  
        "PASSWORD": "",  
        "HOST": "poc_bank_ft_db",  
        "PORT": "",  
    }  
}  


### Step 2.3: Run the container for the first time

docker-compose up (To stop use Ctrl + C)  
OR  
docker-compose up -d (To stop use docker-compose stop)  

### Step 2.4: Access the project

http://localhost:8000  

## 3. Create Django App and User
docker-compose run web python manage.py startapp fund_transfer  
docker-compose run web python manage.py createsuperuser  

### Step 2.5: Container start stop from second time onwards

docker-compose start  
docker-compose stop  


### Step 2.6 For shell accessing

docker ps  

docker exec -it poc_bank_ft_db_postgres_01 bash  
docker exec -it poc_bank_ft_static_nginx_01 bash  
docker exec -it poc_bank_ft_web_django_01 bash  
docker exec -it digitalbankingtransferservice_poc_bank_ft_web_run_1  bash  

### Step 2.7: For logs

docker-compose logs poc_bank_ft_db  
docker-compose logs poc_bank_ft_web  
docker-compose logs poc_bank_ft_static  
