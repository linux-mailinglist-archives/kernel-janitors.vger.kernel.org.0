Return-Path: <kernel-janitors+bounces-234-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9FE7E91F2
	for <lists+kernel-janitors@lfdr.de>; Sun, 12 Nov 2023 19:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EF121C20456
	for <lists+kernel-janitors@lfdr.de>; Sun, 12 Nov 2023 18:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA2A15AEE;
	Sun, 12 Nov 2023 18:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="b7TNhQv+"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95367E553
	for <kernel-janitors@vger.kernel.org>; Sun, 12 Nov 2023 18:10:58 +0000 (UTC)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C45D11BEF;
	Sun, 12 Nov 2023 10:10:56 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A2C1640E018F;
	Sun, 12 Nov 2023 18:10:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id o5jeVJy23QFH; Sun, 12 Nov 2023 18:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1699812651; bh=P+Kou/jpj8gD2sM9ulpNQYbK457wnt04VLoVq55l99E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b7TNhQv+z2v4Uj9Dap4EN/O61lvCqJRdWVwBLIM6UmS+ulbY29Rxvvrx3qZpRSWmF
	 AeUJ7MTjrYYg/fhvbvVRrATM/21hQnlyfplMueSFBSKPoIdNwARVrlfKDCc/BHEkFt
	 jwe7ppfKCLDcg9aohDOeRiKrpqPAUP+m7djCbv8AlacX9JX9Lmvp/PB64VBNFJyFD0
	 L7GQvBSaxHmThr+NtKV069zdYbRcub0O/8s8sgBBNRQw6p/yJ+xwceiHjQ5LDkgDZu
	 Gkf+z8+BvG5CS247AjIUowXurGrZa+4KXbNgZ/qD0+IbTfmqmrmfsWGGQ7Y94NGcb0
	 qab+tjcU0tUeceqld8oZFrm9LplYkcbjS16iLOkv1+M/YncupJdtCFZyeSgLes9Cx5
	 0Ky+/MMUMRf0eSZ0xmelWs75IV0qTvm9uguSUXu+vub5jUyNABLCP2TnrhYwZ5e9Bg
	 KGpgGgWS1hm5r8snXRmnIj3jJ+P0cPJYXahgT/+wbCGOQnbLXiiz3jy6RRrJusfI80
	 h1pcgxW/QawzWAluiYxg7XjMup48z97Lcb/zHlSfvOG2EviO+Yt0+hwXy2lmys9KP8
	 jmsnc9qZlMpoxTLYYMpmVkxr1FwdpUTNfiLEASsqWq+37ukzGvJwpbQ2uwkXW9VbTt
	 ea7xHrE2jOSzNawFyWwchZew=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 85EFA40E0031;
	Sun, 12 Nov 2023 18:10:42 +0000 (UTC)
Date: Sun, 12 Nov 2023 19:10:36 +0100
From: Borislav Petkov <bp@alien8.de>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: lukas.bulwahn@gmail.com, dave.hansen@linux.intel.com, hpa@zytor.com,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	mingo@redhat.com, tglx@linutronix.de, x86@kernel.org
Subject: Re: [regression] microcode files missing in initramfs imgages from
 dracut (was Re: [PATCH] x86: Clean up remaining references to
 CONFIG_MICROCODE_AMD)
Message-ID: <20231112181036.GBZVEVHIIj/Oos1cx4@fat_crate.local>
References: <20230825141226.13566-1-lukas.bulwahn@gmail.com>
 <c67bd324-cec0-4fe4-b3b1-fc1d1e4f2967@leemhuis.info>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c67bd324-cec0-4fe4-b3b1-fc1d1e4f2967@leemhuis.info>

On Sun, Nov 12, 2023 at 04:03:32PM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
> That's because dracut until the recent commit
> https://github.com/dracutdevs/dracut/commit/6c80408c8644a0add1907b0593eb83f90d6247b1
> looked for CONFIG_MICROCODE_AMD and CONFIG_MICROCODE_INTEL in the config
> file to decide what to include or not.

They've been told a bunch of times already that grepping .config for
specific symbols is not how one should check whether one should add
microcode blobs to the initrd or not because Kconfig symbols are not an
ABI.

And looking at that commit, now they're grepping for CONFIG_MICROCODE.
And that'll break again if one day we decide to make the microcode
loader built in unconditionally.

How to fix this reliably and properly?

Honestly, I don't have a good idea. If we do something like this:

grep microcode_init System.map

then that makes "microode_init" ABI and we won't be able to change it
eva. I'd need to do some digging here...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

