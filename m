Return-Path: <kernel-janitors+bounces-7168-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70875A439E1
	for <lists+kernel-janitors@lfdr.de>; Tue, 25 Feb 2025 10:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10463189F069
	for <lists+kernel-janitors@lfdr.de>; Tue, 25 Feb 2025 09:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FDD2627E9;
	Tue, 25 Feb 2025 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MdgSI4Hv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RMvWKNBp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MdgSI4Hv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RMvWKNBp"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8292225EFBC
	for <kernel-janitors@vger.kernel.org>; Tue, 25 Feb 2025 09:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476172; cv=none; b=Kta14nZzqw7tmLbmx7YHelCgRJbvMOemDB+aQDlvJ8lpnhMDOqcILtwpLVgrg/0BU0/eCadmWb4trEAeKECoZIRlWJ4nbvMPeESujVKA1Gonk4x7q6E/hUS3pU7iXOEuG30CSxNwgVMa4RWmOxMSnCJPC24DdxABSl1c7i52hhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476172; c=relaxed/simple;
	bh=prA312rqe9WFEYwNDewyqNmLuRIPwToz6pjiUUU83ao=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VGr4x0Zqyx/imA5/459HBbAY8+bTvqFPN016JuMUV+aXDKyfBQ6tv0T81RCeqBLfD7SaY1RtPAUoajgaAYnPqFv8vqTZ/4qbtFMpbcyZxU0QvoZ3gu+i1E2SPM7e2n2TiMpaQAag/AXilvV7Tzk4sx1aoHPN4z5llkhnVh1mJ80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MdgSI4Hv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RMvWKNBp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MdgSI4Hv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RMvWKNBp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6533F1F44F;
	Tue, 25 Feb 2025 09:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740476162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IsrnR7Efn9rCU7JZaxjsWN3D3syNECpkktGDzdT2cQo=;
	b=MdgSI4HvGVtgrr2VTdTVq26YtMrv64m3vW+CS83jlrVbD6TIlBIUmOfc5ASJomXeXt0PEB
	MpL98LB+RwTgLyTOk1VSksTj/3beg/w5P7MZD1j9royLUeNnu4Cyg573fzRoM8eJiAN2q+
	AfDQH/ElYhFqBzpMqxaJcUviLMCMQYk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740476162;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IsrnR7Efn9rCU7JZaxjsWN3D3syNECpkktGDzdT2cQo=;
	b=RMvWKNBphNccmvb55hKzIW3I/qHPce3JpqpAhlCG85Kx/FrPEW4PBKqLVo0dForWRsn6NG
	AyLu28ZINH4l2LDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MdgSI4Hv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RMvWKNBp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740476162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IsrnR7Efn9rCU7JZaxjsWN3D3syNECpkktGDzdT2cQo=;
	b=MdgSI4HvGVtgrr2VTdTVq26YtMrv64m3vW+CS83jlrVbD6TIlBIUmOfc5ASJomXeXt0PEB
	MpL98LB+RwTgLyTOk1VSksTj/3beg/w5P7MZD1j9royLUeNnu4Cyg573fzRoM8eJiAN2q+
	AfDQH/ElYhFqBzpMqxaJcUviLMCMQYk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740476162;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IsrnR7Efn9rCU7JZaxjsWN3D3syNECpkktGDzdT2cQo=;
	b=RMvWKNBphNccmvb55hKzIW3I/qHPce3JpqpAhlCG85Kx/FrPEW4PBKqLVo0dForWRsn6NG
	AyLu28ZINH4l2LDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0BA3313332;
	Tue, 25 Feb 2025 09:36:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3umZAQKPvWceFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Feb 2025 09:36:02 +0000
Date: Tue, 25 Feb 2025 10:36:01 +0100
Message-ID: <87zfia74e6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Lukas Wunner <lukas@wunner.de>,
	Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Takashi Iwai <tiwai@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] vgaswitcheroo: Fix error checking in vga_switcheroo_register_audio_client()
