# EX188
## Task 1: Creating simple container
- Create a container:
  - Use image httpd:latest
  - Run in detached mode
  - Container name 'task1'
  - Bind container port 80 to local port 8081
  - Container should take '$HOME/fusion-ex188/task1/index.html' from local file. If we update local index.html file content then it should reflect in container. (hint: httpd default html location - /usr/local/apache2/htdocs)

## Task 2: Working inside container
- Create a container:
  - Use image httpd:latest
  - Run in detached mode
  - Container name 'task2'
  - Bind container port 80 to local port 8082
- Work inside container:
  - Create /html directory in container
  - Copy local $HOME/fusion-ex188/task2/index.html file to /html in container
  - Copy local $HOME/fusion-ex188/task2/httpd.conf to /usr/local/apache2/conf/httpd.conf in container
  - Run httpd -k restart command

## Task 3: Environment variables in containers
- Create 2 containers:
  - 1° container name 'container-1'
  - 2° container name 'container-2'
  - Use image quay.io/j-martinez/task3:1.0
  - Run container in background
  - Bind both containers port 3000 to local port 8083
  - Set environment variables:
    - 1° container: RUN_ENV=container-1
    - 2° container: RUN_ENV=container-2

## Task 4: Write a Containerfile and create and push Container Image in registry
### Create Containerfile: 'Containerfile.mydb'
  - Use image docker.io/library/mariadb:latest
  - Copy init-mariadb.sql file to /docker-entrypoint-initdb.d/ container directory
  - Two build arguments
    a. DB_ROOT_PASSWORD
    b. DB_PASSWORD
  - Four environment variables.
    a. MYSQL_DATABASE, value: fusion
    b. MYSQL_USER, value: admin
    c. MYSQL_ROOT_PASSWORD
    d. MYSQL_PASSWORD
  - MYSQL_ROOT_PASSWORD and MYSQL_PASSWORD will take values from build params DB_ROOT_PASSWORD and DB_PASSWORD respectively.
  - Expose to port 3306
- Create image from Containerfile and pass build params 'fusion' for both parameters and name image 'mariadb-fusion'
- Push image to repo quay.io/$USERNAME/mariadb-fusion, where $USERNAME is your quay.io username.

### Create Containerfile: 'Containerfile.mydb.extra'
  - Use image docker.io/library/postgres:latest
  - Copy init-mariadb.sql file to /docker-entrypoint-initdb.d/ container directory
  - Three environment variables.
    a. POSTGRES_DB, value: fusion
    b. POSTGRES_USER, value: admin
    c. POSTGRES_PASSWORD, value: admin
  - Expose to port 5432
  - Start container with the following executable: postgres -D /var/lib/postgresql/data -c config_file=/usr/share/postgresql/postgresql.conf.sample
- Name the container image as 'postgresql-fusion'
- Tag the postgresql-fusion image as quay.io/$USERNAME/postgresql-fusion:1.0.0, where $USERNAME is your quay.io username.
- Push the tagged container image to Red Hat’s quay.io repository

## Task 5: Multi container application in a Network
- Create network my-app
- Create volume my-db-vol
- Create volume my-app-vol
- Run container 1
  - Name 'wordpress-db'
  - Attach network my-app
  - Attach volume my-db-vol to /var/lib/mysql
  - Set following environment variables
    - MYSQL_ROOT_PASSWORD=mypass
    - MYSQL_PASSWORD=mypass
    - MYSQL_DATABASE=wordpress_db
    - MYSQL_USER=dbuser
  - Use image docker.io/mariadb:latest
- Run container 2
  - Name 'wordpress-app'
  - Attach network my-app
  - Attach volume my-app-vol to /var/www/html
  - Bind local port 8005 to container port 80
  - Set following environment variables
    - WORDPRESS_DB_HOST=wordpress-db:3306
    - WORDPRESS_DB_NAME=wordpress_db
    - WORDPRESS_DB_USER=dbuser
    - WORDPRESS_DB_PASSWORD=mypass
  - Use image docker.io/wordpress:latest 

## Task 6: Troubleshooting
- Create network my-app-tr
- Create volume my-db-vol-tr
- Create volume my-app-vol-tr
- Run container 1
  - Name 'wordpress-db-tr'
  - Attach network my-app-tr
  - Attach volume my-db-vol-tr to /var/lib/mysql
  - Set following environment variables
    - MYSQL_ROOT_PASSWORD=mypass
    - MYSQL_PASSWORD=mypass
    - MYSQL_DATABASE=wordpress_db
    - MYSQL_USER=dbuser
  - Use image docker.io/mariadb:latest
- Run container 2
  - Name 'wordpress-app-tr'
  - Attach network my-app-tr
  - Attach volume my-app-vol-tr to /var/www/html
  - Bind local port 8005 to container port 8080
  - Set following environment variables
    - WORDPRESS_DB_HOST=wordpress-db:3306
    - WORDPRESS_DB_NAME=wordpress_db
    - WORDPRESS_DB_USER=dbuser
    - WORDPRESS_DB_PASSWORD=mypassword
  - Use image docker.io/wordpress:latest 