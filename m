Return-Path: <kernel-janitors+bounces-9467-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B23BFA4BA
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Oct 2025 08:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCAA33B0E98
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Oct 2025 06:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5176D2F1FEE;
	Wed, 22 Oct 2025 06:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="X3OKn4gO";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="+MhIWEiY";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="JXrJKhnP";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="v+x/oVuc"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1667B248F77
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 06:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761115585; cv=none; b=f1bbYHwdedJAiMw60toMJvLTC8zA3IHI1L0wrS7bKht91xhIboIALdJIrPJRNeYZkVaQUcmNMBk3XYQ79f7b0G9xDSEkw85ass61Pr48HFspBEuU78BRb4NfShfCqbjPqwJUOwxq2wzN7PhDVdlJNBQu9XdksZ50nH8r/NAun88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761115585; c=relaxed/simple;
	bh=rT5j7DnsGzynQjycM8WKWJ0+OE5t5mDOHwur2zBv0nM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jZi0uET2bTkbwenV5lZGy2K1yVqBC3KLcDaTJ0uA7sIVaDSy3yPPxnhZqIZeOh0woJj+v06sq0pilIsDuhSAH5QVYucA0AONcqCRRVNW/sbNLFrZ2z+XL/EWfsPkzlVvxEN4G4Ns7lbVl4W55wimhX1aWQAzWjNoKTcaTGGtcbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=X3OKn4gO; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=+MhIWEiY; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=JXrJKhnP; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=v+x/oVuc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 235021F395;
	Wed, 22 Oct 2025 06:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1761115577;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vqYeam+WpGDQVVYjfdzIBNySwYmnxi/sx15/t/lWV1M=;
	b=X3OKn4gOZ3ISif8hjVyqpDNuXBgsqKW9heLlttJCNbYny07w0r7nlsO3Taf/touPBMm7fx
	V0412//Mmn4W/hhalTLH+WSPSJ20dH/ThLwkCXg4La/f+6gMuEebIjtP8XRguVFZUfiDX4
	mJ68UIXIVZ+EMMiZ7bVTv2/qtg15YVM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1761115577;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vqYeam+WpGDQVVYjfdzIBNySwYmnxi/sx15/t/lWV1M=;
	b=+MhIWEiYH3TD5x01VCQgWcfA/CI5RJFBms0lkgsgLf6Ub3Nm5iE4VIR41pAt0IJgXb73eI
	4LDb2lL7j50BevBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1761115573;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vqYeam+WpGDQVVYjfdzIBNySwYmnxi/sx15/t/lWV1M=;
	b=JXrJKhnPSZPKHW6UD9A+cvhTqvb6B1wNPCqudHAfZ9pcHM54tQsXjjMENzVl+z9oLhV6fc
	/DJyDnfucOF99uIbQOXbShHpJJYc8zVcqJcJ8pRtqmTc6SINfZj3lMPs5LAuENVxJcez3l
	/y9gss+0mTDs2OgMfV8Hg3UbH3p1eMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1761115573;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vqYeam+WpGDQVVYjfdzIBNySwYmnxi/sx15/t/lWV1M=;
	b=v+x/oVucXMXc8wnsAOerd6bCAEL+76cWXgxEvCUa6vP+ZIJLCLiFJdpz8cfuOYxhXCeLvy
	1cMdok+fu2GCOdDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 07A9013A29;
	Wed, 22 Oct 2025 06:46:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RRO0AbV9+GjPawAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Wed, 22 Oct 2025 06:46:13 +0000
Date: Wed, 22 Oct 2025 08:46:07 +0200
From: David Sterba <dsterba@suse.cz>
To: Amit Dhingra <mechanicalamit@gmail.com>
Cc: Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
	linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org,
	dan.carpenter@linaro.org
Subject: Re: [PATCH] fix IS_ERR() vs NULL Check in btrfs_build_ref_tree()
Message-ID: <20251022064607.GU13776@twin.jikos.cz>
Reply-To: dsterba@suse.cz
References: <CAO=gReGBaUiodShe-Dmir=XVkjOoP0rdvx=BGP79URrZOOmNyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO=gReGBaUiodShe-Dmir=XVkjOoP0rdvx=BGP79URrZOOmNyA@mail.gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00

On Tue, Oct 21, 2025 at 07:07:20AM -0500, Amit Dhingra wrote:
> btrfs_extent_root()/btrfs_global_root() does not return error pointers,
> it returns NULL on error.
> 
> Fixes : ed4e6b5d644c ("btrfs: ref-verify: handle damaged extent root tree")
> Signed-off-by: Amit Dhingra <mechanicalamit@gmail.com>
> ---
> Compile tested only

Thanks. This was also reported by Dan Carpenter in
https://lore.kernel.org/all/aNJfvxj0anEnk9Dm@stanley.mountain/
but there was no fixup done. I'll add Reported-by.

