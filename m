Return-Path: <kernel-janitors+bounces-405-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C33087F52AC
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Nov 2023 22:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F39AE1C20BB1
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Nov 2023 21:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE231CABD;
	Wed, 22 Nov 2023 21:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="KRv4Cs7Y"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E861B3;
	Wed, 22 Nov 2023 13:35:42 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7A13340E024E;
	Wed, 22 Nov 2023 21:35:40 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id cQA6Yt3kkE3Q; Wed, 22 Nov 2023 21:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1700688937; bh=z94RA74bNsUX4SJmAqCyVFYkvEgangMOaCkKCrTng50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KRv4Cs7YZsoQdhd42XU1ujPPrGTwfG3gwG7XSj9zizVrvlHx98vye+NGI3jeXK3MV
	 OXFMBdqyNPIat04QWi1Y5DlU+xBXChWu8KGEhuO7k5gEw+6Q4MsW4Cn9zmxfrbo3CM
	 5KjyQEtUydmvsf0KcioK8TUj4122KhKlQAFEG5i0c+c9Ww1RjoJ6kHIEOg2LN2hdYl
	 flGMoT4w37rAACz1DZY+hm+P4ANjKHT1S6AYouK9wWqcmkNbcK1qcbQr+D5rZEO637
	 +7EnlqGvu8ela1EmgB9ZRE1e0fadd0+sFNXJ5Qml94Ik2F1en5MEGXgMyHFXZVkUD0
	 pikkZ1Gn2wRIZF8iF7zm6lga8V0VxnMHGkNWumezBOGdyO/J1bXXrfEUVgjGszydHR
	 WJxz05QOJIK2owCQVCYCa+Q2DVbTYfLc89sKSCP77cOHPQIhgRHHP0M7gfIrDuicLI
	 YcQB9Q6Ilka5ztyQyG8KdiyVy8y2cH4aR84+JeNGSDeNDIivHEeKcY97c1Z41rg3xI
	 Nwvghf7H6TDofpLb4LXmeD/Sti+oyfYRNWC1lZJJpvcseWK/kZ9XO5MGJDXOBt4os4
	 bTF0nsc9DSSng8gslCPY04473lRudPlAJ63cLLeS7zBYHa5rh1Ti0tztjFJxa72Zjh
	 erNoxtm6ii1ZTBH9LEoQ1l+w=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9300340E014B;
	Wed, 22 Nov 2023 21:35:26 +0000 (UTC)
Date: Wed, 22 Nov 2023 22:35:22 +0100
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	lukas.bulwahn@gmail.com, dave.hansen@linux.intel.com, hpa@zytor.com,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	mingo@redhat.com, tglx@linutronix.de, x86@kernel.org,
	initramfs@vger.kernel.org
Subject: Re: [regression] microcode files missing in initramfs imgages from
 dracut (was Re: [PATCH] x86: Clean up remaining references to
 CONFIG_MICROCODE_AMD)
Message-ID: <20231122213522.GHZV50GqXHU35R+tkK@fat_crate.local>
References: <20230825141226.13566-1-lukas.bulwahn@gmail.com>
 <c67bd324-cec0-4fe4-b3b1-fc1d1e4f2967@leemhuis.info>
 <20231112181036.GBZVEVHIIj/Oos1cx4@fat_crate.local>
 <0e9cbe6f-ac6c-47f2-b663-a22568799eca@leemhuis.info>
 <20231122115826.GAZV3s4krKXI002KQ0@fat_crate.local>
 <e1ca042c-de1d-4fe3-ad69-51d147b1fe0b@leemhuis.info>
 <20231122155758.GEZV4lBgtZyzsP5Z4V@fat_crate.local>
 <CAHk-=wiV+NM+jLKbSj_Ej9RaXpu4akWV03G_wXyTSHZhArq1tg@mail.gmail.com>
 <20231122205135.GGZV5p157mBi6RYUNs@fat_crate.local>
 <CAHk-=wh03jMZRAxHFTkv0h9dZ6TmiqukzcHd4RTx7ijia_prsg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wh03jMZRAxHFTkv0h9dZ6TmiqukzcHd4RTx7ijia_prsg@mail.gmail.com>

Lemme add initramfs@vger.kernel.org to Cc again. I hope that's the
correct ML dracut folks use.

On Wed, Nov 22, 2023 at 01:08:41PM -0800, Linus Torvalds wrote:
> Yes, I agree that it's not optimal, but I would hate to have some odd
> "let's add another ELF note" churn too, for (presumably) increasingly
> obscure reasons.

Right, my angle with the ELF note is that it is at least something well
establshed and other things use it too (Xen, BUILD_SALT, other arches
too).

> It looks like dracut has been doing this forever, and in fact back in
> 2015 apparently had the exact same issue (that never made it to kernel
> developers, or at least not to me), when the kernel
> CONFIG_MICROCODE_xyz_EARLY config went away, and became just
> CONFIG_MICROCODE_xyz.

Yap, that was me. I merged the early loader because it didn't make any
sense to have a separate thing.

> The whole "check kernel config" in dracut seems to go back to 2014, so
> it's been that way for almost a decade by now.
> 
> Honestly, I think the right approach may be to just remove the check
> again from dracut entirely - the intent seems to be to make the initrd
> smaller when people don't support microcode updates, but does that
> ever actually *happen*?

That thought also crossed my mind. With the mitigations sh*te, you
basically must build in microcode. Lemme cook up a dracut patch for this
tomorrow and see what happens.

> There are dracut command lines, like "--early-microcode" and
> "--no-early-microcode", so people who really want to save space could
> just force it that way. Doing the CONFIG_xyz check seems broken.

Yap, exactly.

> I guess we on the kernel side could help with "make install" etc, but
> we've (intentionally) tried to insulate us from distros having
> distro-specific installkernel scripts, so we don't really haev a good
> way to pass information down to the installkernel side.
> 
> It *would* make sense if we just had some actual arguments we might
> pass down. Right now we just do
> 
>         exec "${file}" "${KERNELRELEASE}" "${KBUILD_IMAGE}" System.map
> "${INSTALL_PATH}"
> 
> so basically the only argument we pass down is that INSTALL_PATH
> (which is just "/boot" by default).

Right, and on debian they run initramfs-tools as part of
a post-installation step at the end of /sbin/installkernel which could
then pass in more configuration info.

Yap, that could be one way to do it. We could document it in
scripts/install.sh or somewhere more prominent so that tools can look it
up.

Yap, all better ideas than parsing .config.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

