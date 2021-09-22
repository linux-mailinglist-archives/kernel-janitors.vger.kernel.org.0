Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA830414A58
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Sep 2021 15:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231663AbhIVNS6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 22 Sep 2021 09:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbhIVNS5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 22 Sep 2021 09:18:57 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C62C061574
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Sep 2021 06:17:27 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id d6so6611173wrc.11
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Sep 2021 06:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=FPfmBJzHT+JaocXdsOVwjR5yIsUZhr27wAcmXc5LLyw=;
        b=Hz+9GFA/nDOvS6b2pvrs/o4qttiLDv/3qcOO+yBAaGVnYaz56kHxvOvQuptlQqjKHz
         vhsztXkx1i27riCnpY9UKPZsCNFylntcNak9k4JvLz3AkHe5CTTLb1vzTvEiu2YhsZDl
         IutxxV+bVcBxfoOuIWHKH05knX5RJN02doZjdxqQxOrVpaiQO7/qPDEQ8FxBFmLfMds3
         c6Yj44fO9b23HJCnxfcIxNFGFP+StM31QNUigrNmaf4f2Kz8Hk9d3kybPmaJVuJyJBgi
         SWkHIOaxqJEsV4t8Xu2O9kIF0EVr1iOjhqX7Jt6Yw8XKPBDd16SR9VJJGX70IUGjx+3I
         F/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=FPfmBJzHT+JaocXdsOVwjR5yIsUZhr27wAcmXc5LLyw=;
        b=pJZZI3QYZLfqBGag7R04f61BLUpxx0vIHmQPQynibKyULXCXN/uKr84HUbLL3qfHdW
         kB91Kc5KtXNfH2e/3Xld6Zk7CNMr5DL85srJM5QFJfr1sktql9vQQnL6Nk879qC5LGcB
         lV3sMtqaJb0GfOUh07tl71g7yJj0Fs8VkYtAyBXhdjYpihAW5xP+VesNccbUpY920bh3
         jLqUwNmaoWuaYQKm1JR7+NnHQ+wxJEReoar1uK0V9pSipgAk1oifJKlxgPCyeZLRCtgp
         2UOnbMzByO8rCFyaImH83lK11HrwoOLlGDUccJsljXhRq6tDedzliBGbiGdmc3vwX8sY
         DJeg==
X-Gm-Message-State: AOAM530CojF7KTyjAvzd8tKPH91F7q1VvSDd0KruhwQku5KVEUjgccGf
        TTBg99h2KZbMevWcNOMuj+A9iQ==
X-Google-Smtp-Source: ABdhPJxnCGGSJkeD7rng8f/uNJHmNF+Jg0efhKKJmNzWkc9UJw6VAEz47CT0ALJuUJUwR2WZVMeoOQ==
X-Received: by 2002:a5d:56cf:: with SMTP id m15mr41644241wrw.240.1632316646386;
        Wed, 22 Sep 2021 06:17:26 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id g131sm1993221wme.22.2021.09.22.06.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 06:17:25 -0700 (PDT)
Date:   Wed, 22 Sep 2021 14:17:23 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Colin King <colin.king@canonical.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: ti_am335x_tscadc: Fix spelling mistake "atleast" ->
 "at least"
Message-ID: <YUss4+szE8241hP4@google.com>
References: <20210826123250.14234-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210826123250.14234-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 26 Aug 2021, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mfd/ti_am335x_tscadc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
