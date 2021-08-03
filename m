Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7ACE3DEFB1
	for <lists+kernel-janitors@lfdr.de>; Tue,  3 Aug 2021 16:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236406AbhHCOF4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 3 Aug 2021 10:05:56 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:47400 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236045AbhHCOFz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 3 Aug 2021 10:05:55 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 843672003F;
        Tue,  3 Aug 2021 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1627999543; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KB9J6Yc/9eRj2qPkgvDqfREMnT7BDt/roGrjEKRDPyo=;
        b=Ns3csEQPJq7kDx9y1hp638rKj5iQdiKUKbipvtGsXi36DTY9Tng7AXFNNNPKqIPOmcY7Rg
        EmVjOd4BIHw7jgUXhh8bfwHE0V4p/icnEcpwqTgdsDLEfRoh9zPUaU+MtLFLl43EnFd3Z0
        owU2CtFhF+if90FpT6QCV5l/aWBvRLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1627999543;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KB9J6Yc/9eRj2qPkgvDqfREMnT7BDt/roGrjEKRDPyo=;
        b=+pFfeUa+Ix2NTtlc4wifs7o18heExOFldNIRWWN0dQplxACrjpjzhHdQKI2ghVAFTsHJzk
        6cdoYIMxiQbcj4BA==
Received: from alsa1.suse.de (alsa1.suse.de [10.160.4.42])
        by relay2.suse.de (Postfix) with ESMTP id 72B92A3BD1;
        Tue,  3 Aug 2021 14:05:43 +0000 (UTC)
Date:   Tue, 03 Aug 2021 16:05:43 +0200
Message-ID: <s5hmtpyvd1k.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Colin King <colin.king@canonical.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][V2] ALSA: usb-audio: make array static const, makes object smaller
In-Reply-To: <20210803122839.7143-1-colin.king@canonical.com>
References: <20210803122839.7143-1-colin.king@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 03 Aug 2021 14:28:39 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate array names_to_check on the stack but instead it
> static.  Makes the object code smaller by 56 bytes.  Also clean
> up checkpatch warning by adding extra const for names_to_check
> and pointer s.
> 
> Before:
>     text    data     bss     dec     hex filename
>   103512   34380       0  137892   21aa4 ./sound/usb/mixer.o
> 
> After:
>     text    data     bss     dec     hex filename
>   103264   34572       0  137836   21a6c ./sound/usb/mixer.o
> 
> (gcc version 10.2.0)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: Clean up checkpatch warning on const-ness for names_to_check.
>     Add extra const to clean up build warning on pointer s.

Thanks, applied.


Takashi
