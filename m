Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1D1427085F
	for <lists+kernel-janitors@lfdr.de>; Fri, 18 Sep 2020 23:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbgIRVfZ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 18 Sep 2020 17:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgIRVfY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Sep 2020 17:35:24 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B91C2C0613CE
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Sep 2020 14:35:23 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id u25so6738119otq.6
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Sep 2020 14:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G8fXqWszh3SrJ+vmT464jX1vRmpstqfB1t8xeqTC0Yo=;
        b=GdO/Ghgzwl/Mhx/Xegq0ztWcGn8p4oIE76uu4RFFmou2d26T2pwnGilkiqr2Uo+Ypp
         6Nk2rwgH4GQFCzbU1QeBkeG93BhilQ2RVbHWDeLT3lj5+ttqX5X0wGDFpFs4tceNBLxt
         xlItl9igEqFtSxauRLIsXCGvYcEBvnlIu8I/G4Kq6sVlgIT6lmy0iz35pdLhiGmgiB/f
         k8qfvOKNjz/4ZWdloLbAFVxuNCCD52WIXTfBCJFxawD35jgoSCszdSep+CavaMwv1iDy
         XW6YqpsCkZnTWzRxquZPevlqswxRRFK+Iv6wimN33U/hUCyoQojd1WpLpb/XS5mT5zTr
         3rZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to
         :user-agent;
        bh=G8fXqWszh3SrJ+vmT464jX1vRmpstqfB1t8xeqTC0Yo=;
        b=OIC78+S3SZZKbpfbA7NzZ74tohsNbTxlRMmlzV902zvg3Fj7X9pLzoH6SgVNlNlUjw
         /tgf64JUi31EdwBEeSva0TQN5nXG3qD3/PM5r4W/BvSmhyAkOLye0dKPSWGW1h4baOJr
         /uPJMeBOV4OKL14hdayJhrpmmOVsHDIogbbGoEOL0tD1qSXWXVOAbyvnrb/SjgCOeQpm
         3FlNr3CPjcuQWke6B3KiiJmqj9Hw8MGe9CESsVRnt87BtpJ3buFf3+Es9V12i8gd+YGr
         p6E8LMip1lBEVYGSMhtiTKgnCkeDcqsid9BKkGmxDOYOI5Bh4fAQGa8NoM4cq+Ff679+
         fm6A==
X-Gm-Message-State: AOAM533gmvTiK4Swgksf01SbA7r+0cYMCZD+JKmP+tXCRH5uEXEEqJLW
        C6l5vGMhbjq/URmqU+zFhQ==
X-Google-Smtp-Source: ABdhPJzzQ3LbdTJlkgrLikXmhfwIDmXRGv9uIUSccKLWD7kSt7QdteRSDu9/sZnp3WYvQ66bw4dvzg==
X-Received: by 2002:a9d:3983:: with SMTP id y3mr9819323otb.71.1600464923116;
        Fri, 18 Sep 2020 14:35:23 -0700 (PDT)
Received: from serve.minyard.net ([47.184.170.156])
        by smtp.gmail.com with ESMTPSA id c25sm4095600oot.42.2020.09.18.14.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 14:35:22 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:790b:9ad:25b1:4b44])
        by serve.minyard.net (Postfix) with ESMTPSA id 5703518003B;
        Fri, 18 Sep 2020 21:35:20 +0000 (UTC)
Date:   Fri, 18 Sep 2020 16:35:19 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Xianting Tian <tian.xianting@h3c.com>,
        openipmi-developer@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ipmi: msghandler: Fix a signedness bug
Message-ID: <20200918213519.GK3674@minyard.net>
Reply-To: minyard@acm.org
References: <20200918142756.GB909725@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918142756.GB909725@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Sep 18, 2020 at 05:27:56PM +0300, Dan Carpenter wrote:
> The type for the completion codes should be unsigned char instead of
> char.  If it is declared as a normal char then the conditions in
> __get_device_id() are impossible because the IPMI_DEVICE_IN_FW_UPDATE_ERR
> error codes are higher than 127.
> 
>     drivers/char/ipmi/ipmi_msghandler.c:2449 __get_device_id()
>     warn: impossible condition '(bmc->cc == 209) => ((-128)-127 == 209)'

Dang, I should have spotted that.  Thanks, it's applied.

-corey

> 
> Fixes: f8910ffa81b0 ("ipmi:msghandler: retry to get device id on an error")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/char/ipmi/ipmi_msghandler.c | 2 +-
>  drivers/char/ipmi/ipmi_si_intf.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> index 555c3b1e4926..8774a3b8ff95 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -319,7 +319,7 @@ struct bmc_device {
>  	int                    dyn_guid_set;
>  	struct kref	       usecount;
>  	struct work_struct     remove_work;
> -	char		       cc; /* completion code */
> +	unsigned char	       cc; /* completion code */
>  };
>  #define to_bmc_device(x) container_of((x), struct bmc_device, pdev.dev)
>  
> diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> index 164f85007080..0b3dbc7e39fd 100644
> --- a/drivers/char/ipmi/ipmi_si_intf.c
> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> @@ -1344,7 +1344,7 @@ static int try_get_dev_id(struct smi_info *smi_info)
>  			resp + 2, resp_len - 2, &smi_info->device_id);
>  	if (rv) {
>  		/* record completion code */
> -		char cc = *(resp + 2);
> +		unsigned char cc = *(resp + 2);
>  
>  		if ((cc == IPMI_DEVICE_IN_FW_UPDATE_ERR
>  		    || cc == IPMI_DEVICE_IN_INIT_ERR
> -- 
> 2.28.0
> 
