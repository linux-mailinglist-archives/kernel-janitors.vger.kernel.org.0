Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 212961043CB
	for <lists+kernel-janitors@lfdr.de>; Wed, 20 Nov 2019 19:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbfKTS7Y (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 20 Nov 2019 13:59:24 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43705 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726440AbfKTS7X (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 20 Nov 2019 13:59:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574276363;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C35wC9q1jgeXmU7JqR3NZOFZzSw/nsQvCT6e5UF4sJQ=;
        b=jPDatIoyM4fLCbiALwAJBgde1mhP1gatYxrzfLKRzyGVL+fCV9+TjGmnK7LCb+vp+fFPZB
        uAHdCRkygTeUJIJevapZ56RwLk7i1Cd0c99jkDWv8H4l6OiOZNTRqBYImYO0TWIaSNMM7f
        9J35GGMbWrx7XajeSdtdIaBEccgR5FE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-XlaBWJ4YNVWY3N18N4DdhQ-1; Wed, 20 Nov 2019 13:59:22 -0500
Received: by mail-qt1-f199.google.com with SMTP id x50so516552qth.4
        for <kernel-janitors@vger.kernel.org>; Wed, 20 Nov 2019 10:59:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=jjpGzChSbAE/VjBP60NsRZKdsVloFbVJytDXjEcLDt4=;
        b=nycDXIpQ/E2xgCRLs3Wh7EzgVLQgeAar9YXpODL31CSWjAmqOznvUsGm+tBILP6DGl
         2LqSOOHc5wUBxTYSlBdYFEvgdcG7TzLeLz5Ucpp17mI3DR+PjkJJHHpsSmQltt5OFjP/
         3Mt2Sztr3LbtwPoJ37tGYcQTYy5PeVYYYz2VFtwEuaSXnbwbQRIyEUVOaYTee3hoA4Le
         lTX5QHZlOLrOCSZ/q9/eWmXz2dFRjwd0V83Ta3y+XFLdEgEHRFMCP78RMYn4YVz3ujTX
         98R6UK+2eCDmcb+A4oHrmS56yRhHJ+lq4HbEb/j/Bhoe+6n2xA4wBO5yJLAZoxse/0wK
         1ODQ==
X-Gm-Message-State: APjAAAUv3YnHyFJG5FQkX62juZmGlcOEpTq91usCFj2WwfhQrQEC12FI
        daGVlKFX8NbSbh1g/PBCKk5R7cG6OEOx0h76AjIOeOUfF9Yx8GZQrWyvLFMNqLYg+gAhZtF7H0S
        eK2GtpirUiadWAUOh5FHlfGVgM8oU
X-Received: by 2002:ac8:7282:: with SMTP id v2mr4164000qto.75.1574276361737;
        Wed, 20 Nov 2019 10:59:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqxuGeUbqVAJvgnf+jTL+SyQquhjCPMRcnZFI4gqIIOO+GhNZaN7NJrRHGgM5rw14Qhz3gcGlg==
X-Received: by 2002:ac8:7282:: with SMTP id v2mr4163971qto.75.1574276361495;
        Wed, 20 Nov 2019 10:59:21 -0800 (PST)
Received: from dhcp-10-20-1-46.bss.redhat.com ([144.121.20.162])
        by smtp.gmail.com with ESMTPSA id x1sm41244qke.125.2019.11.20.10.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 10:59:20 -0800 (PST)
Message-ID: <f6c44c85a63c89e548cafa55d89caccd7e868268.camel@redhat.com>
Subject: Re: [PATCH][next] drm/dp_mst: fix multiple frees of tx->bytes
From:   Lyude Paul <lyude@redhat.com>
To:     Colin King <colin.king@canonical.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 20 Nov 2019 13:59:19 -0500
In-Reply-To: <20191120173509.347490-1-colin.king@canonical.com>
References: <20191120173509.347490-1-colin.king@canonical.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: XlaBWJ4YNVWY3N18N4DdhQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Heh, surprised I missed this one!

Reviewed-by: Lyude Paul <lyude@redhat.com>

Do you need me to push this to drm-misc, or do you have commit rights alrea=
dy?

On Wed, 2019-11-20 at 17:35 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently tx->bytes is being freed r->num_transactions number of
> times because tx is not being set correctly. Fix this by setting
> tx to &r->transactions[i] so that the correct objects are being
> freed on each loop iteration.
>=20
> Addresses-Coverity: ("Double free")
> Fixes: 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing +
> selftests")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index ae5809a1f19a..2754e7e075e7 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -517,8 +517,10 @@ drm_dp_decode_sideband_req(const struct
> drm_dp_sideband_msg_tx *raw,
>  =09=09=09}
> =20
>  =09=09=09if (failed) {
> -=09=09=09=09for (i =3D 0; i < r->num_transactions; i++)
> +=09=09=09=09for (i =3D 0; i < r->num_transactions; i++) {
> +=09=09=09=09=09tx =3D &r->transactions[i];
>  =09=09=09=09=09kfree(tx->bytes);
> +=09=09=09=09}
>  =09=09=09=09return -ENOMEM;
>  =09=09=09}
> =20
--=20
Cheers,
=09Lyude Paul

