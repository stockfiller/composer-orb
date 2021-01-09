#!/bin/sh

EXPECTED_CHECKSUM="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi

if [ -z "${PARAM_VERSION}" ]; then
    VERSION=""
else
    VERSION="--version ${PARAM_VERSION}"
fi

php composer-setup.php --quiet --filename="${PARAM_FILENAME}" --install-dir="${PARAM_INSTALL_DIR}" "${VERSION}"
RESULT=$?
rm composer-setup.php
exit $RESULT
