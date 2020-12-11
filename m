Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8102D7F66
	for <lists+kernel-janitors@lfdr.de>; Fri, 11 Dec 2020 20:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393583AbgLKTaT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 11 Dec 2020 14:30:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393573AbgLKTaD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Dec 2020 14:30:03 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1DCC0613D6
        for <kernel-janitors@vger.kernel.org>; Fri, 11 Dec 2020 11:29:22 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id t8so7596440pfg.8
        for <kernel-janitors@vger.kernel.org>; Fri, 11 Dec 2020 11:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mTNRkZN78nWE7RuNU9seNWtfXw5g6UF+iM4vGdKAeyU=;
        b=LIRRdEISSeD3UoBtyEvDd0t9+94kSskvNSMtiNkV95WfnNoeIkeFUQgjlItOHfDupc
         Drd25/whuG1vqsZe1mkXeY1NbB7r0IcKFPnuawrwUgnOk/W/zEqHpmeWz7oj2qZTAjDH
         RDWDUvl8cGjudLCX5vWoMmdSATJ3oekipLO+WzGWSQVL15k+z4q1d8C6q50Q+zWU+40M
         ZZfMQ5NV7RdU53pHEKPOqTpP8O//K7XmkPHR4riSNKLRNKpuauYZ2/T7z3c33iM+PXWj
         RJP3Pig7zWjDhGCfgY0R4oswEIYmGl8g8CtZL2WNoV4IA8pjKjla9Rp4CqxhUDz6kRLN
         FhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mTNRkZN78nWE7RuNU9seNWtfXw5g6UF+iM4vGdKAeyU=;
        b=NoZd6kuCpJZx2YZ+r4AlKycTk+pbgb+S/w1dfe5shaf0bDpiNB7SogoulZ9jSXY2uR
         87Jt9NA/PMSNtSXBZOuTtHvn8z3avNNvoPv4uWMW0yWhNd/On0ko/mFiCVDh1IWDjwrB
         6q/MYqjBxmC3jTZKvYJX6jDNC//CyOkuibHMsDXnKyR9t+ceLnEFM3u49AouRPcPwSCf
         Tm8jcTPpxeF2C5bkbq7zENnboFZp22k7m2k7w4VuqbAPB387OzOi8QY3Y6d2L5AReLlo
         zGaP9qIMxgDJSVf7cMEDordIDaXYV03KyAU3aHeBOGv7FONKJ17EmXwG9r2d8E42vocg
         QJFw==
X-Gm-Message-State: AOAM530v1KXnzB31S2Upfr3EV6mdYsEzHo09vNOFS6dH0DzxQ4VT7ycb
        nsofq/6ewbMSzYYYBecWNTN+0ln21lNGmQ==
X-Google-Smtp-Source: ABdhPJwmp1wEwBY9KTgTJhFQ6IRL5rVvkUkKnNZznmf+8yiXr4ujsxrYARHg14X3ZryDQnr9ZtMLfw==
X-Received: by 2002:a63:525c:: with SMTP id s28mr13527317pgl.134.1607714961862;
        Fri, 11 Dec 2020 11:29:21 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id gk4sm7832691pjb.57.2020.12.11.11.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Dec 2020 11:29:21 -0800 (PST)
Subject: Re: [PATCH v2] block: drop dead assignments in loop_init()
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org
Cc:     Hannes Reinecke <hare@suse.de>, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org
References: <20201211184604.27646-1-lukas.bulwahn@gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <511d884a-ed95-5e9f-0fea-b859355a6c7f@kernel.dk>
Date:   Fri, 11 Dec 2020 12:29:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211184604.27646-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 12/11/20 11:46 AM, Lukas Bulwahn wrote:
> Commit 8410d38c2552 ("loop: use __register_blkdev to allocate devices on
> demand") simplified loop_init(); so computing the range of the block region
> is not required anymore and can be dropped.
> 
> Drop dead assignments in loop_init().
> 
> As compilers will detect these unneeded assignments and optimize this,
> the resulting object code is identical before and after this change.
> 
> No functional change. No change in object code.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> v1 -> v2:
>   - replaced if block with ternary operator after Julia's style comment
> 
> Christoph, please ack.
> 
> Jens, please pick this minor non-urgent clean-up patch on your
> block -next tree on top of Christoph's commit above.
> 
>  drivers/block/loop.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index d2ce1ddc192d..10c7c154c114 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -2304,7 +2304,6 @@ MODULE_ALIAS("devname:loop-control");
>  static int __init loop_init(void)
>  {
>  	int i, nr;
> -	unsigned long range;
>  	struct loop_device *lo;
>  	int err;
>  
> @@ -2341,13 +2340,7 @@ static int __init loop_init(void)
>  	 * /dev/loop-control interface, or be instantiated by accessing
>  	 * a 'dead' device node.
>  	 */
> -	if (max_loop) {
> -		nr = max_loop;
> -		range = max_loop << part_shift;
> -	} else {
> -		nr = CONFIG_BLK_DEV_LOOP_MIN_COUNT;
> -		range = 1UL << MINORBITS;
> -	}
> +	nr = max_loop ? max_loop : CONFIG_BLK_DEV_LOOP_MIN_COUNT;

I greatly prefer an if/else to ternary, it's a lot easier to read imho.

-- 
Jens Axboe

