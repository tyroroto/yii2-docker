# yii2-docker
Yii2 Docker with most used extesion
** Base ON php:7.2-apache **

```
Check conclusion:
-----------------

PHP version: OK

Reflection extension: OK

PCRE extension: OK

SPL extension: OK

Ctype extension: OK

MBString extension: OK

OpenSSL extension: OK

Intl extension: OK

ICU version: OK

ICU Data version: OK

Fileinfo extension: OK

DOM extension: OK

IPv6 support: WARNING!!!
Required by: IPv6 expansion in IpValidator
Memo: When IpValidator::expandIPv6
        property is set to true, PHP must support IPv6 protocol stack. Currently PHP constant AF_INET6 is not defined
        and IPv6 is probably unsupported.

PDO extension: OK

PDO SQLite extension: OK

PDO MySQL extension: OK

PDO PostgreSQL extension: WARNING!!!
Required by: All DB-related classes
Memo: Required for PostgreSQL database.

Memcache extension: WARNING!!!
Required by: MemCache

APC extension: WARNING!!!
Required by: ApcCache

GD PHP extension with FreeType support: OK

ImageMagick PHP extension with PNG support: OK

Expose PHP: OK

PHP allow url include: OK

PHP mail SMTP: OK

------------------------------------------
Errors: 0   Warnings: 4   Total checks: 24


```

## Run
```
docker pull tyroroto/yii2-extensions
docker run -d -p #port:80 -v #your_root_project:/var/www/html -v #apache_config_folder:/etc/apache2/sites-enabled --restart always --name #assign_container_name #tag_of_your_build
```
#apache_config_folder should container 000-default.conf for apache.
