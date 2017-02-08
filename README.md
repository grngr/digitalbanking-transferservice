# Docker based Digital Banking Fund Transfer Service

## Define the project components

### Step 1: Create an empty project directory (digitalbanking-transferservice)

mkdir digitalbanking-transferservice  
cd digitalbanking-transferservice  


### Step 2: Create a new file called Dockerfile in digitalbanking-transferservice

### Step 3: Create a file called docker-compose.yml in digitalbanking-transferservice

### Step 4: Create a requirements.txt in digitalbanking-transferservice/config

## Create a Django project

### Step 5: Create the Django project using the docker-compose command

cd digitalbanking-transferservice  
docker-compose run poc_bank_ft_web django-admin.py startproject poc_bank ./poc_bank  


### Step 6: Check DB container  

docker ps
docker exec -it poc_bank_ft_db_postgres_01 bash



### Reference:
https://docs.docker.com/compose/django/  
http://ruddra.com/2016/08/14/docker-django-nginx-postgres/  
http://mmorejon.github.io/en/blog/start-django-project-with-docker/  
