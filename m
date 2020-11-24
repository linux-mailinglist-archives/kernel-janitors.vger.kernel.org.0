Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 324192C2BBA
	for <lists+kernel-janitors@lfdr.de>; Tue, 24 Nov 2020 16:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389828AbgKXPsD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 24 Nov 2020 10:48:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389529AbgKXPsD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Nov 2020 10:48:03 -0500
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF9DCC0613D6
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Nov 2020 07:48:02 -0800 (PST)
Received: by mail-qv1-xf43.google.com with SMTP id y11so10776738qvu.10
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Nov 2020 07:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=ubJInrGSsPLGKGouG7fpjnMRMu6mjU1dee+kkLRQJso=;
        b=hHQILDw03u/sl9BOCAlhrVjo9pT1JNk1zqKicW8pDpjpdemn2tv0bQrmpqWWp9TJPp
         9WRL3NIb6Oyo/7pQmptCxsdnzIgS4TZC+smRhtxd34Vj6OvTCQWwuPS7kFj2+UAO0Xgy
         4/0c9vuOfTsKe5SFMTjEs+G8oz0P5j3G7CxmCLKbzuAE8hevvUEVPk5huxPVSZ4cBm7f
         JVIG/DOVhd6fUdJA+yPBVPBoMjucv8i/mhsuJdwb+V9mEc8pocbx72lGwXRhFQ7FxBYO
         c4k508M0ay+aTrTr3wbwrpo4b+kQu5nNDoW/aFjAK/pypvbh7Cby3FBjs7cmT3ChR44g
         IlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=ubJInrGSsPLGKGouG7fpjnMRMu6mjU1dee+kkLRQJso=;
        b=qQI2+rUNuJgBmYkCjzwDaTlBYNbJE8q4d/y4g7IRt2PCSq5vtl4AE3awZuJB3W5i31
         sdLfZukvane0Ksv3HmtniIMBELkS7BDxyjp+oFyZdxIKnMjcdGbXxx7ckQHddvVfkV6t
         vvgwfubnR7je+zYGYoCC1ddVxCYoz+soxIKRoMzI5xZVaC7LGkcnz7enxqT1fdOslVgX
         a5u157wDIKfrN1/i1RC9oExi8iuYnCGzbrpo61o8TztfwIp6n9cwh+1qDhFaCnLsNMbT
         QVeUqmOHAdOxg7Wct+lXJfHq7TQXhyU8wzx+OmRe3d9XLBf/IJ23O2UgNd2ix7AFYOcK
         Ozfw==
X-Gm-Message-State: AOAM5320ngyGMu61mSZJ5SfmYyUl0RAZXJiNA13KJAjIrJDkAZRx7kiH
        TRxZLyHDyNbUS54yCUUjck5j3Q==
X-Google-Smtp-Source: ABdhPJydlpNAWXjt4Gk87KvAf/FoPLdSEj4YPKw88iYN9nz6ZjtmfbEXGr3ZkwuOUekwx2ztrZ7ydg==
X-Received: by 2002:ad4:524b:: with SMTP id s11mr5485759qvq.3.1606232882237;
        Tue, 24 Nov 2020 07:48:02 -0800 (PST)
Received: from xanadu.home (modemcable076.50-203-24.mc.videotron.ca. [24.203.50.76])
        by smtp.gmail.com with ESMTPSA id i9sm12931180qtp.72.2020.11.24.07.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 07:48:01 -0800 (PST)
Date:   Tue, 24 Nov 2020 10:48:00 -0500 (EST)
From:   Nicolas Pitre <npitre@baylibre.com>
To:     Colin King <colin.king@canonical.com>
cc:     Boris Brezillon <bbrezillon@kernel.org>,
        linux-i3c@lists.infradead.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] i3c/master: Fix uninitialized variable next_addr
In-Reply-To: <20201124123504.396249-1-colin.king@canonical.com>
Message-ID: <nycvar.YSQ.7.78.906.2011241046530.2184@knanqh.ubzr>
References: <20201124123504.396249-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 24 Nov 2020, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable next_addr is not initialized and is being used in a call
> to i3c_master_get_free_addr as a starting point to find the next address.
> Fix this by initializing next_addr to 0 to avoid an uninitialized garbage
> starting address from being used.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Nicolas Pitre <npitre@baylibre.com>





> ---
>  drivers/i3c/master/mipi-i3c-hci/cmd_v1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> index 6dd234a82892..d97c3175e0e2 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> @@ -293,7 +293,7 @@ static int hci_cmd_v1_daa(struct i3c_hci *hci)
>  {
>  	struct hci_xfer *xfer;
>  	int ret, dat_idx = -1;
> -	u8 next_addr;
> +	u8 next_addr = 0;
>  	u64 pid;
>  	unsigned int dcr, bcr;
>  	DECLARE_COMPLETION_ONSTACK(done);
> -- 
> 2.29.2
> 
> 
