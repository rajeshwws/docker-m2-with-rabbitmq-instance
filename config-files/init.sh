#!/bin/bash

echo "Magento2.3.5-p1 please wait installation is starting...."

if [ "$MAGENTO_BASE_URL" = "" ]
then
    echo "MAGENTO_BASE_URL is missing!"
    echo "Please set it using this command:"
    echo "export MAGENTO_BASE_URL=http://magento2.local"
    echo "Then re-try it please!"
    exit
fi

file="/data/project/.installed"

if [ -f "$file" ]
then
    php /data/project/magento2/bin/magento setup:store-config:set --base-url="${MAGENTO_BASE_URL}"
    php /data/project/magento2/bin/magento cache:flush
else
    composer create-project --repository-url=https://${MAGENTO_PRIVATE_KEY}:${MAGENTO_PUBLIC_KEY}@repo.magento.com/ magento/project-community-edition=2.3.5-p1 /data/project/magento2
    if php /data/project/magento2/bin/magento setup:install --base-url="${MAGENTO_BASE_URL}" --db-host="magento2_mysql" --db-name="magento2" --db-user="root" --admin-firstname="Rajesh" --admin-lastname="Kumar" --admin-email="rajeshkrajput6@gmail.com" --admin-user="admin" --admin-password="admin123" --language="en_US" --currency="USD" --timezone="Asia/Dubai" --use-rewrites="1" --backend-frontname="admin" ; then
        echo "" > /data/project/.installed
        echo "Magento 2 Community Edition successfully installed."
        cd /data/project/magento2
        composer install
        php /data/project/magento2/bin/magento setup:upgrade
        php /data/project/magento2/bin/magento setup:static-content:deploy -f
        php /data/project/magento2/bin/magento cache:clean
	chown -R :www-data /data/project/magento2
	chmod -R 777 /data/project/magento2/var
    chmod -R 777 /data/project/magento2/generated
	chmod -R 777 /data/project/magento2/pub
   fi
fi

echo "Magento admin url: $MAGENTO_BASE_URL/admin"
echo "Magento admin username: admin"
echo "Magento admin password: admin123"

/usr/sbin/php-fpm7.3 -R &
/usr/sbin/nginx -g "daemon off;"
