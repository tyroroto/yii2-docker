# yii2-docker
yii2 docker 

## Getting Started

docker pull tyroroto/yii2-apache
docker run -d -p #port:80 -v #your_root_project:/var/www/app -v #log_map_folder:/var/log -v #apache_config_folder:/etc/apache2/sites-enabled --restart always --name #assign_container_name #tag_of_your_build

#apache_config_folder should container 000-default.conf for apache.
