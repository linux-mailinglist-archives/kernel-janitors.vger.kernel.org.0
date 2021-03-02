Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4178432B521
	for <lists+kernel-janitors@lfdr.de>; Wed,  3 Mar 2021 07:13:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354872AbhCCGHX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 3 Mar 2021 01:07:23 -0500
Received: from einhorn-mail-out.in-berlin.de ([217.197.80.21]:37565 "EHLO
        einhorn-mail-out.in-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1377944AbhCBVdN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 2 Mar 2021 16:33:13 -0500
X-Greylist: delayed 691 seconds by postgrey-1.27 at vger.kernel.org; Tue, 02 Mar 2021 16:33:12 EST
X-Envelope-From: stefanr@s5r6.in-berlin.de
Received: from authenticated.user (localhost [127.0.0.1]) by einhorn.in-berlin.de  with ESMTPSA id 122LJC2r005582
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Tue, 2 Mar 2021 22:19:27 +0100
Date:   Tue, 2 Mar 2021 22:19:11 +0100
From:   Stefan Richter <stefanr@s5r6.in-berlin.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux1394-devel@lists.sourceforge.net,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] firewire: prevent integer overflow on 32bit systems
Message-ID: <20210302221911.6c1582e2@kant>
In-Reply-To: <YD4e9XOD8JPlJzxW@mwanda>
References: <YD4e9XOD8JPlJzxW@mwanda>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mar 02 Dan Carpenter wrote:
> In TCODE_STREAM_DATA mode, on 32bit systems, the "sizeof(*e) +
> request->length" operation can overflow leading to memory corruption.
> 
> Fixes: 18e9b10fcdc0 ("firewire: cdev: add closure to async stream ioctl")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/firewire/core-cdev.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
> index fb6c651214f3..314de0384035 100644
> --- a/drivers/firewire/core-cdev.c
> +++ b/drivers/firewire/core-cdev.c
> @@ -587,6 +587,9 @@ static int init_request(struct client *client,
>  	    request->length < 4)
>  		return -EINVAL;
>  
> +	if (request->length > ULONG_MAX - sizeof(*e))
> +		return -EINVAL;
> +
>  	e = kmalloc(sizeof(*e) + request->length, GFP_KERNEL);
>  	if (e == NULL)
>  		return -ENOMEM;

There is already a length check for asynchronous stream requests.
It happens in ioctl_send_stream_packet().
-- 
Stefan Richter
-======--=-= --== ---=-
http://arcgraph.de/sr/
