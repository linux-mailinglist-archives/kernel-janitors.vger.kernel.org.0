Return-Path: <kernel-janitors+bounces-8334-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EE9AE5EC9
	for <lists+kernel-janitors@lfdr.de>; Tue, 24 Jun 2025 10:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F5C717F6F7
	for <lists+kernel-janitors@lfdr.de>; Tue, 24 Jun 2025 08:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0521256C7C;
	Tue, 24 Jun 2025 08:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0rsoSxPP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5Jy3CgFn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0rsoSxPP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5Jy3CgFn"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563E525394B
	for <kernel-janitors@vger.kernel.org>; Tue, 24 Jun 2025 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750752684; cv=none; b=kEc8spgHt/3GnsByx1xGTIctP8Eb1LvWZsrBuHxVhEXdxYX+iu3dgWOtflgR90I7FEkaucSTMFdWdCvhRC6XnAqPl2qrX3UR+rH4m1vVnTUI2Cj0NRRoN9ayz4y1riX0XEMYpA6mF9jNaADgN4pQ9v1giiKV2tyjQs0iRkvLAyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750752684; c=relaxed/simple;
	bh=CDbw7JAaAd0HXAZdAzS1WL4b7LmL8Bi0ELx/uNpOvPw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M64+iUA7KNaoGI3EpTXaWEXhLfwUg/r3B+VK/WTLjUdlSN7IXOM1Rfbn6iOTiMfX+8orxWy/8uJpPPRFQrESIK4D7EBBu86zpRZs9JT34rL8wRXXEDpUx38NwZoa8C9l5g00H/g1GYKWcFklR7Qydg2yn2/A8cQLUfjghUTv27s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0rsoSxPP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5Jy3CgFn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0rsoSxPP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5Jy3CgFn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4607821192;
	Tue, 24 Jun 2025 08:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750752675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5AdF4xuhAt3rJskHFdIpyRXilGik+8sjAdWXfveamwc=;
	b=0rsoSxPPF5+T29CdDMXTf2aVNXsBpGvNBOxKPl6Ys+tabRkwkmtOFC0H2BYQyKQark52cj
	71nHi5hszJx87fDEFAs1CfGHxz3IXIXpl5F+qf/3T22/nFbi+KtAfxkeQvN7ATDYQ1SyO/
	zJaASk7Cilded/yUtLMcXDyPJ7IgSRk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750752675;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5AdF4xuhAt3rJskHFdIpyRXilGik+8sjAdWXfveamwc=;
	b=5Jy3CgFn6f+Bepqw7iYvUEsNJ+Jiaov8+uq6eZlPqOt1HHtj2jVUMAgQUWl/+K2kc/9yk3
	wQPhzG4aQiWkJ8Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750752675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5AdF4xuhAt3rJskHFdIpyRXilGik+8sjAdWXfveamwc=;
	b=0rsoSxPPF5+T29CdDMXTf2aVNXsBpGvNBOxKPl6Ys+tabRkwkmtOFC0H2BYQyKQark52cj
	71nHi5hszJx87fDEFAs1CfGHxz3IXIXpl5F+qf/3T22/nFbi+KtAfxkeQvN7ATDYQ1SyO/
	zJaASk7Cilded/yUtLMcXDyPJ7IgSRk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750752675;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5AdF4xuhAt3rJskHFdIpyRXilGik+8sjAdWXfveamwc=;
	b=5Jy3CgFn6f+Bepqw7iYvUEsNJ+Jiaov8+uq6eZlPqOt1HHtj2jVUMAgQUWl/+K2kc/9yk3
	wQPhzG4aQiWkJ8Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E5AB013751;
	Tue, 24 Jun 2025 08:11:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6JHaNqJdWmgaBAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 24 Jun 2025 08:11:14 +0000
Date: Tue, 24 Jun 2025 10:11:14 +0200
Message-ID: <87sejplftp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Mark Brown <broonie@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH] ALSA: qc_audio_offload: Fix missing error code in prepare_qmi_response()
In-Reply-To: <20250623142639.2938056-1-harshit.m.mogalapalli@oracle.com>
References: <20250623142639.2938056-1-harshit.m.mogalapalli@oracle.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,wanadoo.fr];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,linuxfoundation.org,quicinc.com,kernel.org,arndb.de,linaro.org,wanadoo.fr,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,linaro.org:email]
X-Spam-Level: 

On Mon, 23 Jun 2025 16:26:27 +0200,
Harshit Mogalapalli wrote:
> 
> When snd_soc_usb_find_priv_data() fails, return failure instead of
> success. While we are at it also use direct returns at first few error
> paths where there is no additional cleanup needed.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/Z_40qL4JnyjR4j0O@stanley.mountain/
> Fixes: 326bbc348298 ("ALSA: usb-audio: qcom: Introduce QC USB SND offloading support")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Thanks, applied now.


Takashi

