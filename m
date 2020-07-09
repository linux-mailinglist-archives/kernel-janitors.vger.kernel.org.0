Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24FB8219EF2
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 Jul 2020 13:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgGILQq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 9 Jul 2020 07:16:46 -0400
Received: from smtp98.ord1c.emailsrvr.com ([108.166.43.98]:37891 "EHLO
        smtp98.ord1c.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726387AbgGILQq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 Jul 2020 07:16:46 -0400
X-Greylist: delayed 488 seconds by postgrey-1.27 at vger.kernel.org; Thu, 09 Jul 2020 07:16:45 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
        s=20190130-41we5z8j; t=1594292916;
        bh=gPk9fNfbTbvXRdPvMQ3LYB0FbDFKX2auw6+IMKCgJ+s=;
        h=Subject:To:From:Date:From;
        b=C7BHwhOC63KnbglIxb9OhMyeBIS95kkHBmY5o6aFVWvKpU01cyWkB0V3ttdKCACUF
         ZyRSUfMwbFDc1a7lNw8NhB7fWwkxipjEuONfT8gcpVCjScyXVWUrWj+X3DoIsjOKcD
         sEyqwG9Uzl1aQWyhpZO8uKVnodypOb16QEKbu8Tc=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp5.relay.ord1c.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id DB7A6401DC;
        Thu,  9 Jul 2020 07:08:35 -0400 (EDT)
Subject: Re: [PATCH] staging: comedi: verify array index is correct before
 using it
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        H Hartley Sweeten <hsweeten@visionengravers.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org
References: <20200709102936.GA20875@mwanda>
From:   Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
Message-ID: <23bd2a41-4e65-ae4e-8133-c8ddeebfc6c5@mev.co.uk>
Date:   Thu, 9 Jul 2020 12:08:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200709102936.GA20875@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Classification-ID: d1eacce0-20ef-4e4f-b776-e9b236f30707-1-1
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 09/07/2020 11:29, Dan Carpenter wrote:
> This code reads from the array before verifying that "trig" is a valid
> index.  If the index is wildly out of bounds then reading from an
> invalid address could lead to an Oops.
> 
> Fixes: a8c66b684efa ("staging: comedi: addi_apci_1500: rewrite the subdevice support functions")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/staging/comedi/drivers/addi_apci_1500.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/comedi/drivers/addi_apci_1500.c b/drivers/staging/comedi/drivers/addi_apci_1500.c
> index 45ad4ba92f94..689acd69a1b9 100644
> --- a/drivers/staging/comedi/drivers/addi_apci_1500.c
> +++ b/drivers/staging/comedi/drivers/addi_apci_1500.c
> @@ -456,9 +456,9 @@ static int apci1500_di_cfg_trig(struct comedi_device *dev,
>   	unsigned int lo_mask = data[5] << shift;
>   	unsigned int chan_mask = hi_mask | lo_mask;
>   	unsigned int old_mask = (1 << shift) - 1;
> -	unsigned int pm = devpriv->pm[trig] & old_mask;
> -	unsigned int pt = devpriv->pt[trig] & old_mask;
> -	unsigned int pp = devpriv->pp[trig] & old_mask;
> +	unsigned int pm;
> +	unsigned int pt;
> +	unsigned int pp;
>   
>   	if (trig > 1) {
>   		dev_dbg(dev->class_dev,
> @@ -471,6 +471,10 @@ static int apci1500_di_cfg_trig(struct comedi_device *dev,
>   		return -EINVAL;
>   	}
>   
> +	pm = devpriv->pm[trig] & old_mask;
> +	pt = devpriv->pt[trig] & old_mask;
> +	pp = devpriv->pp[trig] & old_mask;
> +
>   	switch (data[2]) {
>   	case COMEDI_DIGITAL_TRIG_DISABLE:
>   		/* clear trigger configuration */
> 

Nice catch!

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || Web: www.mev.co.uk )=-
-=( MEV Ltd. is a company registered in England & Wales. )=-
-=( Registered number: 02862268.  Registered address:    )=-
-=( 15 West Park Road, Bramhall, STOCKPORT, SK7 3JZ, UK. )=-
