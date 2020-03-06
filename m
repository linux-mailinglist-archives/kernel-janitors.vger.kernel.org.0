Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C507717BA83
	for <lists+kernel-janitors@lfdr.de>; Fri,  6 Mar 2020 11:40:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbgCFKjv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 6 Mar 2020 05:39:51 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53790 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbgCFKju (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 Mar 2020 05:39:50 -0500
Received: by mail-wm1-f68.google.com with SMTP id g134so1814270wme.3
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Mar 2020 02:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rCwwPNd2pA0INB2HwJkp3rqo1usGcNxwzdg6ma8wOKI=;
        b=eTHhCcEclE09OQebKxTAtBcuem6YrVVfqc6wr7gzch/KOv9hjBwMrETehU/oSBUFjX
         l9RbDlri1cZqI8jE26fig1J/BgoL9F/ihHJocP8/UCnDCvgi1xfAqPrfmg0Ceb7WmzQm
         aWZ7/H0OldRYsjAGDfwM90Gf9q8iHvafGPsVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=rCwwPNd2pA0INB2HwJkp3rqo1usGcNxwzdg6ma8wOKI=;
        b=h6TSOxdFU29wdccGWH9+6PQxzcOviOJfimlTwOzm6WSsSiEbDLqjyznaTCGNFekCfA
         oMu2kSgjrCktNYilfrk56xFERdKL48NB4pxIUDoQxs0kbIFR59YHh9SEhvABbACSYmpu
         OhB9PHue6CTbRhotZpmJP55HsFZKzZwwA7HYU3Lxqv2A5/q9gY/aREGvlRiOKAU2hg8w
         tj9SkO6qJh1bOAPml6eMNRQ6GRcDyGSKYDcYdoC4y33rtcI9atmgVGIEKC5aRny4/p19
         lWWayNajJnnKkp4Hf98C8gybOfWbaDQyAu5S+A5RhT+m5OjKZyw15ft88mtM3cB+9STv
         W2+A==
X-Gm-Message-State: ANhLgQ3fzK5yaKbI1Xi+grb4XI9t3ucimlKheOYPETgVwwgCOsiPX27s
        c4zqKyIC8TZ7ekGjvVDCkOXRiw==
X-Google-Smtp-Source: ADFU+vsoxbiLn65abeK+CoaJTkFH/7IMTTkUgAtZxrezRu/238vSq4AIzpYtowBToyIoT+aRz7bdHg==
X-Received: by 2002:a7b:c756:: with SMTP id w22mr3356418wmk.90.1583491188842;
        Fri, 06 Mar 2020 02:39:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a184sm13066027wmf.29.2020.03.06.02.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 02:39:48 -0800 (PST)
Date:   Fri, 6 Mar 2020 11:39:46 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Joe Perches <joe@perches.com>,
        Sebastian Duda <sebastian.duda@fau.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH] MAINTAINERS: adjust to reservation.h renaming
Message-ID: <20200306103946.GT2363188@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Joe Perches <joe@perches.com>,
        Sebastian Duda <sebastian.duda@fau.de>,
        Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
References: <20200304120711.12117-1-lukas.bulwahn@gmail.com>
 <b0296e3a-31f8-635a-f26d-8b0bc490aae3@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0296e3a-31f8-635a-f26d-8b0bc490aae3@amd.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Mar 04, 2020 at 01:08:32PM +0100, Christian K�nig wrote:
> Am 04.03.20 um 13:07 schrieb Lukas Bulwahn:
> > Commit 52791eeec1d9 ("dma-buf: rename reservation_object to dma_resv")
> > renamed include/linux/reservation.h to include/linux/dma-resv.h, but
> > missed the reference in the MAINTAINERS entry.
> > 
> > Since then, ./scripts/get_maintainer.pl --self-test complains:
> > 
> >    warning: no file matches F: include/linux/reservation.h
> > 
> > Adjust the DMA BUFFER SHARING FRAMEWORK entry in MAINTAINERS.
> > 
> > Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
> > Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> 
> Reviewed-by: Christian K�nig <christian.koenig@amd.com>

You'll push this too?
-Daniel

> 
> > ---
> > Christian, please pick this patch.
> > applies cleanly on current master and next-20200303
> > 
> >   MAINTAINERS | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 6158a143a13e..3d6cb2789c9e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5022,7 +5022,7 @@ L:	dri-devel@lists.freedesktop.org
> >   L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
> >   F:	drivers/dma-buf/
> >   F:	include/linux/dma-buf*
> > -F:	include/linux/reservation.h
> > +F:	include/linux/dma-resv.h
> >   F:	include/linux/*fence.h
> >   F:	Documentation/driver-api/dma-buf.rst
> >   K:	dma_(buf|fence|resv)
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
