Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39B792E9B86
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 Jan 2021 18:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbhADRAf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 4 Jan 2021 12:00:35 -0500
Received: from mx2.suse.de ([195.135.220.15]:44046 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727792AbhADRAf (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 4 Jan 2021 12:00:35 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 62BAEAA35;
        Mon,  4 Jan 2021 16:59:53 +0000 (UTC)
Date:   Mon, 04 Jan 2021 17:59:53 +0100
Message-ID: <s5hturw7i46.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Joe Perches <joe@perches.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH] sound: Convert strlcpy to strscpy when return value is unused
In-Reply-To: <58a84d03b714f71d231f9cac04af09a6b97c6f04.camel@perches.com>
References: <58a84d03b714f71d231f9cac04af09a6b97c6f04.camel@perches.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 31 Dec 2020 20:04:50 +0100,
Joe Perches wrote:
> 
> strlcpy is deprecated.  see: Documentation/process/deprecated.rst
> 
> Change the calls that do not use the strlcpy return value to the
> preferred strscpy.
> 
> Done with cocci script:
> 
> @@
> expression e1, e2, e3;
> @@
> 
> -	strlcpy(
> +	strscpy(
> 	e1, e2, e3);
> 
> This cocci script leaves the instances where the return value is
> used unchanged.
> 
> After this patch, sound/ has 3 uses of strlcpy() that need to be
> manually inspected for conversion and changed one day.
> 
> $ git grep -w strlcpy sound/
> sound/usb/card.c:               len = strlcpy(card->longname, s, sizeof(card->longname));
> sound/usb/mixer.c:      return strlcpy(buf, p->name, buflen);
> sound/usb/mixer.c:                      return strlcpy(buf, p->names[index], buflen);
> 
> Miscellenea:
> 
> o Remove trailing whitespace in conversion of sound/core/hwdep.c
> 
> Link: https://lore.kernel.org/lkml/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Could you resubmit to alsa-devel ML?


thanks,

Takashi
