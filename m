Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0442CB90D
	for <lists+kernel-janitors@lfdr.de>; Wed,  2 Dec 2020 10:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388085AbgLBJhh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 2 Dec 2020 04:37:37 -0500
Received: from mxout70.expurgate.net ([91.198.224.70]:8175 "EHLO
        mxout70.expurgate.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387860AbgLBJhh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Dec 2020 04:37:37 -0500
X-Greylist: delayed 502 seconds by postgrey-1.27 at vger.kernel.org; Wed, 02 Dec 2020 04:37:36 EST
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.92)
        (envelope-from <ms@dev.tdt.de>)
        id 1kkOPy-000URj-0z; Wed, 02 Dec 2020 10:27:22 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ms@dev.tdt.de>)
        id 1kkOPw-00095f-SN; Wed, 02 Dec 2020 10:27:20 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id 95E66240041;
        Wed,  2 Dec 2020 10:27:20 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id E3305240040;
        Wed,  2 Dec 2020 10:27:19 +0100 (CET)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
        by mail.dev.tdt.de (Postfix) with ESMTP id 7B5C1200C5;
        Wed,  2 Dec 2020 10:27:18 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date:   Wed, 02 Dec 2020 10:27:18 +0100
From:   Martin Schiller <ms@dev.tdt.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, linux-x25@vger.kernel.org,
        netdev@vger.kernel.org, Andrew Hendry <andrew.hendry@gmail.com>,
        =?UTF-8?Q?kiyin=28=E5=B0=B9=E4=BA=AE?= =?UTF-8?Q?=29?= 
        <kiyin@tencent.com>, security@kernel.org,
        linux-distros@vs.openwall.org,
        =?UTF-8?Q?huntchen=28=E9=99=88=E9=98=B3?= =?UTF-8?Q?=29?= 
        <huntchen@tencent.com>,
        =?UTF-8?Q?dannywang=28?= =?UTF-8?Q?=E7=8E=8B=E5=AE=87=29?= 
        <dannywang@tencent.com>, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net v2] net/x25: prevent a couple of overflows
Organization: TDT AG
In-Reply-To: <X8ZeAKm8FnFpN//B@mwanda>
References: <X8ZeAKm8FnFpN//B@mwanda>
Message-ID: <41de2a35016a1eb9a188a71d11709f16@dev.tdt.de>
X-Sender: ms@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.15
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dev.tdt.de
Content-Transfer-Encoding: 8BIT
X-purgate-type: clean
X-purgate: clean
X-purgate-ID: 151534::1606901241-00016B9D-D8500775/0/0
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2020-12-01 16:15, Dan Carpenter wrote:
> The .x25_addr[] address comes from the user and is not necessarily
> NUL terminated.  This leads to a couple problems.  The first problem is
> that the strlen() in x25_bind() can read beyond the end of the buffer.
> 
> The second problem is more subtle and could result in memory 
> corruption.
> The call tree is:
>   x25_connect()
>   --> x25_write_internal()
>       --> x25_addr_aton()
> 
> The .x25_addr[] buffers are copied to the "addresses" buffer from
> x25_write_internal() so it will lead to stack corruption.
> 
> Verify that the strings are NUL terminated and return -EINVAL if they
> are not.
> 
> Reported-by: "kiyin(尹亮)" <kiyin@tencent.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> The first patch put a NUL terminator on the end of the string and this
> patch returns an error instead.  I don't have a strong preference, 
> which
> patch to go with.
> 
>  net/x25/af_x25.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/net/x25/af_x25.c b/net/x25/af_x25.c
> index 9232cdb42ad9..d41fffb2507b 100644
> --- a/net/x25/af_x25.c
> +++ b/net/x25/af_x25.c
> @@ -675,7 +675,8 @@ static int x25_bind(struct socket *sock, struct
> sockaddr *uaddr, int addr_len)
>  	int len, i, rc = 0;
> 
>  	if (addr_len != sizeof(struct sockaddr_x25) ||
> -	    addr->sx25_family != AF_X25) {
> +	    addr->sx25_family != AF_X25 ||
> +	    strnlen(addr->sx25_addr.x25_addr, X25_ADDR_LEN) == X25_ADDR_LEN) 
> {
>  		rc = -EINVAL;
>  		goto out;
>  	}
> @@ -769,7 +770,8 @@ static int x25_connect(struct socket *sock, struct
> sockaddr *uaddr,
> 
>  	rc = -EINVAL;
>  	if (addr_len != sizeof(struct sockaddr_x25) ||
> -	    addr->sx25_family != AF_X25)
> +	    addr->sx25_family != AF_X25 ||
> +	    strnlen(addr->sx25_addr.x25_addr, X25_ADDR_LEN) == X25_ADDR_LEN)
>  		goto out;
> 
>  	rc = -ENETUNREACH;

Acked-by: Martin Schiller <ms@dev.tdt.de>
