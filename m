Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86D453025AC
	for <lists+kernel-janitors@lfdr.de>; Mon, 25 Jan 2021 14:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729038AbhAYNq4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 25 Jan 2021 08:46:56 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:38055 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729059AbhAYNqt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 25 Jan 2021 08:46:49 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 73F90E0E;
        Mon, 25 Jan 2021 08:45:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 25 Jan 2021 08:45:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
         h=date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=jcnbIZnzrAyhZeu+iL5n+9DJk/q
        4Dov63HrOKt1Hkzc=; b=XeBuGdCXGvqdzN20sTHzb18g7T6vxXBRAAzvFKmtrZ3
        f3CKAj0ZsqHSGfEY6YpASd6SpqneUl0Nu7sGi07SjHax6sFBliG5ii90PVAopNRQ
        nap604rcJ+1aWhyuzvauiIP6PhA5yxB4MFIzN616u/SLKUtg7wPHeygyPE3coM2w
        PcB/O3jlWTiXqhW1zQUk0xeSdvNUTmkHqAfGsz3MymLLE/2q/wjwUa69as2JMxs3
        c+SAly97lhDIExFSqwTS2+C0WLhIzOkMs9h/Gvi/6TI9/QjyyNT1GsMj0V3Bf0lh
        tkq2becnDnQgz4w4DrsNjV/GjY4zgv3lGT0/VmLbjWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=jcnbIZ
        nzrAyhZeu+iL5n+9DJk/q4Dov63HrOKt1Hkzc=; b=U9ckwXdK3O1Z3pVS3gmpmN
        hb2tb8S5HbXCck2219KdKgJJtpmwfkpsKFodA9ZPsQ/VA2ow5o/X3EL/7xWqgc/e
        OoRGN85btZSxDjkFL8nMH7u492WWV/wFXCYo560NVotKWLOFfu6fG8jb4AhigJxh
        8QSGcfzFpM6hGoHfm3ZdP2W7J1xXJMkSlToAyCr6kRpyhCejreK9Rfbi3H3XjArH
        oQ1/FsZjXx0w48BeBVTU7AaObibFoMBT2378IudREUubVKdgikESfse/EhcOqVod
        rl4HEQBfZUIDSxX/WbVkL1LhHq0CmdOoZfVBEz+mdRtF43Y+FhII941iXIdo8ZLg
        ==
X-ME-Sender: <xms:hssOYHaDl5NfKknW7yVDUfGdBDuSZ_jcky6JUR9N-0m9hFNjprMqxA>
    <xme:hssOYGYZXcRKF2_TwmGAVcfSk2uTUsX_FGuzcDSJDCB3UlyCbOM_aSbGQS9d4tkl-
    A0ltqAQyXNeBLJpLjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgdehfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
    ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
    eqnecuggftrfgrthhtvghrnheplefhueegvdejgfejgfdukeefudetvddtuddtueeivedt
    tdegteejkedvfeegfefhnecukfhppeduudekrddvgeefrdejkedrheeknecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihes
    shgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:hssOYJ_M3RXgcOuAEszXQSGNW-aTzsmMLmQt90zTtPnjOKv6oJF0fA>
    <xmx:hssOYNplvl5T9OWb8VHMtskmN5_7dP3kr4CfZMQca6yGGw0bvgQfRg>
    <xmx:hssOYCr-zpPFJ_XZfyhKxzxXEup7hY-jV8L1kXhxvLbgrhEfIuifEg>
    <xmx:iMsOYPAPesa0_9K0BsVsAq-a01WISHHfIBoSSBVWkuxj3f2Qn_yH0g>
Received: from workstation (y078058.dynamic.ppp.asahi-net.or.jp [118.243.78.58])
        by mail.messagingengine.com (Postfix) with ESMTPA id D4BFC1080063;
        Mon, 25 Jan 2021 08:45:40 -0500 (EST)
Date:   Mon, 25 Jan 2021 22:45:38 +0900
From:   Takashi Sakamoto <o-takashi@sakamocchi.jp>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Clemens Ladisch <clemens@ladisch.de>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ALSA: fireface: remove unnecessary condition in
 hwdep_read()
Message-ID: <20210125134538.GA24062@workstation>
Mail-Followup-To: Dan Carpenter <dan.carpenter@oracle.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
References: <20210122071354.GI20820@kadam>
 <YA6n6I8EcNAO5ZFs@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YA6n6I8EcNAO5ZFs@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On Mon, Jan 25, 2021 at 02:13:44PM +0300, Dan Carpenter wrote:
> Smatch complains that "count" is not clamped when "ff->dev_lock_changed"
> and it leads to an information leak.  Fortunately, that's not actually
> possible and the condition can be deleted.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: just delet the condition
> 
>  sound/firewire/fireface/ff-hwdep.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

ALSA firewire stack includes some drivers. Although some of them implement
unique event as well as the lock event, the others supports the lock
event only. The condition statement comes from the former, I guess.
ALSA BeBoB, OXFW, and Fireface drivers are the latter. Later I'll post
the similar patch for ALSA BeBoB driver.

Anyway, thank you to find the issue ;)

> diff --git a/sound/firewire/fireface/ff-hwdep.c b/sound/firewire/fireface/ff-hwdep.c
> index 4b2e0dff5ddb..ea64a2a41eea 100644
> --- a/sound/firewire/fireface/ff-hwdep.c
> +++ b/sound/firewire/fireface/ff-hwdep.c
> @@ -35,13 +35,11 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
>  	}
>  
>  	memset(&event, 0, sizeof(event));
> -	if (ff->dev_lock_changed) {
> -		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
> -		event.lock_status.status = (ff->dev_lock_count > 0);
> -		ff->dev_lock_changed = false;
> +	event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
> +	event.lock_status.status = (ff->dev_lock_count > 0);
> +	ff->dev_lock_changed = false;
>  
> -		count = min_t(long, count, sizeof(event.lock_status));
> -	}
> +	count = min_t(long, count, sizeof(event.lock_status));
>  
>  	spin_unlock_irq(&ff->lock);
>  
> -- 
> 2.29.2
 
Thanks

Takashi Sakamoto
