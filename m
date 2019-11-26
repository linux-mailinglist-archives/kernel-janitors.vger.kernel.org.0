Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50967109E78
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Nov 2019 14:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfKZNFO (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 Nov 2019 08:05:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22162 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725900AbfKZNFO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Nov 2019 08:05:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574773512;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CAoj3U8u1ICYYw3zgKAMm7nFMw4A2TkS8TUKZgXIPFw=;
        b=ikwUHIYOcYCnwYa9B1EUB7VZeSIFvHdjeQ47+2/8IAI9Olfb9BTELe5CtVGrSEdtI8WHKX
        kufe7N/TYSEtQTjiPeEA6dRkasMaJ7Gga/bgTlxe2+qe+MY04w3bCeYgTkYiA244qgy38U
        wPY4+FGS42dYCkHGEyS4AnAOWo3yL5o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-C0qpJCrjNxuueQTcvEXzvA-1; Tue, 26 Nov 2019 08:05:09 -0500
Received: by mail-wm1-f72.google.com with SMTP id l23so1158832wmh.6
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Nov 2019 05:05:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iJDuvGmZx4QKSO+PfNRjdDJu1Ca6hRaMF5cZd4vQDfE=;
        b=te/gogOIX7anevi5H21bHwmDAcaoO4tCXzeEyzt3dhrzPjRX0+1eI2bP7rrw3rYw8K
         IuzUWCG/R76Aqoll6FTwPvRmI/e+Z3h3gOlDZNi8w4glWoiWqR6MQZDFPb4UVVK3kA/+
         WwBukBFKv/ia5pfVWv6RhBM+vNNbhEZhOABjjh/fou8JZnK3J2nuMabktJ8tY66vOuAU
         MHHYEzjtkarFoUuTmjUA8mTb6BHhZUTLwVB6oBHaCZGVxNnnsWAaDDSGcYxXfKWBIo8p
         H0lBfpJdxV88diyemTOtRfA1Yd0nwUWPZGAbYLf1pSHKqoPtogs/yZHGVrl6WX1/eHXw
         vBPg==
X-Gm-Message-State: APjAAAUTbb/6TJgyigzCgVL36Gl4faszpuSx22JBM/tXI/pYY1PGfs49
        seNLiL76lwV/kgWAcvVPWuNufPddDMzh+YlQjbupkLyAinmAZG7nWq0sHB3gqLp5zNdRUzyUhB1
        hbDuX5iZ4SVA3qsPjWtsZ72ANgkt5
X-Received: by 2002:a05:600c:210b:: with SMTP id u11mr4265140wml.170.1574773507534;
        Tue, 26 Nov 2019 05:05:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqwGEjV2dMs9aChAeepe6vPM2aw0gSEnUJ5odW2L+HCAzJqiB74qlZZnS7p9XlkvsQmsNXbFnA==
X-Received: by 2002:a05:600c:210b:: with SMTP id u11mr4265104wml.170.1574773507250;
        Tue, 26 Nov 2019 05:05:07 -0800 (PST)
Received: from steredhat (host28-88-dynamic.16-87-r.retail.telecomitalia.it. [87.16.88.28])
        by smtp.gmail.com with ESMTPSA id q15sm13402002wrv.61.2019.11.26.05.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 05:05:06 -0800 (PST)
Date:   Tue, 26 Nov 2019 14:05:04 +0100
From:   Stefano Garzarella <sgarzare@redhat.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] vsock: add multi-transports support
Message-ID: <20191126130504.wpzu5mrmgwzamghh@steredhat>
References: <20191126122219.v6h2ndawt7hkpz6y@kili.mountain>
MIME-Version: 1.0
In-Reply-To: <20191126122219.v6h2ndawt7hkpz6y@kili.mountain>
X-MC-Unique: C0qpJCrjNxuueQTcvEXzvA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On Tue, Nov 26, 2019 at 03:22:19PM +0300, Dan Carpenter wrote:
> Hello Stefano Garzarella,
>=20
> This is a semi-automatic email about new static checker warnings.
>=20
> The patch c0cfa2d8a788: "vsock: add multi-transports support" from=20
> Nov 14, 2019, leads to the following Smatch complaint:
>=20
>     net/vmw_vsock/af_vsock.c:1014 vsock_poll()
>      error: we previously assumed 'transport' could be null (see line 987=
)
>=20
> net/vmw_vsock/af_vsock.c
>    986=09=09=09/* If there is something in the queue then we can read. */
>    987=09=09=09if (transport && transport->stream_is_active(vsk) &&
>                             ^^^^^^^^^
> The patch adds a check for transport.
>=20
>    988=09=09=09    !(sk->sk_shutdown & RCV_SHUTDOWN)) {
>    989=09=09=09=09bool data_ready_now =3D false;
>    990=09=09=09=09int ret =3D transport->notify_poll_in(
>    991=09=09=09=09=09=09vsk, 1, &data_ready_now);
>    992=09=09=09=09if (ret < 0) {
>    993=09=09=09=09=09mask |=3D EPOLLERR;
>    994=09=09=09=09} else {
>    995=09=09=09=09=09if (data_ready_now)
>    996=09=09=09=09=09=09mask |=3D EPOLLIN | EPOLLRDNORM;
>    997=09
>    998=09=09=09=09}
>    999=09=09=09}
>   1000=09
>   1001=09=09=09/* Sockets whose connections have been closed, reset, or
>   1002=09=09=09 * terminated should also be considered read, and we check=
 the
>   1003=09=09=09 * shutdown flag for that.
>   1004=09=09=09 */
>   1005=09=09=09if (sk->sk_shutdown & RCV_SHUTDOWN ||
>   1006=09=09=09    vsk->peer_shutdown & SEND_SHUTDOWN) {
>   1007=09=09=09=09mask |=3D EPOLLIN | EPOLLRDNORM;
>   1008=09=09=09}
>   1009=09
>   1010=09=09=09/* Connected sockets that can produce data can be written.=
 */
>   1011=09=09=09if (sk->sk_state =3D=3D TCP_ESTABLISHED) {
>   1012=09=09=09=09if (!(sk->sk_shutdown & SEND_SHUTDOWN)) {
>   1013=09=09=09=09=09bool space_avail_now =3D false;
>   1014=09=09=09=09=09int ret =3D transport->notify_poll_out(
>                                                   ^^^^^^^^^^^^^^^^^^^^^^^=
^^^
> But it's not checked here.  I guess probably TCP_ESTABLISHED means that
> transport is non-NULL?  If so then just ignore the warning.

Exactly, TCP_ESTABLISHED is set (by the transport) only when a socket is
assigned to a transport, so transport cannot be null here.

Thanks for warning me,
Stefano

