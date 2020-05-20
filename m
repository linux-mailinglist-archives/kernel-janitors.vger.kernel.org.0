Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1AA41DBDB7
	for <lists+kernel-janitors@lfdr.de>; Wed, 20 May 2020 21:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbgETTOr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 20 May 2020 15:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbgETTOq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 20 May 2020 15:14:46 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB17CC061A0F
        for <kernel-janitors@vger.kernel.org>; Wed, 20 May 2020 12:14:46 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id q8so2043684pfu.5
        for <kernel-janitors@vger.kernel.org>; Wed, 20 May 2020 12:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Qfy34lYRRu2hV9OIa5dl/okKsPjOM6Et+8fxjIcZ8qY=;
        b=YPfYkeDQ+gTAnpY83KaW2QBCh0nknfH2vVvk2LUApXk9qaJe5Hz4Rxy/G/8hbay8fy
         xakYhlfFqyK3LFTgqSed31/sqJXoPPf2jrL/PW6spmdmlZNQQeRehNaczgRdo8roFXj0
         HMre2Iw6aAbK5sJlUNl8ghoeGyUurmjxofAGjR0QSYz72JaLpBIZovngV8J1v1EXW6Zs
         hvOlnxRWNEI4mNcV1lGpwCbbIkHUVpG2Mg55TFe6rX5kWphAa++GsBLUUxkjMzuJtBZ8
         hUHtbMlrwvKs7xUOAXFXh5JvNgfXihort5UYPodpNE2bfZOhjJ98YRRe+V0qCtfuLc0n
         Y91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qfy34lYRRu2hV9OIa5dl/okKsPjOM6Et+8fxjIcZ8qY=;
        b=D5IP6jBGFMw031qj65dzFqtUGeH28PFqKSI27qrAwnL6oGrpgiTvTvisSMZZvwXQmB
         dflapUWY0Y6JyB7i7B8dRpOcgRiBfII4mNeLHqoOyTMoWQnS7YzavHcnzZd9Hd3SQerq
         vTns2wYf9TzQHHImYne7icLDLyBPAWFzy8Kv+gvcxbvpeq88ruKlrZon84n1AkxxOUwM
         Na74IWxwn5EwuBcEK5+w0BxD/cFggn3sJ+P0lauVA53yRHVQMb02Tt2I5EUnXXR9LPBb
         Qjp8jvIZBIRjcgvPOSGoJn3jSjYtmCNfmI/yM8+T+IJi7datgdI3Cn9wG6Jr4QstrEYC
         UNJA==
X-Gm-Message-State: AOAM533XUTIT5MTrfX2H47STVn6bTrBLXe4SFgWi3UE/hbkWNVlAlUmk
        gtF9xfX1luq30DhHdBxDETztEQ==
X-Google-Smtp-Source: ABdhPJyw2DUw4oJ1hNWGLteEorty/WEjBaKTJv6w8lsZzPw2ZAHapKnm5FWasJ1sNvo4UI2B2pwOhQ==
X-Received: by 2002:a63:b146:: with SMTP id g6mr5344808pgp.396.1590002086070;
        Wed, 20 May 2020 12:14:46 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 5sm2300189pgl.4.2020.05.20.12.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 12:14:45 -0700 (PDT)
Date:   Wed, 20 May 2020 12:13:26 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Paul Cercueil <paul@crapouillou.net>,
        linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] remoteproc: Fix an error code in devm_rproc_alloc()
Message-ID: <20200520191326.GH408178@builder.lan>
References: <20200520120705.GH172354@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520120705.GH172354@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed 20 May 05:07 PDT 2020, Dan Carpenter wrote:

> The comments say that this function should return NULL on error and the
> caller expects NULL returns as well so I have modified the code to match.
> Returning an ERR_PTR(-ENOMEM) would lead to an OOps.
> 
> Fixes: 305ac5a766b1 ("remoteproc: Add device-managed variants of rproc_alloc/rproc_add")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by and applied

Thanks,
Bjorn

> ---
>  drivers/remoteproc/remoteproc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 0cc015fabf78..9f04c30c4aaf 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2297,7 +2297,7 @@ struct rproc *devm_rproc_alloc(struct device *dev, const char *name,
>  
>  	ptr = devres_alloc(devm_rproc_free, sizeof(*ptr), GFP_KERNEL);
>  	if (!ptr)
> -		return ERR_PTR(-ENOMEM);
> +		return NULL;
>  
>  	rproc = rproc_alloc(dev, name, ops, firmware, len);
>  	if (rproc) {
> -- 
> 2.26.2
> 
