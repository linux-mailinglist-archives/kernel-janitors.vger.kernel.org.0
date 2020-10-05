Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 441F9283435
	for <lists+kernel-janitors@lfdr.de>; Mon,  5 Oct 2020 12:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbgJEKuq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 5 Oct 2020 06:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgJEKuq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 5 Oct 2020 06:50:46 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80BD9C0613A7
        for <kernel-janitors@vger.kernel.org>; Mon,  5 Oct 2020 03:50:45 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id t10so9010613wrv.1
        for <kernel-janitors@vger.kernel.org>; Mon, 05 Oct 2020 03:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M2zjVVLnmwFQgT7Kn7CpiF/4Y0RRRZlogY57D59OL1Q=;
        b=azTf+aCmxMcqsH4Q4OfDxJ0dGV/q88u03C/J+CGqrLXxLnSr1TDFyK7CNHb19lKJBQ
         zdh/JJy7p5benO94gyyJT53xEev17bUpps4y4pLsUM0aIMQXsK6FQJLPFv5W7TzYRvHu
         OFW8pRS5yIuyHvkfEY3Pnzy+Fq6iHIGUuZxZRj8D+eKJ9PaDqkhlZxc2oyoEmf/ZvXKY
         E5lvDFa1vXAlioPuUeqqcLraDukoJYrnCW5ogg44vvIoeY+0vd2hcLBRtxdhkc7ikxky
         AQA5dBAT7nSQxMVmoVhbGiBeVkjV6s3Xstr3TfpbY5u8dAAP736uCK/nE+PX+wRAYmqA
         mqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M2zjVVLnmwFQgT7Kn7CpiF/4Y0RRRZlogY57D59OL1Q=;
        b=HwmoN0ArCtSxMmnAS/oOO8gSWMHV2qqKauJxS4eepXvCvvHKY+A0roWFYuABPkpSAp
         ueZi2S81q4y/vcaJN7TeuLSsQgAwCCOX/I3OelRkLkXHvwVzUKBpKYOBy9kLEqc45Wde
         x5gyus+XesBYpIQrBhK9O+ymOQSWNhJYSdeSSN4MdU+jtdjBb8e+ZWkbcw8Fj0Gc4FN0
         FZiMo25/2/jsoNbyN6PI4HzKB4qmuRq8Avo5SJnFSbqSXWHsD5hWdhvwY331xsi2cdbG
         cmCK3BC095WIdFP485g3YTTJ5VhBW5XOy+PD5Nb4i9IH1S63bSSlZ5XqMc30RHDNdsxs
         08ig==
X-Gm-Message-State: AOAM533As7S/DUMHLmAwXlLRLq0SVza4IemdRyLCbm4vERPjQbWilPjY
        NLkGYLIGhgDmjeEOht51q/CHnQ==
X-Google-Smtp-Source: ABdhPJyEPRxZd10VmSgHtfqoF+IWeXOoAoyzPP9zyjZ+55dwWBSUiJ1xTTKQhGeCWZvHzXjTlfeNWg==
X-Received: by 2002:a5d:62d0:: with SMTP id o16mr2426402wrv.388.1601895044152;
        Mon, 05 Oct 2020 03:50:44 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id m13sm12871557wrr.74.2020.10.05.03.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 03:50:43 -0700 (PDT)
Date:   Mon, 5 Oct 2020 12:50:41 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        mjpeg-users@lists.sourceforge.net, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: zoran: fix spelling mistake and make error
 message more meaningful
Message-ID: <20201005105041.GB29306@Red>
References: <20201002101620.86156-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201002101620.86156-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 02, 2020 at 11:16:20AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a pci_err error message. Fix this and
> make the error message a little more meaningful.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/media/zoran/zoran_driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
> index 808196ea5b81..d9f8b21edf6a 100644
> --- a/drivers/staging/media/zoran/zoran_driver.c
> +++ b/drivers/staging/media/zoran/zoran_driver.c
> @@ -666,7 +666,7 @@ static int zoran_g_selection(struct file *file, void *__fh, struct v4l2_selectio
>  
>  	if (sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
>  	    sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> -		pci_err(zr->pci_dev, "%s invalid combinaison\n", __func__);
> +		pci_err(zr->pci_dev, "%s invalid selection type combination\n", __func__);
>  		return -EINVAL;
>  	}
>  
> -- 
> 2.27.0
> 

Hello

Acked-by: Corentin Labbe <clabbe@baylibre.com>

Thanks
