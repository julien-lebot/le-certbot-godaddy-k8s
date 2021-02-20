#!/bin/bash
# certbot-godaddy-request.sh -- A script to request new Let's Encrypt wildcard certificates
#
# Copyright (C) 2019 Martijn Veldpaus
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.

SCRIPTDIR=$(dirname $(readlink -f $0))

certbot certonly \
        --non-interactive \
        --agree-tos \
        -m "$EMAIL" \
        --preferred-challenges dns \
        --manual \
        --manual-auth-hook $SCRIPTDIR/certbot-godaddy-auth.sh \
        --manual-cleanup-hook $SCRIPTDIR/certbot-godaddy-cleanup.sh \
        --post-hook $SCRIPTDIR/certbot-renew-post-hook.sh \
        -d *.${DOMAIN} \
        -d ${DOMAIN}
