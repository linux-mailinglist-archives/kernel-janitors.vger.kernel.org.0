Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E242861FD
	for <lists+kernel-janitors@lfdr.de>; Wed,  7 Oct 2020 17:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbgJGPXy (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 7 Oct 2020 11:23:54 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:55897 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726100AbgJGPXy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Oct 2020 11:23:54 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 5EB4B3C2;
        Wed,  7 Oct 2020 11:23:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 07 Oct 2020 11:23:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
         h=date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=F3wxxdxDutE2V1vm1ttQwn8wC5g
        kMeHgT4hBmU03O/Q=; b=VAa/OwEdqvTIdivf0jrsmEvL53TgPzC9tydcVxGPJy/
        HR6Zro7SdmI3hONqX83OPjIUyxazK1WLI9Xf3C4XqqMLRl2rwtkgReIV2L1tpTMp
        x7iABAWvYyVT4I49T7mS33Xr/2nLzV6pRKAR5z/IGncPL7HgFiZDEK4Qhp0Abp82
        tEJpy19pV9SeBqIGvskLqNgiqKQBPkG6rHhvXd1hXi5x/hMkrkOxyY7hHJgR/+TT
        tVKr1moFTrUrKOUS/k2+1QR19YXgiDM7LXxpkeuVIkfFeLc0Aw22JqSVYP4R/dVf
        gCK/CoWzwQRviX0ZAshlK8GVCbSQd4VgrIuAP9sp50w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=F3wxxd
        xDutE2V1vm1ttQwn8wC5gkMeHgT4hBmU03O/Q=; b=oG0+tRczAFiU5Gofz/Ue//
        ETkie8mwDx62Eoe1oVaDsGdPcYE83nfoNqbqZAJy8tSAioTzfeZHURp9rnpfvuwF
        QV0JAZ47DvfAgRHU/Xf4YeqKbjUCJ79hQDfwJhdbCWbGOsHt5UQfLQktznXcgAVh
        57OtQDvIsiFc0szOd8N4j92OvcGgNkQpC6W7IcU1jvcLtEqO3bwMSAjRmX6xsbzt
        OFOImyQk/r+tHVRDILyXjB3G0Poj5prp1RiBDVAr7YEQ0phkiITLaF86ly9oM2SU
        goXsubm3kCPL1kziELRJo0BPkuYKF62FdBzib32nmdyUyDZQGdOLGaKznZXpjtqA
        ==
X-ME-Sender: <xms:iN19Xysnm0NXal8kSLPmReoKV2TODKENxE7cvkqe-H7U91paVCYH8w>
    <xme:iN19X3dr2ttvoVNCC6RxZw7djmWpSLZ-eKwbgTrSHRCKlr42zH4yWQUR3gfyttM4j
    A_LjlTh7U4I51QcUGo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeeigdeklecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
    ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
    eqnecuggftrfgrthhtvghrnheplefhueegvdejgfejgfdukeefudetvddtuddtueeivedt
    tdegteejkedvfeegfefhnecukfhppedugedrfedrieegrddvtdejnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgr
    khgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:iN19X9wDoROkDY7AYpUVzQuDCqCHACklGp559g7nACjZ51VMhlJqqA>
    <xmx:iN19X9O4uaB6jL_Ql7GB0KXW6QDaN1eu3x1Qn432ikob3zYQgWu8vQ>
    <xmx:iN19Xy8I6eNVK2P0FZyDHTcrhqfmAns9_sUixAQIfhRZC9N-sr-uiA>
    <xmx:id19X5bNiwxMeKvFLGpj-udYtfwxui9L593R1GDFgRuCwqoAWaFoLg>
Received: from workstation (ae064207.dynamic.ppp.asahi-net.or.jp [14.3.64.207])
        by mail.messagingengine.com (Postfix) with ESMTPA id A817B306467E;
        Wed,  7 Oct 2020 11:23:50 -0400 (EDT)
Date:   Thu, 8 Oct 2020 00:23:48 +0900
From:   Takashi Sakamoto <o-takashi@sakamocchi.jp>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: bebob: potential info leak in hwdep_read()
Message-ID: <20201007152348.GB73459@workstation>
Mail-Followup-To: Dan Carpenter <dan.carpenter@oracle.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
References: <20201007074928.GA2529578@mwanda>
 <20201007130437.GA73459@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007130437.GA73459@workstation>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Oops, I forgot to add my tag to the former message.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

On Wed, Oct 07, 2020 at 10:04:37PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> Thanks for the patch.
> 
> On Wed, Oct 07, 2020 at 10:49:28AM +0300, Dan Carpenter wrote:
> > The "count" variable needs to be capped on every path so that we don't
> > copy too much information to the user.
> > 
> > Fixes: 618eabeae711 ("ALSA: bebob: Add hwdep interface")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  sound/firewire/bebob/bebob_hwdep.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/sound/firewire/bebob/bebob_hwdep.c b/sound/firewire/bebob/bebob_hwdep.c
> > index 45b740f44c45..c362eb38ab90 100644
> > --- a/sound/firewire/bebob/bebob_hwdep.c
> > +++ b/sound/firewire/bebob/bebob_hwdep.c
> > @@ -36,12 +36,11 @@ hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
> >  	}
> >  
> >  	memset(&event, 0, sizeof(event));
> > +	count = min_t(long, count, sizeof(event.lock_status));
> >  	if (bebob->dev_lock_changed) {
> >  		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
> >  		event.lock_status.status = (bebob->dev_lock_count > 0);
> >  		bebob->dev_lock_changed = false;
> > -
> > -		count = min_t(long, count, sizeof(event.lock_status));
> >  	}
> >  
> >  	spin_unlock_irq(&bebob->lock);
> > -- 
> > 2.28.0
> 
> Indeed, the bug can leak the contents of kernel memory into user space
> unintentionally for the size indicated by ALSA HwDep application...
> 
> I will check the other drivers in ALSA firewire stack later for safe.
> 
> 
> Thanks
> 
> Takashi Sakamoto
