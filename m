Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 439B3285FD7
	for <lists+kernel-janitors@lfdr.de>; Wed,  7 Oct 2020 15:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728407AbgJGNLA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 7 Oct 2020 09:11:00 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:45313 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728177AbgJGNK7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Oct 2020 09:10:59 -0400
X-Greylist: delayed 376 seconds by postgrey-1.27 at vger.kernel.org; Wed, 07 Oct 2020 09:10:59 EDT
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id C288DA5C;
        Wed,  7 Oct 2020 09:04:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 07 Oct 2020 09:04:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
         h=date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=n7glPiflw/igCEGVay4K6mUqzzn
        H9kxtNvx6OHbU5es=; b=a65ArENdy/CeOlw4UvlRqGVqCCZVhVlAMKSGJcVZ8M+
        wrkSLeFL+urha0w7KbKand/fZgZA72tosRFJEmF+1CzntW29gKzYJrkpg5/OvFYp
        vb3KqMZ9DwFxKBhoOhf13sqTbJiYZyUVLYYGQhCdBPU0LMcKGr5EkixnK/LpDb8h
        YCHWyvQP+MshMNCJKDuoW8C55+1TlxwJN9F7kfKnGP7uZ7n2wDgl+hdhwhUe576L
        7ieBmyc4CoSoIanH5X7NWStTpcP9Wm7g+LZY9zplafCGbQxJO1PN+f8Wg7ulQRmE
        RmlFH1JqYj7gEZxa9HnSo1OI6Wi3iqnhIE4tZ647qkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=n7glPi
        flw/igCEGVay4K6mUqzznH9kxtNvx6OHbU5es=; b=nKBGInhjO4W2bnuKy9JkTL
        v7RGXrV3W+5QFkiysyCV6uPI3lXBWQ9oCZHUvOA4Qg3+J4Q2TWt6qeKlxewrqyP+
        N79X2DBKXfFttrp+Ux/wbfv580ksZlr8DRVK7s8bswf0nuPL/5UtnnCp6I6a9Pmt
        BsVezJf3O703mH5wQ2px7fGHEZyx0BeB4eixRzTsKWmidvPFbYtenHVXddWaXXia
        GehE6S7Im3m+EIGu+MZ2CyofLYcO4ByLuj2bKPHze1j79hfWk6+QGO3QkojNRwwk
        AX69rYjnQUAPqYrODiibTx6v8Okm4sdbCIazkruISRlYzBCg+S+LyqohrdwiXJiA
        ==
X-ME-Sender: <xms:6bx9X2o5ZAEH-wdzZl4rxwB2QoL5gEHWaLUVeGMc6rHVvnJ7gFxflA>
    <xme:6bx9X0rK78TMotS0OkAtseUUbXH12LW5ikJNBURxFMkPPRU_PkeaEaDsgbLQKrPfX
    CFQQ5zCSbJeWW2OaCI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeeigdeiudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
    ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
    eqnecuggftrfgrthhtvghrnheplefhueegvdejgfejgfdukeefudetvddtuddtueeivedt
    tdegteejkedvfeegfefhnecukfhppedugedrfedrieegrddvtdejnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgr
    khgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:6bx9X7P1b-m0N8T70l8P-BPN-JCjD4QM79KTtakhH8ZO5pTI1mHemg>
    <xmx:6bx9X17bUftLNCoyiZHK4LMGw2z7eGN0neKczCxytkPo_O-wg54DGw>
    <xmx:6bx9X16f3IcN_VO0dHlDi9OglApDwF1OAvF5hq5hHuk-EHMhUtvtlQ>
    <xmx:6rx9X_lj1uyjjmV3iys_6fm8LvxP9XB3yczWDeBfJ5lo3xmOF6n3uQ>
Received: from workstation (ae064207.dynamic.ppp.asahi-net.or.jp [14.3.64.207])
        by mail.messagingengine.com (Postfix) with ESMTPA id DC0BB3280067;
        Wed,  7 Oct 2020 09:04:39 -0400 (EDT)
Date:   Wed, 7 Oct 2020 22:04:37 +0900
From:   Takashi Sakamoto <o-takashi@sakamocchi.jp>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Clemens Ladisch <clemens@ladisch.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: bebob: potential info leak in hwdep_read()
Message-ID: <20201007130437.GA73459@workstation>
Mail-Followup-To: Dan Carpenter <dan.carpenter@oracle.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
References: <20201007074928.GA2529578@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007074928.GA2529578@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

Thanks for the patch.

On Wed, Oct 07, 2020 at 10:49:28AM +0300, Dan Carpenter wrote:
> The "count" variable needs to be capped on every path so that we don't
> copy too much information to the user.
> 
> Fixes: 618eabeae711 ("ALSA: bebob: Add hwdep interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/firewire/bebob/bebob_hwdep.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/firewire/bebob/bebob_hwdep.c b/sound/firewire/bebob/bebob_hwdep.c
> index 45b740f44c45..c362eb38ab90 100644
> --- a/sound/firewire/bebob/bebob_hwdep.c
> +++ b/sound/firewire/bebob/bebob_hwdep.c
> @@ -36,12 +36,11 @@ hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
>  	}
>  
>  	memset(&event, 0, sizeof(event));
> +	count = min_t(long, count, sizeof(event.lock_status));
>  	if (bebob->dev_lock_changed) {
>  		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
>  		event.lock_status.status = (bebob->dev_lock_count > 0);
>  		bebob->dev_lock_changed = false;
> -
> -		count = min_t(long, count, sizeof(event.lock_status));
>  	}
>  
>  	spin_unlock_irq(&bebob->lock);
> -- 
> 2.28.0

Indeed, the bug can leak the contents of kernel memory into user space
unintentionally for the size indicated by ALSA HwDep application...

I will check the other drivers in ALSA firewire stack later for safe.


Thanks

Takashi Sakamoto
