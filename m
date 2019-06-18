Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA244A81B
	for <lists+kernel-janitors@lfdr.de>; Tue, 18 Jun 2019 19:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730157AbfFRRQc (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 18 Jun 2019 13:16:32 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:41961 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728572AbfFRRQc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jun 2019 13:16:32 -0400
Received: by mail-qt1-f195.google.com with SMTP id d17so11328545qtj.8
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jun 2019 10:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5HdOkeGTOimtUzxYuQ63HUqEs40RoAuiCtdWAjPZDM0=;
        b=OaDtkN5HFpjGr/oGrGRtE6pafVhMmdq/+VJSFcdz1WobXMuZUUKApbaDiA9vnXK2j3
         M1ZG9xkYjtUHKnUSxIWDICD7d9IOcd3cpxqHPwMwqOnwjKwahWRc8XwbX0PJfKH98415
         37Tsyp4Yhxud4rCL+Rw1GCax0qVqIuAdhttJfj9MfV0epKELmBAAIwOXbAonPiJugOsp
         EhKXuX5lRWnE12UtILOB1cW4SFsisYFxR1LSJ3zLUupulctUeP/CFusTIdpSZD8JLC4E
         dlPL2W1HH03olfJL/RXjzT2piEGtlzgdSpRKJfjApX6sjAnrlenIcMgVNTGyGbpx++rF
         yzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5HdOkeGTOimtUzxYuQ63HUqEs40RoAuiCtdWAjPZDM0=;
        b=AK1GgiNX9TLohqtVmUCMisHzVpQOJb3RQk+l2CN2vqyxLQ3pjwd66AnphIr/mQX23t
         pttdE81qKt+E940lR49E1ZFGvnKBOPcJ9h/+1uvaAZQYxpCLOwl2IZR6D5p7fck1XTF+
         WgtgbCXNSwzmnRsxR464eYLFdwkFf80AGUEadxjJRpl75TUsUVszk5fcBHzWEHHB71kv
         zy7VRguJGS9E5sKzIB0NHZW6+LBB4phv/on24NqfC5nQLDBhvwwAyZroOg/qkwF4ug32
         KD39PXJEwZhKr6mqUSFFp1YMbumGeP1IGxv2SPlnIzO/7QGn0gUSqzwCeVB06YRw2ixi
         X4bg==
X-Gm-Message-State: APjAAAXl+QwBAJZRyxRToBn1UB4FqLFyagihCYjJbs9uO3tohS6ukAIO
        Zp0NcD/u9UmbvTZr65quN6RnnQ==
X-Google-Smtp-Source: APXvYqxHpvdIJ3r1rR8PFVV6pBLc7jwq+5ZT5DwQvMXjzrBn2Est5EPpbCwUxoMEH+iz1jdelPvGnA==
X-Received: by 2002:ac8:2bb3:: with SMTP id m48mr98945689qtm.218.1560878191074;
        Tue, 18 Jun 2019 10:16:31 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id o71sm8278024qke.18.2019.06.18.10.16.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 10:16:30 -0700 (PDT)
Date:   Tue, 18 Jun 2019 13:16:29 -0400
From:   Sean Paul <sean@poorly.run>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] drm: return -EFAULT if copy_to_user() fails
Message-ID: <20190618171629.GB25413@art_vandelay>
References: <20190618125623.GA24896@mwanda>
 <20190618131843.GA29463@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618131843.GA29463@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 18, 2019 at 04:18:43PM +0300, Dan Carpenter wrote:
> The copy_from_user() function returns the number of bytes remaining
> to be copied but we want to return a negative error code.  Otherwise
> the callers treat it as a successful copy.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan, I've applied this to drm-misc-fixes.

Sean

> ---
> v2: The first version was missing a chunk
> 
>  drivers/gpu/drm/drm_bufs.c  | 5 ++++-
>  drivers/gpu/drm/drm_ioc32.c | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index 68dacf8422c6..8ce9d73fab4f 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -1351,7 +1351,10 @@ static int copy_one_buf(void *data, int count, struct drm_buf_entry *from)
>  				 .size = from->buf_size,
>  				 .low_mark = from->low_mark,
>  				 .high_mark = from->high_mark};
> -	return copy_to_user(to, &v, offsetof(struct drm_buf_desc, flags));
> +
> +	if (copy_to_user(to, &v, offsetof(struct drm_buf_desc, flags)))
> +		return -EFAULT;
> +	return 0;
>  }
>  
>  int drm_legacy_infobufs(struct drm_device *dev, void *data,
> diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
> index 586aa28024c5..a16b6dc2fa47 100644
> --- a/drivers/gpu/drm/drm_ioc32.c
> +++ b/drivers/gpu/drm/drm_ioc32.c
> @@ -378,7 +378,10 @@ static int copy_one_buf32(void *data, int count, struct drm_buf_entry *from)
>  			      .size = from->buf_size,
>  			      .low_mark = from->low_mark,
>  			      .high_mark = from->high_mark};
> -	return copy_to_user(to + count, &v, offsetof(drm_buf_desc32_t, flags));
> +
> +	if (copy_to_user(to + count, &v, offsetof(drm_buf_desc32_t, flags)))
> +		return -EFAULT;
> +	return 0;
>  }
>  
>  static int drm_legacy_infobufs32(struct drm_device *dev, void *data,
> -- 
> 2.20.1
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
