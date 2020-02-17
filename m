Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 088F2160E74
	for <lists+kernel-janitors@lfdr.de>; Mon, 17 Feb 2020 10:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728842AbgBQJ15 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 17 Feb 2020 04:27:57 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35725 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728800AbgBQJ15 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 Feb 2020 04:27:57 -0500
Received: by mail-wm1-f67.google.com with SMTP id b17so17596761wmb.0
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Feb 2020 01:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=W3cuPNWL6G9Mkzazr5aYw69mCYySh4JxTzpizFSnP50=;
        b=E9P//0DIVwrempoYlQvPpQ3JLBfVeQX+Igm9H93gtrvhaRYwHmsK2QZLopBDq5HpE+
         /s8riZMDYh/UK5hZKHwcrYWmawp1zyUPGR7QkVeB7Lfj18xoNoLqFRUNObijflqvu8dK
         4DmxlwRS+PTg5okQaXwvwaXC50DXpUnlx6syc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=W3cuPNWL6G9Mkzazr5aYw69mCYySh4JxTzpizFSnP50=;
        b=RM/K3N1RSllDpVj2UwRykDUcmgEPEp/UFs5mUXPFI5qH925ovxTqUGRgBt4K4LPMsh
         5HSZvUm4YEXocF4QHDnHwSQk7NGeUK7aO7I+FJA2LZvr/GYifBDQipMw0K1wlGRyOU0k
         /fq/hqWYfVeivhLSFV3fFwbMCuY8vLHA9YPdMbZ6BI6d5vOLk8jFfmg/azpPW5Bojb0z
         iklz5YQI6NZ1lPfoZurQPu3/124JwHRNooPdX7+filPJoSQYMMhWWqsN4jcDXyn0wcSr
         BFTYs8wzQOIJMkjYNa+lt90yskMwPsfxJ8rsY3oA1duDs7LBL4l8VVKuss9lXrWlaRlZ
         /glA==
X-Gm-Message-State: APjAAAUNuVm4jGily5o6F9n6DF2Z4Z9gQ8Li1ZfsT4mEoAREZ8i7NrQZ
        0Oxc5Jy98dbUnQXMOEeRYOrXjQ==
X-Google-Smtp-Source: APXvYqwubPOPLq30URt7q/mmbsEDobFNeewy4T855nPo/3eKy/wiWdgXW1I99+bIl4JyIDmgOWUVgA==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr19977570wmi.146.1581931674639;
        Mon, 17 Feb 2020 01:27:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id v15sm114015wrf.7.2020.02.17.01.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 01:27:53 -0800 (PST)
Date:   Mon, 17 Feb 2020 10:27:52 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     sumit.semwal@linaro.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] dma-buf: Fix a typo in Kconfig
Message-ID: <20200217092752.GF2363188@phenom.ffwll.local>
Mail-Followup-To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        sumit.semwal@linaro.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
References: <20200216114708.20583-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200216114708.20583-1-christophe.jaillet@wanadoo.fr>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Feb 16, 2020 at 12:47:08PM +0100, Christophe JAILLET wrote:
> A 'h' ismissing in' syncronization'
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks for your patch.
-Daniel

> ---
>  drivers/dma-buf/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index 0613bb7770f5..e7d820ce0724 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -6,7 +6,7 @@ config SYNC_FILE
>  	default n
>  	select DMA_SHARED_BUFFER
>  	---help---
> -	  The Sync File Framework adds explicit syncronization via
> +	  The Sync File Framework adds explicit synchronization via
>  	  userspace. It enables send/receive 'struct dma_fence' objects to/from
>  	  userspace via Sync File fds for synchronization between drivers via
>  	  userspace components. It has been ported from Android.
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
