Return-Path: <kernel-janitors+bounces-378-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C727F4158
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Nov 2023 10:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9185E1C20982
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Nov 2023 09:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437312136F;
	Wed, 22 Nov 2023 09:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FCE683;
	Wed, 22 Nov 2023 01:15:50 -0800 (PST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r5jKg-0000kn-Ox; Wed, 22 Nov 2023 10:15:42 +0100
Message-ID: <0e9cbe6f-ac6c-47f2-b663-a22568799eca@leemhuis.info>
Date: Wed, 22 Nov 2023 10:15:42 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Subject: Re: [regression] microcode files missing in initramfs imgages from
 dracut (was Re: [PATCH] x86: Clean up remaining references to
 CONFIG_MICROCODE_AMD)
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
To: Borislav Petkov <bp@alien8.de>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: lukas.bulwahn@gmail.com, dave.hansen@linux.intel.com, hpa@zytor.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 mingo@redhat.com, tglx@linutronix.de, x86@kernel.org
References: <20230825141226.13566-1-lukas.bulwahn@gmail.com>
 <c67bd324-cec0-4fe4-b3b1-fc1d1e4f2967@leemhuis.info>
 <20231112181036.GBZVEVHIIj/Oos1cx4@fat_crate.local>
Content-Language: en-US, de-DE
In-Reply-To: <20231112181036.GBZVEVHIIj/Oos1cx4@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1700644550;2614c532;
X-HE-SMSGID: 1r5jKg-0000kn-Ox

On 12.11.23 19:10, Borislav Petkov wrote:
> On Sun, Nov 12, 2023 at 04:03:32PM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
>> That's because dracut until the recent commit
>> https://github.com/dracutdevs/dracut/commit/6c80408c8644a0add1907b0593eb83f90d6247b1
>> looked for CONFIG_MICROCODE_AMD and CONFIG_MICROCODE_INTEL in the config
>> file to decide what to include or not.
> 
> They've been told a bunch of times already that grepping .config for
> specific symbols is not how one should check whether one should add
> microcode blobs to the initrd or not because Kconfig symbols are not an
> ABI.

Maybe, but you know how Linus sees things like this: what's considered
an ABI/API or not is nearly[1] irrelevant - if a change breaks something
that used to work then it needs to be fixed.

[1] unless you fiddle with things obviously internal; not sure if this
case would qualify for him, but somehow I doubt it -- but I might be
wrong there.

> And looking at that commit, now they're grepping for CONFIG_MICROCODE.
> And that'll break again if one day we decide to make the microcode
> loader built in unconditionally.
> 
> How to fix this reliably and properly?
> 
> Honestly, I don't have a good idea. If we do something like this:
> grep microcode_init System.map
> 
> then that makes "microode_init" ABI and we won't be able to change it
> eva. I'd need to do some digging here...

Any progress on this?

BTW: I see that this could help preventing problems like the current one
to happen in the far future. But how would that help the current
situation (e.g. users that have an old dracut and updated the kernel
without updating dracut)?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

