# EX188
## Task 1: Creating simple container.
- Create a container,
  - Use image httpd:latest
  - Run in detached mode
  - Container name 'task1'
  - Bind container port 80 to local port 8080
  - Container should take '$HOME/fusion-ex188/task1/index.html' from local file. If we update local index.html file content then it should reflect in container. (hint: httpd default html location - /usr/local/apache2/htdocs)

