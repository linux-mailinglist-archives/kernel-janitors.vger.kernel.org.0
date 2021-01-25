Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76443303249
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Jan 2021 03:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbhAYNsB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 25 Jan 2021 08:48:01 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:56173 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729049AbhAYNrP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 25 Jan 2021 08:47:15 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id BE052435;
        Mon, 25 Jan 2021 08:46:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 25 Jan 2021 08:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
         h=date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=1Ha0tktpMEKttzSr9glvEkciUZQ
        pZiSo3EjsiTx+JQg=; b=Y166K2kfU+bHQBFreM/BQQbuoaS1AgEgbnyG8Lo3Uz1
        ZCw/ezjrtLgWDuLKz7BtDWLEBaXcWwnNizY6HtKNwdc8Cp5L9qn3N8ojrdND8l1n
        p82IiQb0nKc89YWQ7lsl8mvMojENvVvLzOVRaBrKK/Q5JPERHcVgbj5IffMKj1pg
        gY4Cfn8H55SAu6qH5PYpCLd3D0VivYTnbVMEgnGB4o0MzvMgtlVgR2CZDvvxxSQR
        x0MFBc7b6QFxO1Hl7mv0xl9qMHDA+i7OylwwBOCS88ISsCE+awM5U0TpsTktFTn6
        MbLVLejMxkrbhKPL0aguFsb9OINHZ0F6hUqdN7RCI0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=1Ha0tk
        tpMEKttzSr9glvEkciUZQpZiSo3EjsiTx+JQg=; b=qFQuYgnCShr3aJJvjf6KSV
        KVHZq9ssqIQeB+7eDyAaTh9uXWD042fACW9S9JMWsnx1RydotlQGtRAa4Keew/J4
        5k7/UyBvrwEXPXHil9TFIFHlGmqo1XEHoNjY9EO4nv5Q395aa2dus4d3VwLoQfWf
        PSIq1OsXg9YJVub4BtXK8ZF+F6yJTD5egkZhnNNd/I5+bjXr7w+bQfXGsXSWi9r2
        EAHGWl3R7QC3kNeDWKIRze9BfQjWOfQDjiUPR2yVuIR5saj+IVHG5Kp4tA9N2l5p
        BBmopclTOHyURHolr7Q+RU8pfoa8xCgv0ZbYDahTKf2oqz34SsrI49o/1FibdPUA
        ==
X-ME-Sender: <xms:s8sOYOs6RsN-_osZ8IdTk4SRoF7DRWbH6iO56G-c7LY4VXRKignBOg>
    <xme:s8sOYDdUcKA3xrQSUN0XFcc2AhYNUvJhEHkT9R5EjqxYvG5t8Wk9hpezT4hGZN1Mc
    ypcommEVSwP8fn4PQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgdehfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
    ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
    eqnecuggftrfgrthhtvghrnheplefhueegvdejgfejgfdukeefudetvddtuddtueeivedt
    tdegteejkedvfeegfefhnecukfhppeduudekrddvgeefrdejkedrheeknecuvehluhhsth
    gvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihes
    shgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:s8sOYJydkYdV8IPdxbUQIBEfmDAacvDP19i2Iqu5Qw9bPgSfKgi-Fw>
    <xmx:s8sOYJOvTWWePPXNm0YSr-ffcBVgEmmGn9xG-V2Pg6jOIMuypFrdRQ>
    <xmx:s8sOYO-XmX9w2Tl0XGw40mr8of7u5mdiUUt6rMqdsZ6fJLDor_LRWg>
    <xmx:tMsOYFl8RQyBGhvsiyF2LU6TVlQUjqsJhsmOl48H8vra3Xm5TvDPIQ>
Received: from workstation (y078058.dynamic.ppp.asahi-net.or.jp [118.243.78.58])
        by mail.messagingengine.com (Postfix) with ESMTPA id 89A44240057;
        Mon, 25 Jan 2021 08:46:25 -0500 (EST)
Date:   Mon, 25 Jan 2021 22:46:23 +0900
From:   Takashi Sakamoto <o-takashi@sakamocchi.jp>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Clemens Ladisch <clemens@ladisch.de>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ALSA: oxfw: remove an unnecessary condition in
 hwdep_read()
Message-ID: <20210125134623.GB24062@workstation>
Mail-Followup-To: Dan Carpenter <dan.carpenter@oracle.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
References: <20210122071354.GI20820@kadam>
 <YA6ntkBxT/4DJ4YK@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YA6ntkBxT/4DJ4YK@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jan 25, 2021 at 02:12:54PM +0300, Dan Carpenter wrote:
> Smatch complains that "count" isn't clamped properly and
> "oxfw->dev_lock_changed" is false then it leads to an information
> leak.  But it turns out that "oxfw->dev_lock_changed" is always
> set and the condition can be removed.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: this version just removes the condition
> 
>  sound/firewire/oxfw/oxfw-hwdep.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
 
Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp> 

> diff --git a/sound/firewire/oxfw/oxfw-hwdep.c b/sound/firewire/oxfw/oxfw-hwdep.c
> index 9e1b3e151bad..a0fe99618554 100644
> --- a/sound/firewire/oxfw/oxfw-hwdep.c
> +++ b/sound/firewire/oxfw/oxfw-hwdep.c
> @@ -35,13 +35,11 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
>  	}
>  
>  	memset(&event, 0, sizeof(event));
> -	if (oxfw->dev_lock_changed) {
> -		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
> -		event.lock_status.status = (oxfw->dev_lock_count > 0);
> -		oxfw->dev_lock_changed = false;
> +	event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
> +	event.lock_status.status = (oxfw->dev_lock_count > 0);
> +	oxfw->dev_lock_changed = false;
>  
> -		count = min_t(long, count, sizeof(event.lock_status));
> -	}
> +	count = min_t(long, count, sizeof(event.lock_status));
>  
>  	spin_unlock_irq(&oxfw->lock);
>  
> -- 
> 2.29.2

Regards

Takashi Sakamoto
