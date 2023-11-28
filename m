Return-Path: <kernel-janitors+bounces-489-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C917FBF2C
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Nov 2023 17:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB2801C20C30
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Nov 2023 16:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8459435288;
	Tue, 28 Nov 2023 16:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ClBmQqsN"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39873AB;
	Tue, 28 Nov 2023 08:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=USKD47nnFtZbiC34tRZ66OhMG1E8r+dDqxL3nx7Jtro=; b=ClBmQqsND9oEWW5dgMODhFvArj
	UB8sWpzmh2KWyrNRCd54Yvf4GQhM5QQebv5O90sjE05UcLeu5UNXf05TsovGOuzx0ctZGL94Hf3hp
	K86Zgmv7SihcbfriF1LdZQxRCkcYjj0enbIt7NdxFybvOJkCevXvJWpkxUzzxCnzQDOhITTYbO+Tv
	FWAAN/PT0q7ub0BdmXQKlg3Dvq2Bl2QsTvUhMdLH/V0BFiGpc6AWzL+Js3wMJvxp7ayshfWFZ72oP
	JX3C7tEGsY5t7UXQKUEllmgFfnv0PsdMeDpMCT0IZFmLWx4BQie0lt0fnd5bet+aakJ4UfcVJ7Psh
	JRrI1fnQ==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r80wV-005oNE-1m;
	Tue, 28 Nov 2023 16:28:11 +0000
Message-ID: <c5b659bf-0163-45c5-ac88-f1ef876ab3f3@infradead.org>
Date: Tue, 28 Nov 2023 08:28:11 -0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] x86/Kconfig: Remove obsolete config X86_32_SMP
Content-Language: en-US
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231128090016.29676-1-lukas.bulwahn@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231128090016.29676-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/28/23 01:00, Lukas Bulwahn wrote:
> Commit 0f08c3b22996 ("x86/smp: Reduce code duplication") removes the only
> use of CONFIG_X86_32_SMP.
> 
> Remove the obsolete config X86_32_SMP.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> 
> I sent this cleanup patch in March 2023 and it did not get any attention:
> 
> https://lore.kernel.org/lkml/20230317101621.14413-1-lukas.bulwahn@gmail.com/
> 
> It is just minor cleanup, but it also should not cause any issue.
> This can be quickly checked with grep "X86_32_SMP" . -R and seeing that
> this is only mentioned in arch/x86/Kconfig in this one definition.
> 
> No change here other than rebasing the original patch.
> 
>  arch/x86/Kconfig | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 21890efbfdd8..d7d1ef3d2684 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -384,10 +384,6 @@ config HAVE_INTEL_TXT
>  	def_bool y
>  	depends on INTEL_IOMMU && ACPI
>  
> -config X86_32_SMP
> -	def_bool y
> -	depends on X86_32 && SMP
> -
>  config X86_64_SMP
>  	def_bool y
>  	depends on X86_64 && SMP

-- 
~Randy

