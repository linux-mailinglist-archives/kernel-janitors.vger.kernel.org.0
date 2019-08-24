Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5022F9C037
	for <lists+kernel-janitors@lfdr.de>; Sat, 24 Aug 2019 22:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727690AbfHXUvD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 24 Aug 2019 16:51:03 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45610 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726842AbfHXUvD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 24 Aug 2019 16:51:03 -0400
Received: by mail-ot1-f66.google.com with SMTP id m24so11836399otp.12
        for <kernel-janitors@vger.kernel.org>; Sat, 24 Aug 2019 13:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+jvXcB32u37L1rKABHrIjYMrHm6miJoN7sKZxqjMMSM=;
        b=UFOILBCJda5lT3hPiG6V+UiOWHgFuNyCJTdsDUZUI5XcsDyJTvM9zif5ECvCcPVBe/
         r++hwjjxG1sBoXAy/PULXQ1oJjaWMK9nsiEqa0l4ln3Mo6IaZ6GoVdOQ6fbCI5yH7JUv
         pZQ3FNPAMKFCIHoXPX46qQkwlW+fUoHu2LFPH1jHGWoC0v0yOkpQ8s7ivDmTSdH/A2do
         NEIIkd+7tyso3JuUqX8eVWqhE8wNCiz3c1c21jGqRkoDi3K7Bb7L1WoeuwcyISqI6jUC
         3wmjB6dmZs/ef9OmWMzQ34Kmp+0IwFLfSEugP0upk8uQdHpFmztXbmktXJwjKF/AqcBM
         NlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to
         :user-agent;
        bh=+jvXcB32u37L1rKABHrIjYMrHm6miJoN7sKZxqjMMSM=;
        b=VrcqkrUIqn1J+TtuudDjCrcxj68FzLxE5poelf7BFYHeQAoO3YKZoW/F85QKVHdpfZ
         aNpXPbsXC9xq69bkGC4+349u9DMDmiH23tkMa87SN3fmEDaUQK0o38/P40sThB64gHvn
         f1sKHhmOtUzSB5lYI3l7Knr5dzL+hCLrwOfJ/dkycsxt7Xnju3+CQQNU+9/V6VEs5xlX
         90Mc38/yV82QErFpY6Kx21P3Gj+c/Cl/fQtDyENPtGyZaYlrL95VsY8dnK3udH0qkLzm
         9tJtE7PeCDOdGQy9cRde3A117RqB2cWiXSyf5KTZdyIYNQBDdupoVOWGaqx7XUSFKnSS
         0yqA==
X-Gm-Message-State: APjAAAUNHEBbICccSr6kY6QDxo/sqyGhBZJpznteTu+akYLTw8nkvW44
        8ay3fZ4hapQN2nIWE50iOA==
X-Google-Smtp-Source: APXvYqyWRo56OChknw38Sq0FxucUOJeDqSyzDRF8wLkOxp9aYCjbZFKdTNXHPFYHcr/db9nlJ9+lYg==
X-Received: by 2002:a9d:4703:: with SMTP id a3mr9607336otf.183.1566679862520;
        Sat, 24 Aug 2019 13:51:02 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id l16sm2251124otq.42.2019.08.24.13.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2019 13:51:02 -0700 (PDT)
Received: from minyard.net (t430m.minyard.net [192.168.27.3])
        by serve.minyard.net (Postfix) with ESMTPSA id 6A2E5180039;
        Sat, 24 Aug 2019 20:51:01 +0000 (UTC)
Date:   Sat, 24 Aug 2019 15:51:00 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Kamlakant Patel <kamlakantp@marvell.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        openipmi-developer@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ipmi_ssif: Fix locking on probe error path
Message-ID: <20190824205059.GB14083@minyard.net>
Reply-To: minyard@acm.org
References: <20190824145147.GB5337@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190824145147.GB5337@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Aug 24, 2019 at 05:51:47PM +0300, Dan Carpenter wrote:
> If the allocations failed then we returned with the lock held.  This
> patch moves the allocations infront of the locking.

This had already been fixed, but thanks for the heads up.

-corey

> 
> Fixes: 714acbc6cc39 ("ipmi_ssif: avoid registering duplicate ssif interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/char/ipmi/ipmi_ssif.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
> index 205726926bd3..9cf2efd33f19 100644
> --- a/drivers/char/ipmi/ipmi_ssif.c
> +++ b/drivers/char/ipmi/ipmi_ssif.c
> @@ -1683,7 +1683,6 @@ static int ssif_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	u8		  slave_addr = 0;
>  	struct ssif_addr_info *addr_info = NULL;
>  
> -	mutex_lock(&ssif_infos_mutex);
>  	resp = kmalloc(IPMI_MAX_MSG_LENGTH, GFP_KERNEL);
>  	if (!resp)
>  		return -ENOMEM;
> @@ -1694,6 +1693,8 @@ static int ssif_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		return -ENOMEM;
>  	}
>  
> +	mutex_lock(&ssif_infos_mutex);
> +
>  	if (!check_acpi(ssif_info, &client->dev)) {
>  		addr_info = ssif_info_find(client->addr, client->adapter->name,
>  					   true);
> -- 
> 2.20.1
> 
