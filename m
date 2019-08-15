Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF7508E916
	for <lists+kernel-janitors@lfdr.de>; Thu, 15 Aug 2019 12:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731053AbfHOKf5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 15 Aug 2019 06:35:57 -0400
Received: from mx01-fr.bfs.de ([193.174.231.67]:57739 "EHLO mx01-fr.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731000AbfHOKf5 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Aug 2019 06:35:57 -0400
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
        by mx01-fr.bfs.de (Postfix) with ESMTPS id C1A2D201EB;
        Thu, 15 Aug 2019 12:35:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1565865351; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E3pPh83n6WDN4w57pjyLOZjqUHHOxaQOSrbjRAU5Bkc=;
        b=bOQdf41keIf4V5DkNQYBFyHtan1ucaP0R3FTwJ/McLrMFPbprCD4+Dngqdl7M4Htv53TFw
        mKxuR3rJrf8Uvh5/K0HAJCRUJEXCfOYWTs795kKCbfPjrgDxzFRZc4p+f4K9xhwvazF81N
        fuJL0gaUOVoaawdpiYo6RI6mu4lTmB5x9O6itEfoeQ67nrDAnlx3CAMmfwb9xJhiz+aK+S
        juLXnRScAQU+DlJecwH5CPf7BxQCY4RpZ3fhocHC1G9W2rJBcvxS7L0b72MNJUdKymdkv8
        TnpYXWSlTXU2JaJtXSsOrtjgf7mNgFZcvmgK36xxOwhWpU3Vgd+2DzjuXqlgpQ==
Received: from [134.92.181.33] (unknown [134.92.181.33])
        by mail-fr.bfs.de (Postfix) with ESMTPS id C7B1DBEEBD;
        Thu, 15 Aug 2019 12:35:49 +0200 (CEST)
Message-ID: <5D553585.2020907@bfs.de>
Date:   Thu, 15 Aug 2019 12:35:49 +0200
From:   walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To:     kernel-janitors@vger.kernel.org
CC:     Dan Carpenter <dan.carpenter@oracle.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Cyrille Pitchen <cyrille.pitchen@microchip.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Fix an error code in spi_nor_read_raw()
References: <20190815083252.GD27238@mwanda>
In-Reply-To: <20190815083252.GD27238@mwanda>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.10
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.10 / 7.00];
         HAS_REPLYTO(0.00)[wharms@bfs.de];
         TO_DN_SOME(0.00)[];
         REPLYTO_ADDR_EQ_FROM(0.00)[];
         RCPT_COUNT_SEVEN(0.00)[11];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         MID_RHS_MATCH_FROM(0.00)[];
         BAYES_HAM(-3.00)[100.00%];
         ARC_NA(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TAGGED_RCPT(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         DKIM_SIGNED(0.00)[];
         NEURAL_HAM(-0.00)[-0.999,0];
         RCVD_COUNT_TWO(0.00)[2];
         RCVD_TLS_ALL(0.00)[]
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



Am 15.08.2019 10:32, schrieb Dan Carpenter:
> The problem is that if "ret" is negative then when we check if
> "ret > len", that condition is going to be true because of type
> promotion.  So this patch re-orders the code to check for negatives
> first and preserve those error codes.
> 
> Fixes: f384b352cbf0 ("mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 63af87609bac..986b0754495d 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2903,10 +2903,10 @@ static int spi_nor_read_raw(struct spi_nor *nor, u32 addr, size_t len, u8 *buf)
>  
>  	while (len) {
>  		ret = spi_nor_read_data(nor, addr, len, buf);
> -		if (!ret || ret > len)
> -			return -EIO;
>  		if (ret < 0)
>  			return ret;
> +		if (!ret || ret > len)
> +			return -EIO;

Bonuspoints to make this more readable:

	if (ret==0 || ret > len)
		return -EIO;

that makes the intention more obvious.

JM2C,
 wh

>  
>  		buf += ret;
>  		addr += ret;
