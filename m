Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 819DB67CB4A
	for <lists+kernel-janitors@lfdr.de>; Thu, 26 Jan 2023 13:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233955AbjAZMxG (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 26 Jan 2023 07:53:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231428AbjAZMxF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Jan 2023 07:53:05 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46DA01632B
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Jan 2023 04:53:03 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id E8F561FF40;
        Thu, 26 Jan 2023 12:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1674737581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fb8sBTQKgZCf6TAxBxFcTinrtnL4nnYNoq4E8lw+Nbo=;
        b=WiCCqTKsTH+tpt0hZChA7TpyjuumFyZTFjVO0Lb6bNHMt5yCgpe8rxSAdL+d8nrooGQGxs
        PaPRJzC0hxe7Xd6tu6VrCt1zIqvl+0Qk7uyU+deTR70pz4JUVD97S9Kg3NIQR7eCzIJBFj
        4cNhQtk9V/vd5hAbdqewmSHhyPKRI/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1674737581;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fb8sBTQKgZCf6TAxBxFcTinrtnL4nnYNoq4E8lw+Nbo=;
        b=o9BVJXQ6VUJR8PrD3TMCo5h0cV70q6rH1UKd4ziNRh3axCVtcGAaXibH+j22p1GVg5aYs8
        DRLa2lWLPLw3mxDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C328A139B3;
        Thu, 26 Jan 2023 12:53:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id b5XrLq130mPfTgAAMHmgww
        (envelope-from <tiwai@suse.de>); Thu, 26 Jan 2023 12:53:01 +0000
Date:   Thu, 26 Jan 2023 13:53:01 +0100
Message-ID: <878rhptq36.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Jaroslav Kysela <perex@perex.cz>,
        Maxime Ripard <mripard@kernel.org>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: pci: lx6464es: fix a debug loop
In-Reply-To: <Y9JIGt0HT8mLkUXF@kili>
References: <Y9JIGt0HT8mLkUXF@kili>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 26 Jan 2023 10:30:02 +0100,
Dan Carpenter wrote:
> 
> This loop accidentally reuses the "i" iterator for both the inside and
> the outside loop.  The value of MAX_STREAM_BUFFER is 5.  I believe that
> chip->rmh.stat_len is in the 2-12 range.  If the value of .stat_len is
> 4 or more then it will loop exactly one time, but if it's less then it
> is a forever loop.
> 
> Fixes: 8e6320064c33 ("ALSA: lx_core: Remove useless #if 0 .. #endif")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  sound/pci/lx6464es/lx_core.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/pci/lx6464es/lx_core.c b/sound/pci/lx6464es/lx_core.c
> index d3f58a3d17fb..7c1b380a54c0 100644
> --- a/sound/pci/lx6464es/lx_core.c
> +++ b/sound/pci/lx6464es/lx_core.c
> @@ -493,13 +493,11 @@ int lx_buffer_ask(struct lx6464es *chip, u32 pipe, int is_capture,
>  		dev_dbg(chip->card->dev,
>  			"CMD_08_ASK_BUFFERS: needed %d, freed %d\n",
>  			    *r_needed, *r_freed);
> -		for (i = 0; i < MAX_STREAM_BUFFER; ++i) {
> -			for (i = 0; i != chip->rmh.stat_len; ++i)
> -				dev_dbg(chip->card->dev,
> -					"  stat[%d]: %x, %x\n", i,
> -					    chip->rmh.stat[i],
> -					    chip->rmh.stat[i] & MASK_DATA_SIZE);
> -		}
> +		for (i = 0; i < chip->rmh.stat_len; ++i)

Judging from the previous lines, the access over MAX_STREAM_BUFFER
might be unsafe.  So I guess a more safer change would be something
like:

		for (i = 0; i < MAX_STREAM_BUFFER && chip->rmh.stat_len; ++i)

Care to resubmit with it?


Thanks!

Takashi
