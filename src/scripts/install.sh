#!/bin/ash

# MIT License
#
# Copyright (c) 2020 Stockfiller AB
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

if [ -n "${PARAM_WORKING_DIR}" ]; then
    set -- "$@" "--working-dir=${PARAM_WORKING_DIR}"
fi

if [ "${PARAM_PREFER_DIST}" -eq 1 ]; then
    set -- "$@" "--prefer-dist"
fi

if [ "${PARAM_NO_SCRIPTS}" -eq 1 ]; then
    set -- "$@" "--no-scripts"
fi

if [ "${PARAM_IGNORE_PLATFORM_REQS}" -eq 1 ]; then
    set -- "$@" "--ignore-platform-reqs"
fi

if [ "${PARAM_NO_DEV}" -eq 1 ]; then
    set -- "$@" "--no-dev"
fi

if [ "${PARAM_CLASSMAP_AUTHORITATIVE}" -eq 1 ]; then
    set -- "$@" "--classmap-authoritative"
fi

if [ "${PARAM_OPTIMIZE_AUTOLOADER}" -eq 1 ]; then
    set -- "$@" "--optimize-autoloader"
fi

if [ -z "${PARAM_CACHE_VERSION}" ]; then
    set -- "$@" "--no-cache"
fi

echo "Running command \"${PARAM_BIN} install\" with flags: " "$@"

"${PARAM_BIN}" install --no-interaction "$@"
