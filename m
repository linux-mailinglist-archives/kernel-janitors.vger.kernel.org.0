Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0D31721AF
	for <lists+kernel-janitors@lfdr.de>; Thu, 27 Feb 2020 15:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732521AbgB0O5p (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 27 Feb 2020 09:57:45 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41736 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730386AbgB0O5p (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Feb 2020 09:57:45 -0500
Received: by mail-wr1-f66.google.com with SMTP id v4so3714213wrs.8
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Feb 2020 06:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c8UJCHjiQkoyahVk3JVpGT7p90RFMuXW7y1DGNJVn3I=;
        b=byT2rBhaJ3NpZXKQ3xNyKgwH/jTsZDf0x3JScBZse8RZ9ksFtO/1/rzbmUu0CFRSmu
         UdjxqFPEVzG5/nlQN1mO3unL4TpB2ZWZqMmJ1QFXtg0gtHTDJmuH5Mr9BHs1Z27Lz8kL
         uNlFPb6j5UW2b9rOFGC2vB0UPG4BqkPa/9nbKFUK4OLlUK/pY6kMcaGVXtUMgczw0Kp6
         oAm41AQENKBtmKvcKzZCOGkW797Vm6p0Mh+Z9k7y+u3Fd4p0Ai6LFLrNKSdom9zxuj/A
         QU7eFBjQf0U6mgt31hcNhrgdDBHWHjTyZwkPPZmLd1Qrq5BEShppzQjd8edcXAQXb6PS
         SaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c8UJCHjiQkoyahVk3JVpGT7p90RFMuXW7y1DGNJVn3I=;
        b=tZ/yJ7kMdfwhryZpaeopOEFtywwuJu8iz4b8IdGpYoDcDnIq7s+5tYh4XnSpMgCDec
         vFFySqKQO6+E/urZ2mFNVLpzLPlqXY19XbHfHJqlXWCIfUbmp8AfpSB3NVc4dKzuMB6t
         5tqaSmWdTj7DqImS0GS7GiYm4PKMXfF8xc/RdyKX42Q9dTW4QdrdqZJ66f1VuNovfIPb
         MYoBXs0O5TgDQmoD4IjsDWgjskLPthYqGLkdhptv6lFY/1/9D73MUG1JPsTilcFN/opC
         4hdJPEWT78jLOZwW3LfJJdzktpRPs3APTTnr896ezpwmY6t7+1Hw2TQ+cjYbuVpYOmk2
         f4pQ==
X-Gm-Message-State: APjAAAW6YN7XAc6TpklNFSJHonEgdQCDSCcMcat/L7OOsyVUemwd0/Yu
        Rv7j+Q28qWTly2ua9Gy2RLvg+Q==
X-Google-Smtp-Source: APXvYqyyrixRf/9E0uAEum8ogR5+reOoYYP6OuOAEbkyXb2Dh9c2XHojBOJxbwOJHAKTPtAucIdiBw==
X-Received: by 2002:adf:f892:: with SMTP id u18mr5040913wrp.328.1582815463904;
        Thu, 27 Feb 2020 06:57:43 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id h15sm1262654wrr.73.2020.02.27.06.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 06:57:43 -0800 (PST)
Date:   Thu, 27 Feb 2020 14:57:41 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Gyungoh Yoo <jack.yoo@skyworksinc.com>,
        Bryan Wu <cooloney@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][V2] backlight: sky81452: insure while loop does not
 allow negative array indexing
Message-ID: <20200227145741.v3r4qzkfsrwpy33h@holly.lan>
References: <20200226195826.6567-1-colin.king@canonical.com>
 <20200227114623.vaevrdwiduxa2mqs@holly.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227114623.vaevrdwiduxa2mqs@holly.lan>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Feb 27, 2020 at 11:46:23AM +0000, Daniel Thompson wrote:
> On Wed, Feb 26, 2020 at 07:58:26PM +0000, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > In the unlikely event that num_entry is zero, the while loop
> > pre-decrements num_entry to cause negative array indexing into the
> > array sources. Fix this by iterating only if num_entry >= 0.
> > 
> > Addresses-Coverity: ("Out-of-bounds read")
> > Fixes: f705806c9f35 ("backlight: Add support Skyworks SKY81452 backlight driver")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> > 
> > V2: fix typo in commit subject line
> 
> Isn't the correct spelling "ensure"?
> 
> 
> > ---
> >  drivers/video/backlight/sky81452-backlight.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
> > index 2355f00f5773..f456930ce78e 100644
> > --- a/drivers/video/backlight/sky81452-backlight.c
> > +++ b/drivers/video/backlight/sky81452-backlight.c
> > @@ -200,7 +200,7 @@ static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
> >  		}
> >  
> >  		pdata->enable = 0;
> > -		while (--num_entry)
> > +		while (--num_entry >= 0)
> >  			pdata->enable |= (1 << sources[num_entry]);
> 
> This look still looks buggy to me (so I'd second Walter's request to
> change it to a for loop). If the code genuinely does not contain a
> bug then it probably needs a prominent comment explaining why it is
> correct not to honour sources[0]!

Ignore the "still looks buggy". A mental mis-step when switching
contexts...

I think my English is still correct though ;-)


Daniel.
