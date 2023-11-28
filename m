Return-Path: <kernel-janitors+bounces-482-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF9E7FBB33
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Nov 2023 14:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAD7F282C0D
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Nov 2023 13:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87FFD5787E;
	Tue, 28 Nov 2023 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="XfNeJ4RX"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 044B318F;
	Tue, 28 Nov 2023 05:17:26 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E2CBC40E01A5;
	Tue, 28 Nov 2023 13:17:24 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Tf39sVEJdPK8; Tue, 28 Nov 2023 13:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1701177443; bh=rjyEdVBSHIuNTzwadRt68ipKM5ALgcb+iNjTJnT4+fw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XfNeJ4RXZHIXCt79RDyIAsY0SnzW+SdKE7Cp8+qnrJY5WnrEDIi43PbZzvV2Xw1c9
	 QPG4XsdkHVm0NQ6n50FZHbEPr7F7ukT/TjHUbLlr/Lgev4DsHCseY1G3Bhi6YncrRW
	 XG2bXFcKS5Mbw+epvlqripXJkJ3rjzOUdSwDYeh+fx1SWhk93gGHmv8ueH4tXMOTBg
	 TFFt2wECmp7voiNVedBYl08qmY0O8l6Zc+zYcxIslQ9VLHDz7HVPOhIwmaRSe0nrG6
	 V8Co3Q+KfckYevA4w1zHeLdAEeqGgs1fwcCdDe2wSk9ZcZZeO1ZtZcWmVJIr10Wj6I
	 ghrTwKgSrbuk/99BLMLqs1t9Ef3Cd4ybO3e8KaoLD2o6ffM2cxRIElPw8/dwi9eCJ7
	 E4fYGHZ7aDCrciLSvpi2fCnuO3hBCWGn+E/fPvQ1CtC2O2pMnxJa27V8o9PZDqnKm2
	 qCfXvtAajkZaetBvkN7P6dtSfhTHU9DXDf6zMbRZUJ2/MbyLcJl8dATcUzmdzDGQ9v
	 1j14SkWcE9Rv/zqzUKlk3ujuvGfwYwHQm4Bti3A9ORg6mTZ9QmRZ9rIdSVzo0FZAVL
	 WMBIA04GRJmlr+bn4lZNSL/bQGmVr0dalLu5PN1uvI/nOCMC4wfSEj+Ywm67HJmpXM
	 6p/I4S+s7qdZ36zs31XKTh94=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id ED24E40E01B1;
	Tue, 28 Nov 2023 13:17:11 +0000 (UTC)
Date: Tue, 28 Nov 2023 14:17:07 +0100
From: Borislav Petkov <bp@alien8.de>
To: Antonio Feijoo <antonio.feijoo@suse.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	lukas.bulwahn@gmail.com, dave.hansen@linux.intel.com, hpa@zytor.com,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	mingo@redhat.com, tglx@linutronix.de, x86@kernel.org
Subject: Re: [regression] microcode files missing in initramfs imgages from
 dracut (was Re: [PATCH] x86: Clean up remaining references to
 CONFIG_MICROCODE_AMD)
Message-ID: <20231128131707.GAZWXoU9GpoeXB8dVv@fat_crate.local>
References: <e1ca042c-de1d-4fe3-ad69-51d147b1fe0b@leemhuis.info>
 <20231122155758.GEZV4lBgtZyzsP5Z4V@fat_crate.local>
 <CAHk-=wiV+NM+jLKbSj_Ej9RaXpu4akWV03G_wXyTSHZhArq1tg@mail.gmail.com>
 <20231122205135.GGZV5p157mBi6RYUNs@fat_crate.local>
 <CAHk-=wh03jMZRAxHFTkv0h9dZ6TmiqukzcHd4RTx7ijia_prsg@mail.gmail.com>
 <20231123112013.GAZV81bezsrS6sdJQR@fat_crate.local>
 <66f077cf-ff85-44dc-a76a-05d8995ea261@suse.com>
 <20231124121500.GAZWCTxML94BSYaQf3@fat_crate.local>
 <081ddbc7-8e3a-41c2-b361-3a03dfb3af12@suse.com>
 <20231124133303.GBZWCmD71R5dunBLQ3@fat_crate.local>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231124133303.GBZWCmD71R5dunBLQ3@fat_crate.local>

On Fri, Nov 24, 2023 at 02:33:03PM +0100, Borislav Petkov wrote:
> Thx, lemme get cracking on fancy github workflows. :-P

Uff:

https://github.com/dracutdevs/dracut/pull/2572

What a pain it is to do a pull request with github. :-\

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

