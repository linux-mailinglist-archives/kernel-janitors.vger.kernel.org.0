Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7630C2B7EB0
	for <lists+kernel-janitors@lfdr.de>; Wed, 18 Nov 2020 14:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgKRNz3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 18 Nov 2020 08:55:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgKRNz3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 18 Nov 2020 08:55:29 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DBDDC0613D6
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Nov 2020 05:55:29 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id h21so2805708wmb.2
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Nov 2020 05:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=EOtSSeuOY9/kfAxGh8gbplfY1RBV3U9K8nR4s4raEd0=;
        b=Ae/vBe3EfmqC/FMwuAFEnvJHhBW5/Nv6iJTKL+D1z2GQSPCnOGY4JWL/SgbJFy0Wqw
         7dS78uzPZE2ceuCuH7kH9HHgoAbCUvRZFHZRf7sIXRDU+ENN7+Aivnw1V7SlgkfUTmFb
         +3PojYAiA+eYg+1YiV/wppO1BO2MQwCX+OstLebCM8jc9z5CgNb6vOQs7ur91zXL7ziq
         MFsJdIgcey2dAHig5kAGCFIIGCgKXaqYgyOvsxBZCpo/V0ONrrW3VQ0FIpb2YKJcefWC
         KjosxfFuga27Wrwfr4D2/xjEIHLwlipJ7BXn0aMiJEcczDVDl9bNfuqk+2QxAbr/qdnZ
         SAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=EOtSSeuOY9/kfAxGh8gbplfY1RBV3U9K8nR4s4raEd0=;
        b=g3mQEUiC/5da5tE9q6Z3ldBcTCLcTlerp2jNekos+eHs7thPCU8oNVG/+toKxkHbrM
         JgBO6EgjOoWbIzhE0ZQ0n8BIlEjJkqZU+CARW3dn/O+zPC+XwJYUW2/FsxGgc+92xpNa
         Xi8J/BnpvHSYlp7cef95fSngJJNb0RGbWV4u2jJZUbIN78y9PRCWNXOOlhQJeVd5X5bo
         mQmVNVwRYKW+1nkmxjfincyNyQ3B1/uKg1DDFTbgZBsZ9mRvdRvpiWgtCXiTjWKOsc5k
         AIqWz0PlNJrcyCnpQKPwrzrVY7K5RqL7toWoJ2Zb3cQr+zUF6zDTkazOUNPadoBo5+O9
         DhLw==
X-Gm-Message-State: AOAM530cE1oXoHSsW2QileCxnGq7kqlcT1VRUW95gkYKDT0bhQkBNBUS
        Cvkagj0B9pT2m8ZViW3uNGtrHw==
X-Google-Smtp-Source: ABdhPJxjNhfbB51gdYoYsjFrofkZy+/pHb/HBijfCMmZzKYOQNukaKmsKTQSN0bFYJEF2v+74w50Nw==
X-Received: by 2002:a1c:208f:: with SMTP id g137mr162567wmg.116.1605707727689;
        Wed, 18 Nov 2020 05:55:27 -0800 (PST)
Received: from dell ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id y16sm31976731wrt.25.2020.11.18.05.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 05:55:27 -0800 (PST)
Date:   Wed, 18 Nov 2020 13:55:25 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Colin King <colin.king@canonical.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/selftests/test-drm_dp_mst_helper: fix memory
 leak allocated to 'out'
Message-ID: <20201118135525.GT1869941@dell>
References: <20201118134901.461841-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201118134901.461841-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 18 Nov 2020, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when txmsg fails to allocate then there is a leak on 'out'. Fix
> this by setting result to false and exiting via the clean up exit path.
> Note since txmsg is NULL at this point, the kfree of txmsg is a no-op.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: 09234b88ef55 ("drm/selftests/test-drm_dp_mst_helper: Move 'sideband_msg_req_encode_decode' onto the heap")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

This is fixed in my local branch.

Looks like the wrong version of the patch was sent/applied.

Either way, thanks for the fix Colin.

Reviewed-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> index 6b4759ed6bfd..dbac073ed385 100644
> --- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> +++ b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> @@ -131,8 +131,10 @@ sideband_msg_req_encode_decode(struct drm_dp_sideband_msg_req_body *in)
>  		return false;
>  
>  	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
> -	if (!txmsg)
> -		return false;
> +	if (!txmsg) {
> +		result = false;
> +		goto out;
> +	}
>  
>  	drm_dp_encode_sideband_req(in, txmsg);
>  	ret = drm_dp_decode_sideband_req(txmsg, out);

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
