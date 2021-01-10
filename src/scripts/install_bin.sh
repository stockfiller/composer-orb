#!/bin/sh

EXPECTED_CHECKSUM="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]; then
    echo >&2 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi

if [ -z "${PARAM_FILENAME}" ]; then
    FILENAME=""
else
    FILENAME="--filename=${PARAM_FILENAME}"
fi

if [ -z "${PARAM_INSTALL_DIR}" ]; then
    INSTALL_DIR=""
else
    INSTALL_DIR="--install-dir=${PARAM_INSTALL_DIR}"
fi

if [ -z "${PARAM_VERSION}" ]; then
    VERSION=""
else
    VERSION="--version=${PARAM_VERSION}"
fi

php composer-setup.php --quiet "${FILENAME}" "${INSTALL_DIR}" "${VERSION}"
RESULT=$?
rm composer-setup.php
exit $RESULT
