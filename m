Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9CF2910AA
	for <lists+kernel-janitors@lfdr.de>; Sat, 17 Oct 2020 10:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437602AbgJQIFg (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 17 Oct 2020 04:05:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:36540 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437597AbgJQIFg (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 17 Oct 2020 04:05:36 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3739AACDB;
        Sat, 17 Oct 2020 08:05:34 +0000 (UTC)
Date:   Sat, 17 Oct 2020 10:05:34 +0200
Message-ID: <s5hzh4ll1kh.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Colin King <colin.king@canonical.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Connor McAdams <conmanx360@gmail.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/ca0132: make some const arrays static, makes object smaller
In-Reply-To: <20201016224913.687724-1-colin.king@canonical.com>
References: <20201016224913.687724-1-colin.king@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 17 Oct 2020 00:49:13 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate const arrays on the stack but instead make them
> static. Makes the object code smaller by 57 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>  173256	  38016	    192	 211464	  33a08	sound/pci/hda/patch_ca0132.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>  172879	  38336	    192	 211407	  339cf	sound/pci/hda/patch_ca0132.o
> 
> (gcc version 10.2.0)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied.


Takashi
