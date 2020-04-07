Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9917A1A0E77
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Apr 2020 15:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728931AbgDGNgM (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Apr 2020 09:36:12 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38981 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728826AbgDGNgM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Apr 2020 09:36:12 -0400
Received: by mail-oi1-f195.google.com with SMTP id d63so1487140oig.6
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Apr 2020 06:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ClJDfDshHqm3MPtsNHmyOS+UtbN5Rqwu+2iZ2hmJ8yk=;
        b=UmDATtsuZ9SMhlDT/Q4m+RFE0Biuk8WvIoFf35BNr/RouG6e28nWAzsTPNlSQZFlIX
         zbMcd9Fe+4QkJx0sY866zBGGyGGTOnVzpyEd6Gz8QYePrMQS408Y8+Vk9bbWJ5E4je/X
         ok7avbg/Eq+cC5k0QVqF6sOtoBob3/dZOtGS+vUG9jqs9Oejz7rcu8z7yEUwhe3osOfU
         mcD8bdoxS3Ks95yaOUzCd/Ba9+Awz6u0zCyiDzB6VOg6ZAKrJXeFoHqVFReQ0hfZRKBi
         czon2Gj4A3GD+L8ufLkYMPszx0KWeFXoDR73d/QrwnTMZGBn/6x7EccxDF9d2QgnDnBw
         WKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to
         :user-agent;
        bh=ClJDfDshHqm3MPtsNHmyOS+UtbN5Rqwu+2iZ2hmJ8yk=;
        b=tevrG0RyRshyuC+C892rStigq5e+hdxqaU80Ur8qzInzSWhr3+c8zFeuPrk4yOwkGE
         XVj3wycrPGF5tdCZzKY8f+Ph94cZ2zquE7IGG36CMgvSvECjPWpOJLqagzi/TMlMXoX5
         2joJzBxoIb42JLkVCpgVDHGRRQ0gcmexfUJzW8Xun5wM6n6L9pG7l188o7wjTS6js3rf
         ds8P+v/ds9YEhmlQbeamBL9gRksiTEKoHkpl2RUHoaq5NRlAbPUghYzSPXsmqIn+J5ly
         PRPdp3hmW39Eahi/b1bnY5HNoVRkRFNW/+Fiftd21bdU879zsRGNEaD3ZgxQhhTFuJPc
         XDuw==
X-Gm-Message-State: AGi0Pub05OmwFyTo4EfTkTWxUWLJo2maVPqlBjKQ9FuX32EYZQb9dis0
        hGxIp9GPfaZHwws4diB2Tg==
X-Google-Smtp-Source: APiQypKN+V/kz+KJ9Qb1ZTSEPTawPqR52LDU41+Bdwlc4cfOfdJfnKMuaHj8E3XxCRC5UzvX7C6cGQ==
X-Received: by 2002:aca:b803:: with SMTP id i3mr1676178oif.92.1586266571593;
        Tue, 07 Apr 2020 06:36:11 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id f45sm5335104otf.30.2020.04.07.06.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 06:36:10 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:8b39:c3f3:f502:5c4e])
        by serve.minyard.net (Postfix) with ESMTPSA id 69562180053;
        Tue,  7 Apr 2020 13:36:09 +0000 (UTC)
Date:   Tue, 7 Apr 2020 08:36:08 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        openipmi-developer@lists.sourceforge.net,
        linux-aspeed@lists.ozlabs.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ipmi: kcs: Fix aspeed_kcs_probe_of_v1()
Message-ID: <20200407133608.GB6130@minyard.net>
Reply-To: minyard@acm.org
References: <20200407122149.GA100026@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407122149.GA100026@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Apr 07, 2020 at 03:21:49PM +0300, Dan Carpenter wrote:
> This needs to return the newly allocated struct but instead it returns
> zero which leads to an immediate Oops in the caller.

Thanks, this is applied.

-corey

> 
> Fixes: 09f5f680707e ("ipmi: kcs: aspeed: Implement v2 bindings")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/char/ipmi/kcs_bmc_aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> index 9422d55a0476..a140203c079b 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -271,7 +271,7 @@ static struct kcs_bmc *aspeed_kcs_probe_of_v1(struct platform_device *pdev)
>  	kcs->ioreg = ast_kcs_bmc_ioregs[channel - 1];
>  	aspeed_kcs_set_address(kcs, slave);
>  
> -	return 0;
> +	return kcs;
>  }
>  
>  static int aspeed_kcs_calculate_channel(const struct kcs_ioreg *regs)
> -- 
> 2.25.1
> 
