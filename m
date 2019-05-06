Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB0F14A83
	for <lists+kernel-janitors@lfdr.de>; Mon,  6 May 2019 15:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbfEFNBg (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 6 May 2019 09:01:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:53492 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725886AbfEFNBg (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 6 May 2019 09:01:36 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D69B8AE18;
        Mon,  6 May 2019 13:01:34 +0000 (UTC)
Date:   Mon, 06 May 2019 15:01:34 +0200
Message-ID: <s5h7eb368k1.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     "Dan Carpenter" <dan.carpenter@oracle.com>
Cc:     "Jaroslav Kysela" <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] ALSA: synth: emux: soundfont.c: divide by zero in calc_gus_envelope_time()
In-Reply-To: <20190506125119.GB13799@mwanda>
References: <20190506125119.GB13799@mwanda>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 06 May 2019 14:51:19 +0200,
Dan Carpenter wrote:
> 
> This function is called from load_guspatch() and the rate is specified
> by the user.  If they accidentally selected zero then it would crash the
> kernel.  I've just changed the zero to a one.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied now.


Takashi

> ---
>  sound/synth/emux/soundfont.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/synth/emux/soundfont.c b/sound/synth/emux/soundfont.c
> index 31a4ea94830e..9b5d70104489 100644
> --- a/sound/synth/emux/soundfont.c
> +++ b/sound/synth/emux/soundfont.c
> @@ -856,6 +856,8 @@ calc_gus_envelope_time(int rate, int start, int end)
>  	int r, p, t;
>  	r = (3 - ((rate >> 6) & 3)) * 3;
>  	p = rate & 0x3f;
> +	if (!p)
> +		p = 1;
>  	t = end - start;
>  	if (t < 0) t = -t;
>  	if (13 > r)
> -- 
> 2.18.0
> 
> 
