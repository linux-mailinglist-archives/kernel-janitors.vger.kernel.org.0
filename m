Return-Path: <kernel-janitors+bounces-476-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A36B77FB518
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Nov 2023 10:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42BADB214E3
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Nov 2023 09:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF373364CE;
	Tue, 28 Nov 2023 09:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEnDaViG"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB2AF18D;
	Tue, 28 Nov 2023 01:00:21 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40b3e2f8ec5so23321575e9.1;
        Tue, 28 Nov 2023 01:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701162020; x=1701766820; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+isXMkl09WtDb5Nbq8kvBnUQhwVA4Qbwhz1mogdzPNo=;
        b=aEnDaViGJzOecEkHSawEXHlb7q4qHj0n/ft3FTB7pbujoWRHcvZIoTZRzIKZLlQEBC
         arH5iFVaX6NCe5W/5pMZI9U8M0dBRpVWJhN/7niwTaqh3LYJrFYqZiljYH1xx4sKGZih
         iYdedYMzVJ/HnbjLaOgcgnycL9AeFS5Iin7LFTXWAclDb/ox4nIzfCscOz21JD4dMcNu
         5zPQeG942KfOuOrFEXDBF0/8PDH4aXQlkyH5qJMRFqp7aOnasYtSAAcNd7KvW98CuH5N
         bqglnFXmHlP6Oc3ACiybqinjyxGgVdyh9Kz5v7Vu5m7LFrLfe8Mm45Mnb7E18ALJs2y4
         1oZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701162020; x=1701766820;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+isXMkl09WtDb5Nbq8kvBnUQhwVA4Qbwhz1mogdzPNo=;
        b=R0NDQtM5xEI9Uvq80cHOHQhFDMHxIXOdLG5W8lP4/lpB7e/mfkLtdV+wWm8oBHo/Sk
         f7ZYoTH6l/iP8Vcqj4W6Lo3TP0VI7ocJv//NRNlM10D2XZ411xDk2wkSIEhSx56b5KEL
         PkhfJN59g88WsihF666YyfRugQcocpf5yp5XvjnkRc8FQ7B82J8h8N6Le2U0o7Wg7PQn
         cjJxA4x1t3Y75Q3ZdprFKDB/rZzzV8KRRCQGjkw9YYP03wdSdXEs053tbpwpSmhPHKvF
         ur87jYV+s7yCsDmpzMflX3rGwREXD9NfQuvkKAADOSpzZfxH/jXFHLGvyHA615m4shwA
         lkWg==
X-Gm-Message-State: AOJu0Yyiu9qabCVvPZkWHLtGmT6JQh7xuLYhZ7qfwhtXfJIQC9hhSMDU
	JrueJZkxn7PiOsmwv2SBO+Q=
X-Google-Smtp-Source: AGHT+IFv11/1zuur+ehLJrmUeUXP8OhM1V64jRDzzgaYxMV3/aVaNDlUaFco7GvU50I93ic4saR0xg==
X-Received: by 2002:a05:600c:296:b0:40b:47dc:9b9d with SMTP id 22-20020a05600c029600b0040b47dc9b9dmr2992720wmk.40.1701162020053;
        Tue, 28 Nov 2023 01:00:20 -0800 (PST)
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:bc53:e481:4bb:faea])
        by smtp.gmail.com with ESMTPSA id h4-20020a05600c350400b0040b34720206sm16644705wmq.12.2023.11.28.01.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 01:00:19 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH RESEND] x86/Kconfig: Remove obsolete config X86_32_SMP
Date: Tue, 28 Nov 2023 10:00:16 +0100
Message-Id: <20231128090016.29676-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>

Commit 0f08c3b22996 ("x86/smp: Reduce code duplication") removes the only
use of CONFIG_X86_32_SMP.

Remove the obsolete config X86_32_SMP.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---

I sent this cleanup patch in March 2023 and it did not get any attention:

https://lore.kernel.org/lkml/20230317101621.14413-1-lukas.bulwahn@gmail.com/

It is just minor cleanup, but it also should not cause any issue.
This can be quickly checked with grep "X86_32_SMP" . -R and seeing that
this is only mentioned in arch/x86/Kconfig in this one definition.

No change here other than rebasing the original patch.

 arch/x86/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 21890efbfdd8..d7d1ef3d2684 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -384,10 +384,6 @@ config HAVE_INTEL_TXT
 	def_bool y
 	depends on INTEL_IOMMU && ACPI
 
-config X86_32_SMP
-	def_bool y
-	depends on X86_32 && SMP
-
 config X86_64_SMP
 	def_bool y
 	depends on X86_64 && SMP
-- 
2.17.1


