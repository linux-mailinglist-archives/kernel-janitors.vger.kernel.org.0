Return-Path: <kernel-janitors+bounces-652-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD10980C9C8
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 Dec 2023 13:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6885F281F05
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 Dec 2023 12:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4473E3B78F;
	Mon, 11 Dec 2023 12:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="uSQ9GuT9";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="WlYGjskX";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="OOJzuaHa";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="6WZ11VbI"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F540101;
	Mon, 11 Dec 2023 04:30:20 -0800 (PST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E42451FB8A;
	Mon, 11 Dec 2023 12:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1702297818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pV78XzILgikwq9fxdiYEdF0PF3nysXH8O8vZMrG/+P0=;
	b=uSQ9GuT9OV1qMWqEr5Jk27bRTbNJDxoDrmDMomPeMkSB1ToLPUvYnyC6oPxYKT54MrY2dR
	hPbblSXwWVc0TueJtj8S5dGOqAaEO2m71ZEEdyMscQfKxTSWBwj4AMBLNWEKnNoI8Vi1X6
	CHBJdr/ZXUsVEzPghOVVFCBYMgWUcrU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1702297818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pV78XzILgikwq9fxdiYEdF0PF3nysXH8O8vZMrG/+P0=;
	b=WlYGjskXnZHv3rmOSP3P0ZFcW4lu/7dwcr5k3rbnObRvPZIU5Lb4XIana9QVf3fzWGwk6/
	85YuEvPNPngoazDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1702297816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pV78XzILgikwq9fxdiYEdF0PF3nysXH8O8vZMrG/+P0=;
	b=OOJzuaHayNm/cjYIFgcNZ80dtLxJDbDCGQQDrBesaDeeSTf22pOlILv4AgScPwQRP4i0yl
	vgu0k9Y8VdVmybHYQjhksmmamBKkGvu1c0qc4haS/jVBmFgWHf15FafzJdpX3Df+REzAQ4
	BAiZzQOKK6cdGzsdaf9j+a5WliDyu7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1702297816;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pV78XzILgikwq9fxdiYEdF0PF3nysXH8O8vZMrG/+P0=;
	b=6WZ11VbIXreZyDmns+xURE6vpolRTcYuydR0ADViB4/g+Lp76JGdz0+yVfvfJXR/S6AVWU
	DveKn1TQD9/20LAQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id D102A138FF;
	Mon, 11 Dec 2023 12:30:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id n9WxMtgAd2XlRQAAn2gu4w
	(envelope-from <jack@suse.cz>); Mon, 11 Dec 2023 12:30:16 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 765A2A07E3; Mon, 11 Dec 2023 13:30:12 +0100 (CET)
Date: Mon, 11 Dec 2023 13:30:12 +0100
From: Jan Kara <jack@suse.cz>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] eventfd: Remove usage of the deprecated ida_simple_xx()
 API
Message-ID: <20231211123012.mrxfakg2wxdlsthb@quack3>
References: <575dcecd51097dd30c5515f9f0ed92076b4ef403.1702229520.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <575dcecd51097dd30c5515f9f0ed92076b4ef403.1702229520.git.christophe.jaillet@wanadoo.fr>
X-Spam-Level: 
X-Spam-Score: -0.93
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.93
X-Spamd-Result: default: False [-0.93 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[wanadoo.fr];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FREEMAIL_TO(0.00)[wanadoo.fr];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_NOT_FQDN(0.50)[];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.13)[67.30%]
X-Spam-Flag: NO

On Sun 10-12-23 18:32:18, Christophe JAILLET wrote:
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
> 
> This is less verbose.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/eventfd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/eventfd.c b/fs/eventfd.c
> index 16bea05a7c78..ad8186d47ba7 100644
> --- a/fs/eventfd.c
> +++ b/fs/eventfd.c
> @@ -82,7 +82,7 @@ EXPORT_SYMBOL_GPL(eventfd_signal_mask);
>  static void eventfd_free_ctx(struct eventfd_ctx *ctx)
>  {
>  	if (ctx->id >= 0)
> -		ida_simple_remove(&eventfd_ida, ctx->id);
> +		ida_free(&eventfd_ida, ctx->id);
>  	kfree(ctx);
>  }
>  
> @@ -395,7 +395,7 @@ static int do_eventfd(unsigned int count, int flags)
>  	init_waitqueue_head(&ctx->wqh);
>  	ctx->count = count;
>  	ctx->flags = flags;
> -	ctx->id = ida_simple_get(&eventfd_ida, 0, 0, GFP_KERNEL);
> +	ctx->id = ida_alloc(&eventfd_ida, GFP_KERNEL);
>  
>  	flags &= EFD_SHARED_FCNTL_FLAGS;
>  	flags |= O_RDWR;
> -- 
> 2.34.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

