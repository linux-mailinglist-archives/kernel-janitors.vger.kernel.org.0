Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59EE93684B2
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Apr 2021 18:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236504AbhDVQWV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 22 Apr 2021 12:22:21 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151]:31570 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236058AbhDVQWT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Apr 2021 12:22:19 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-270-mhKvP-dDOsuLyQ0QyQj3_Q-1; Thu, 22 Apr 2021 17:21:41 +0100
X-MC-Unique: mhKvP-dDOsuLyQ0QyQj3_Q-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 17:21:40 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Thu, 22 Apr 2021 17:21:40 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Dan Carpenter' <dan.carpenter@oracle.com>,
        Joel Stanley <joel@jms.id.au>
CC:     Andrew Jeffery <andrew@aj.id.au>,
        "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
        "John Wang" <wangzhiqiang.bj@bytedance.com>,
        Brad Bishop <bradleyb@fuzziesquirrel.com>,
        Patrick Venture <venture@google.com>,
        "Benjamin Fair" <benjaminfair@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Robert Lippert <rlippert@google.com>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] soc: aspeed: fix a ternary sign expansion bug
Thread-Topic: [PATCH] soc: aspeed: fix a ternary sign expansion bug
Thread-Index: AQHXN1ec+IlNNgnl7EGootyN/jCOrarAtu4w
Date:   Thu, 22 Apr 2021 16:21:40 +0000
Message-ID: <59596244622c4a15ac8cc0747332d0be@AcuMS.aculab.com>
References: <YIE90PSXsMTa2Y8n@mwanda>
In-Reply-To: <YIE90PSXsMTa2Y8n@mwanda>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Dan Carpenter
> Sent: 22 April 2021 10:12
> 
> The intent here was to return negative error codes but it actually
> returns positive values.  The problem is that type promotion with
> ternary operations is quite complicated.
> 
> "ret" is an int.  "copied" is a u32.  And the snoop_file_read() function
> returns long.  What happens is that "ret" is cast to u32 and becomes
> positive then it's cast to long and it's still positive.
> 
> Fix this by removing the ternary so that "ret" is type promoted directly
> to long.
> 
> Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index 210455efb321..eceeaf8dfbeb 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -94,8 +94,10 @@ static ssize_t snoop_file_read(struct file *file, char __user *buffer,
>  			return -EINTR;
>  	}
>  	ret = kfifo_to_user(&chan->fifo, buffer, count, &copied);
> +	if (ret)
> +		return ret;
> 
> -	return ret ? ret : copied;
> +	return copied;

I wonder if changing it to:
	return ret ? ret + 0L : copied;

Might make people think in the future and not convert it back
as an 'optimisation'.

I much prefer adding 0 to a cast to fix integer types.
In can go less wrong!

IMHO there are far too many casts in the kernel sources.
Especially the ones that are only there to appease sparse.
A functional notation for those would remove some of
the potential problems.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

