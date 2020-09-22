Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1372742CB
	for <lists+kernel-janitors@lfdr.de>; Tue, 22 Sep 2020 15:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgIVNTV (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 22 Sep 2020 09:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726507AbgIVNTV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Sep 2020 09:19:21 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1768C0613CF
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Sep 2020 06:19:20 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id a17so17016129wrn.6
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Sep 2020 06:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=9GewOd7ipMCxF1aHwWxW4PsJZfwIrEIh8kBMz05Lk/w=;
        b=PzjE8iv+J3iIp+Oj4o3PfIPMtV8nUR7EAaBbIYDmYOpwjFlmejWWdMfF61ABZKnIML
         96KhiUwPwUKgo5Qo3t6TfKg5SFqQBL59u7bTjgQQv4SkvNWOxHUNtCDNQK+w8W1FHwKc
         P9m7bN1PVj3l46dRCfH2kjE28+5MztTu3wmxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=9GewOd7ipMCxF1aHwWxW4PsJZfwIrEIh8kBMz05Lk/w=;
        b=QMSamlZ/BudkJ5/mZE9P0tiAWnx1PwwIBBSsXQdTh64RwaHux9bTesoNpxdSk63Oy8
         9VCpc02M7fsRwgiOZA5FGUlqybgqyA0H8rBEejO2a7IgkoMYIvnDZUkPIKEH0WqJ9ZKi
         Pc1reiuuxNN8jOfZ9/o1WcrynH/meCy/wwbyY8Rb6ruYUm0FCfCfV71xeHezgNlgoNIU
         nKHOF8cXqRX2NVc+B+EnanU18hWTt9b+llfj1y/66IEdB2qWTzD51SGPqraXG4SgcVzF
         3HjWsDI903S9Yyn0aS1IMTBU6iOoHQs0q96dqice4OkStMQecNbamzFXpgP9tc6S/EJ6
         sVfg==
X-Gm-Message-State: AOAM53140gwoNZV1bWeTYlprLkd3F5Ka/B99V48C8cfv1OdSfDNMm7jM
        iCz/uecOQve4iUaRuVRW9qLOPQ==
X-Google-Smtp-Source: ABdhPJzk2cI1GO9aUXv3aroOKwskrl9jpqIgCYu3y/tFOrzYAI88vNvGrwji8l2K4v5ufLKV4CXjgA==
X-Received: by 2002:adf:ec86:: with SMTP id z6mr5457066wrn.109.1600780759566;
        Tue, 22 Sep 2020 06:19:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y5sm26160278wrh.6.2020.09.22.06.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 06:19:18 -0700 (PDT)
Date:   Tue, 22 Sep 2020 15:19:16 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Colin King <colin.king@canonical.com>
Cc:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/gma500: clean up indentation issues
Message-ID: <20200922131916.GM438822@phenom.ffwll.local>
Mail-Followup-To: Colin King <colin.king@canonical.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200920141407.32672-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200920141407.32672-1-colin.king@canonical.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Sep 20, 2020 at 03:14:07PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are a couple of statements that are indented too deeply,
> remove the extraneous tabs and also an empty line.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Pushed to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/gma500/cdv_intel_dp.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> index 720a767118c9..50016a754172 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -1501,8 +1501,7 @@ cdv_intel_dp_start_link_train(struct gma_encoder *encoder)
>  	clock_recovery = false;
>  
>  	DRM_DEBUG_KMS("Start train\n");
> -		reg = DP | DP_LINK_TRAIN_PAT_1;
> -
> +	reg = DP | DP_LINK_TRAIN_PAT_1;
>  
>  	for (;;) {
>  		/* Use intel_dp->train_set[0] to set the voltage and pre emphasis values */
> @@ -1575,7 +1574,7 @@ cdv_intel_dp_complete_link_train(struct gma_encoder *encoder)
>  	cr_tries = 0;
>  
>  	DRM_DEBUG_KMS("\n");
> -		reg = DP | DP_LINK_TRAIN_PAT_2;
> +	reg = DP | DP_LINK_TRAIN_PAT_2;
>  
>  	for (;;) {
>  
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