In-Reply-To: <87zfia5r0a.fsf@intel.com>
References: <ae24cd32-1e78-4656-b983-051ed22d86b9@stanley.mountain>
	<87eczn7adi.fsf@intel.com>
	<8e161bf8-70f6-4557-8fa8-81d4bbfab91f@stanley.mountain>
	<87zfia5r0a.fsf@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 6533F1F44F
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,wunner.de,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,nfschina.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,linaro.org:email,nfschina.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 25 Feb 2025 10:10:29 +0100,
Jani Nikula wrote:
> 
> On Mon, 24 Feb 2025, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > On Mon, Feb 24, 2025 at 03:14:33PM +0200, Jani Nikula wrote:
> >> On Wed, 19 Feb 2025, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >> > The "id" variable is an enum and in this context it's treated as an
> >> > unsigned int so the error handling can never trigger.  The
> >> > ->get_client_id() functions do not currently return any errors but
> >> > I imagine that if they did, then the intention was to return
> >> > VGA_SWITCHEROO_UNKNOWN_ID on error.  Let's check for both negatives
> >> > and UNKNOWN_ID so we'll catch it either way.
> >> >
> >> > Reported-by: Su Hui <suhui@nfschina.com>
> >> > Closes: https://lore.kernel.org/all/20231026021056.850680-1-suhui@nfschina.com/
> >> > Fixes: 4aaf448fa975 ("vga_switcheroo: set audio client id according to bound GPU id")
> >> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> >> > ---
> >> >  drivers/gpu/vga/vga_switcheroo.c | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
> >> > index 18f2c92beff8..216fb208eb31 100644
> >> > --- a/drivers/gpu/vga/vga_switcheroo.c
> >> > +++ b/drivers/gpu/vga/vga_switcheroo.c
> >> > @@ -375,7 +375,7 @@ int vga_switcheroo_register_audio_client(struct pci_dev *pdev,
> >> >  	mutex_lock(&vgasr_mutex);
> >> >  	if (vgasr_priv.active) {
> >> >  		id = vgasr_priv.handler->get_client_id(vga_dev);
> >> > -		if (id < 0) {
> >> > +		if ((int)id < 0 || id == VGA_SWITCHEROO_UNKNOWN_ID) {
> >> 
> >> Maybe we want to do something else here... see [1].
> >> 
> >> BR,
> >> Jani.
> >> 
> >> 
> >> [1] https://lore.kernel.org/r/CAHk-=wgg2A_iHNwf_JDjYJF=XHnKVGOjGp50FzVWniA2Z010bw@mail.gmail.com
> >> 
> >
> > I feel like my patch is good enough...  I guess the concern here is that
> > GCC could change enums to something else.  I don't think that's likely as
> > it would break a lot of code.  The other option, which is a good option,
> > is to change the function signature for vgasr_priv.handler->get_client_id()
> > so that we do:
> >
> > 	ret = vgasr_priv.handler->get_client_id(vga_dev, &id);
> > 	if (ret)
> > 		return;
> >
> > That's better code, honestly.  But I can't find motivation enough to do
> > the work.
> 
> The more I look at this, the more bonkers 4aaf448fa975 feels.
> 
> Anyway, I don't think ->get_client_id() hooks should return negative
> error codes, and indeed none of them do. None of them return
> VGA_SWITCHEROO_UNKNOWN_ID either, but that would be a valid return.
> 
> I suggest only checking for id == VGA_SWITCHEROO_UNKNOWN_ID. And doing
> that in all the places that have that check, there are two more, but
> they assign the return value to an int. So the int ret should be changed
> to enum vga_switcheroo_unknown_id id I think.

+1, this sounds like the cleanest way.

> Any chance of finding enough motivation to do that? ;)

For whom? ;)


thanks,

Takashi

