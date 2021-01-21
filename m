Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A502FF636
	for <lists+kernel-janitors@lfdr.de>; Thu, 21 Jan 2021 21:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbhAUUnu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 21 Jan 2021 15:43:50 -0500
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:53815 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727220AbhAUUns (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 21 Jan 2021 15:43:48 -0500
Received: from [192.168.1.41] ([92.131.99.25])
        by mwinf5d31 with ME
        id KYi4240010Ys01Y03Yi4JV; Thu, 21 Jan 2021 21:42:06 +0100
X-ME-Helo: [192.168.1.41]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 21 Jan 2021 21:42:06 +0100
X-ME-IP: 92.131.99.25
Subject: Re: [PATCH] ALSA: fireface: fix info leak in hwdep_read()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Clemens Ladisch <clemens@ladisch.de>
Cc:     alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
        Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
References: <YAka5xudQNQgRkuC@mwanda>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <3ef5f7f4-efeb-8a92-1886-d92e14211287@wanadoo.fr>
Date:   Thu, 21 Jan 2021 21:42:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YAka5xudQNQgRkuC@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

Le 21/01/2021 à 07:10, Dan Carpenter a écrit :
> If "ff->dev_lock_changed" has not changed

According to the "while (!ff->dev_lock_changed) { ... }" just above and 
the lock in place, can this ever happen?

In other word, I wonder if the "if (ff->dev_lock_changed)" test makes 
sense and if it could be removed.


(same for your other patch against sound/firewire/oxfw/oxfw-hwdep.c)

CJ


> and "count" is too large then
> this will copy data beyond the end of the struct to user space.
> 
> Fixes: f656edd5fb33 ("ALSA: fireface: add hwdep interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   sound/firewire/fireface/ff-hwdep.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/firewire/fireface/ff-hwdep.c b/sound/firewire/fireface/ff-hwdep.c
> index 4b2e0dff5ddb..b84dde609a03 100644
> --- a/sound/firewire/fireface/ff-hwdep.c
> +++ b/sound/firewire/fireface/ff-hwdep.c
> @@ -35,12 +35,12 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
>   	}
>   
>   	memset(&event, 0, sizeof(event));
> +	count = min_t(long, count, sizeof(event.lock_status));
>   	if (ff->dev_lock_changed) {
>   		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
>   		event.lock_status.status = (ff->dev_lock_count > 0);
>   		ff->dev_lock_changed = false;
>   
> -		count = min_t(long, count, sizeof(event.lock_status));
>   	}
>   
>   	spin_unlock_irq(&ff->lock);
> 

