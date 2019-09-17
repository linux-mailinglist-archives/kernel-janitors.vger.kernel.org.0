Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9502CB4E9A
	for <lists+kernel-janitors@lfdr.de>; Tue, 17 Sep 2019 14:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727649AbfIQM6T (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 17 Sep 2019 08:58:19 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:35410 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727383AbfIQM6T (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 17 Sep 2019 08:58:19 -0400
Received: by mail-ed1-f66.google.com with SMTP id v8so3252076eds.2
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Sep 2019 05:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=JXHXCUn3xM+axjQAgcuFy2E9zY+IExK3yfeI1AgqjB4=;
        b=Tmu3YdHSFA/P+RkVYRWHFlE/3X1GgBFXNXG6wy3twbQw9KPZwRbZYwc5AmDRKzeN6g
         SS9cEfqNtVkP0Wsa/59olR50tqTVxpASsF/9EQ0z/X/nry4N1NLvE/wemSdYQMZ/JU8t
         98iX46vz2p7axxaycWCzoz+LQGBLFndkR5hGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=JXHXCUn3xM+axjQAgcuFy2E9zY+IExK3yfeI1AgqjB4=;
        b=HGJOx6VKbhMUcqKVIrBti9StJlEgNuuhZD1naPm/fLMPQATVWs/HbUuvMWidHo623Q
         QSku51Sz+4aYceOgiGMRcUy6sKyFfpclruuuGK3m4KOx+KArPnI4ao/aZNW+pfNGIXyi
         G2c2VxO7r7JCTaANpTae7jBVTHvHieRyXtwWb4xYCsgmifMWKZ3x5sLH9utUv4hmEcOR
         5iKJRqmK7Ul9qffx8c5784NA2GZUuNkr4exxSrHb82xBBvQF1+63N8ArOOD7IyuOOIE4
         ucLhvQbj/1VCMckhkvuAYfoDhn/K+N6Kjz7n1fgqCqIS3gCF9lIzylwo3Ez+X72w3FdD
         wzVA==
X-Gm-Message-State: APjAAAXU4DI01+bmsJLMtosSayXBFbEVqbjIEhSW3J7onvu6YCRHudgd
        l8SVntn8d0aHOVywV7eefeRuyQ==
X-Google-Smtp-Source: APXvYqwf2E3f40RP0ReqpIf9aZ1TLZgS52+Wgx+6ACEfQaxosSIzrNsstrvKcAOYE/POx7VVeBQCsw==
X-Received: by 2002:a17:906:31c3:: with SMTP id f3mr4727778ejf.296.1568725097303;
        Tue, 17 Sep 2019 05:58:17 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id j8sm333049edy.44.2019.09.17.05.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 05:58:16 -0700 (PDT)
Date:   Tue, 17 Sep 2019 14:58:14 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Colin King <colin.king@canonical.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/selftests: fix spelling mistake "misssing" ->
 "missing"
Message-ID: <20190917125814.GS3958@phenom.ffwll.local>
Mail-Followup-To: Colin King <colin.king@canonical.com>,
        David Airlie <airlied@linux.ie>,
        Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190911091227.5710-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911091227.5710-1-colin.king@canonical.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 11, 2019 at 10:12:27AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a literal string, fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
-Daniel

> ---
>  drivers/gpu/drm/selftests/test-drm_framebuffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/selftests/test-drm_framebuffer.c b/drivers/gpu/drm/selftests/test-drm_framebuffer.c
> index 74d5561a862b..2d29ea6f92e2 100644
> --- a/drivers/gpu/drm/selftests/test-drm_framebuffer.c
> +++ b/drivers/gpu/drm/selftests/test-drm_framebuffer.c
> @@ -126,7 +126,7 @@ static struct drm_framebuffer_test createbuffer_tests[] = {
>  		 .handles = { 1, 1, 0 }, .pitches = { MAX_WIDTH, MAX_WIDTH - 1, 0 },
>  	}
>  },
> -{ .buffer_created = 0, .name = "NV12 Invalid modifier/misssing DRM_MODE_FB_MODIFIERS flag",
> +{ .buffer_created = 0, .name = "NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag",
>  	.cmd = { .width = MAX_WIDTH, .height = MAX_HEIGHT, .pixel_format = DRM_FORMAT_NV12,
>  		 .handles = { 1, 1, 0 }, .modifier = { DRM_FORMAT_MOD_SAMSUNG_64_32_TILE, 0, 0 },
>  		 .pitches = { MAX_WIDTH, MAX_WIDTH, 0 },
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
