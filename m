Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F19323154A
	for <lists+kernel-janitors@lfdr.de>; Wed, 29 Jul 2020 00:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729650AbgG1WCK (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 28 Jul 2020 18:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729484AbgG1WCK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 28 Jul 2020 18:02:10 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D718FC0619D2
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Jul 2020 15:02:09 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f7so19725551wrw.1
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Jul 2020 15:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=vqnKMLXqTkEdIlwdpguJGd/nIpB4YeuwS5l62z63FMw=;
        b=NDCu7QgcAq7+TW7f+5/b58wRYuFOxNU7md4Tk+HGctDkj+yK8BZE5ZExbD/h1lASPV
         hFurpdD9fO1Rj8h0Qbz33aWC27fLh7LVJNdqfbAJo6RTpRnc+FDhdre6+7FNB3lCsHjd
         cdLJ4W2jhZqC3T9bPV1wJPOW01YhcQvP8NgJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=vqnKMLXqTkEdIlwdpguJGd/nIpB4YeuwS5l62z63FMw=;
        b=gjcFBaILE33VjS+j3N0WXM/4fg2vvii+sYZ+epl3mrEGKRV75RforpxSN2EnyYLVA1
         6DKJE/ivdVreWUAOGf5TukpxPQvtNYiD6GJkvRofZKs9+KrQlAUvq/Xlh0J8MOC6BPa3
         J5+NKkv4ixEBdP5HCkt3npPCAPNQp6iyHl+kHLImQi1EP1/HB668ZgRTNVPrxjmF/tYq
         UnwXjk+HhnDvuixhQxE0Nyp3N/uBZHmKYdlFcB6rVg7k/EgAHjC51ezuXtLd1d5hohCa
         +rLPQE+R0oRRtmtU4mtHBqIAEBq65NczP2q5vsR0AJU9DdSb6YtVzYTGot7TOqStY2Yn
         h7ew==
X-Gm-Message-State: AOAM533R5JE2xvXowJrcyN9b+ozIsHRQkVwovIgFpPyuankrolovQdZe
        ZN+PVkM5Refv3Z6XzCtLzeRA1Q==
X-Google-Smtp-Source: ABdhPJxRQsWjsGbojKh939WX9+AjyfoL6oRNBjWQkv5BgfV9n7qdpTPTlymdET8fHHeG8IvyVPgXZg==
X-Received: by 2002:adf:de09:: with SMTP id b9mr14191027wrm.409.1595973728531;
        Tue, 28 Jul 2020 15:02:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u1sm364997wrb.78.2020.07.28.15.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 15:02:07 -0700 (PDT)
Date:   Wed, 29 Jul 2020 00:02:05 +0200
From:   daniel@ffwll.ch
Cc:     Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Michal Simek <michal.simek@xilinx.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] drm: xlnx: Fix typo in parameter description
Message-ID: <20200728220205.GJ6419@phenom.ffwll.local>
Mail-Followup-To: Wei Yongjun <weiyongjun1@huawei.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Michal Simek <michal.simek@xilinx.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
References: <20200725063429.172139-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200725063429.172139-1-weiyongjun1@huawei.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
To:     unlisted-recipients:; (no To-header on input)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Hyun Kwon,

Are you all sorted with drm-misc commit rights so you can push the 3
(maybe there's more) xlnx fixup patches to drm-misc-next-fixes?

Cheers, Daniel

On Sat, Jul 25, 2020 at 06:34:29AM +0000, Wei Yongjun wrote:
> Fix typo in parameter description.
> 
> Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 821f7a71e182..3d53638ab15e 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -44,7 +44,7 @@ MODULE_PARM_DESC(aux_timeout_ms, "DP aux timeout value in msec (default: 50)");
>   */
>  static uint zynqmp_dp_power_on_delay_ms = 4;
>  module_param_named(power_on_delay_ms, zynqmp_dp_power_on_delay_ms, uint, 0444);
> -MODULE_PARM_DESC(aux_timeout_ms, "DP power on delay in msec (default: 4)");
> +MODULE_PARM_DESC(power_on_delay_ms, "DP power on delay in msec (default: 4)");
>  
>  /* Link configuration registers */
>  #define ZYNQMP_DP_LINK_BW_SET				0x0
> 
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
