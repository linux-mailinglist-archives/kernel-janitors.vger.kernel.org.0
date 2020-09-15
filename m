Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34E7B26AC7F
	for <lists+kernel-janitors@lfdr.de>; Tue, 15 Sep 2020 20:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbgIOStM (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 15 Sep 2020 14:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727850AbgIOR1G (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Sep 2020 13:27:06 -0400
X-Greylist: delayed 516 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 15 Sep 2020 10:24:32 PDT
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E2F9C061356
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Sep 2020 10:24:31 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7F5D3C6366; Tue, 15 Sep 2020 18:12:56 +0100 (BST)
Date:   Tue, 15 Sep 2020 18:12:56 +0100
From:   Sean Young <sean@mess.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxim Levitsky <maximlevitsky@gmail.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rc: fix check on dev->min_timeout for
 LIRC_GET_MIN_TIMEOUT ioctl
Message-ID: <20200915171256.GA681@gofer.mess.org>
References: <20200915153608.35154-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915153608.35154-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Sep 15, 2020 at 04:36:08PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the LIRC_GET_MIN_TIMEOUT is checking for a null dev->max_timeout
> and then accessing dev->min_timeout, hence we may have a potential null
> pointer dereference issue.  This looks like a cut-n-paste typo, fix it
> by checking on dev->min_timeout before accessing it.

max_timeout and min_timeout are both u32, not pointers. So, the commit 
message is wrong: there is no null pointer dereference issue.

Every driver which has max_timeout also has min_timeout set (I've checked
for this). So technically this is not wrong, but maybe it looks wrong?

Thanks,

Sean
> 
> Addresses-Coverity: ("Copy-paste error")
> Fixes: e589333f346b ("V4L/DVB: IR: extend interfaces to support more device settings")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/rc/lirc_dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
> index 220363b9a868..d230c21e1d31 100644
> --- a/drivers/media/rc/lirc_dev.c
> +++ b/drivers/media/rc/lirc_dev.c
> @@ -533,7 +533,7 @@ static long lirc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  
>  	/* Generic timeout support */
>  	case LIRC_GET_MIN_TIMEOUT:
> -		if (!dev->max_timeout)
> +		if (!dev->min_timeout)
>  			ret = -ENOTTY;
>  		else
>  			val = dev->min_timeout;
> -- 
> 2.27.0
