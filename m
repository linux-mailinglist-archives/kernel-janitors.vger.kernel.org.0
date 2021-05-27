Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDF8392788
	for <lists+kernel-janitors@lfdr.de>; Thu, 27 May 2021 08:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbhE0G2P (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 27 May 2021 02:28:15 -0400
Received: from mx2.suse.de ([195.135.220.15]:60922 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235117AbhE0G1p (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 May 2021 02:27:45 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622096772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EHhBGYAVvr1rmhh8IHHDQcMfJJfDKceXHtgD4YyEFsw=;
        b=cg8UG8PtQRdBxN3WZK3BG9bMokXnE9sJR3XnOnvP9vOlee1t8AdYI85y/xV8iop0tKdeg3
        dZsk+Qlhhc1eGHQl11Ror/RZF6HRxLqK4tSTpxnYMPCey1/aUMIm8ixO6vl826/43hcSwy
        4AFXpB5rvkLbhVVq3oqhhh7jcGLQ+CE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622096772;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EHhBGYAVvr1rmhh8IHHDQcMfJJfDKceXHtgD4YyEFsw=;
        b=Pqq2MrMqAu8QXsNDhDaSRqtuEymPcw8SfcZkOa6L414QCTjKxphxI7s9zbRow/j78bcYUd
        4xnwLHnn39yGQUCQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 22126AAA6;
        Thu, 27 May 2021 06:26:12 +0000 (UTC)
Date:   Thu, 27 May 2021 08:26:12 +0200
Message-ID: <s5hfsy88zgb.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Colin King <colin.king@canonical.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Connor McAdams <conmanx360@gmail.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ALSA: hda/ca0132: Make a const array static, makes object smaller
In-Reply-To: <20210526160616.3764119-1-colin.king@canonical.com>
References: <20210526160616.3764119-1-colin.king@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 26 May 2021 18:06:16 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the const array dsp_dma_stream_ids the stack but instead
> make it static. Makes the object code smaller by 21 bytes.
> 
> Before:
>    text    data     bss     dec     hex filename
>  189012   70376     192  259580   3f5fc ./sound/pci/hda/patch_ca0132.o
> 
> After:
>    text    data     bss     dec     hex filename
>  188927   70440     192  259559   3f5e7 ./sound/pci/hda/patch_ca0132.o
> 
> (gcc version 10.3.0)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied.


Takashi
