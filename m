Return-Path: <kernel-janitors+bounces-103-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BCC7DE307
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Nov 2023 16:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EC33281345
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Nov 2023 15:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09101428D;
	Wed,  1 Nov 2023 15:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mD6EUGWQ"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE6B12B72
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 15:32:41 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73363A6;
	Wed,  1 Nov 2023 08:32:40 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-32f7c44f6a7so2765566f8f.1;
        Wed, 01 Nov 2023 08:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698852759; x=1699457559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FskWsrQJNJdVJ7FWmgRoYhcAsvNJ7ClQAxHmsraKq6Q=;
        b=mD6EUGWQtP/yvrP3kI4+oepuCKmI/l59dp+h+lRAqXm+9t5INc8yhCc5FkwGhKNpyT
         jb+d4xs/YFyZN5DiuIFvsc4xpcGcbbRrrfBnA8loqP0c/xlpPgVW8Ra6ofUmcyevSZz6
         KpU3vGTA59IJVSwV2OR/gsTyTo1dBscMPQkIhmgbtrIgIgpcp6KL3Qz+LakXzKxYxr7u
         8qEOQEtCC1NLO7nh6rhzy0EyubUIW8DWidrN00lSElbuTmBBPQSL5LxHbm5cDbBriH6Q
         47mPmLqsa/C/quqJJtd+/TlTQW3X6fuyyw8jzLib3K1433c3WdkZKpk0xCJwfXpYWkE2
         uYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698852759; x=1699457559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FskWsrQJNJdVJ7FWmgRoYhcAsvNJ7ClQAxHmsraKq6Q=;
        b=hMHxr/lbE6bgS5uu4z7r6GpcLdBW31BDISDkdCAaI80eVoU1/FQZxcYWIo2NyBofkd
         Bo6Get9g9elWrIEGzkNHyjHGkvDe1cwFhDpgpAR9ykjXIIfj0yo/ZqNv96oJOW7M+Gfs
         BW5Y2t0/7ShV2L9xrNr2v6Yi1Gqm6R/zEsQzHaJQHsL/UYE0IKccWbTdedW6hiGfyDAu
         LkdHc07XQMWmzrs6eWwsidist0IyXw0wddFEcxCvcX0LxBrbCzq6e8j+9iwpOn4tWnxM
         Fkijwai2/6oBYGTjKSXWvToquux6h/Xixt64nRhBluJQQwObwM2YAlD6YJIVMoWtMQN2
         h0JQ==
X-Gm-Message-State: AOJu0YzXHv6URbb8UCfgqgj9bhQDLO7REqwWFyutQCZPfJTwwGrxO7At
	8Jf948+C5INDr26kea6sBX9LG73CaY0=
X-Google-Smtp-Source: AGHT+IHoTkpKNbPsk//syKlxPlAIDqRLX4UMeKD9/InuujWE65V1w2q4EuIJjER2sOfV1UWA1h2/Rw==
X-Received: by 2002:a5d:6c61:0:b0:32f:7d50:62ef with SMTP id r1-20020a5d6c61000000b0032f7d5062efmr10448784wrz.13.1698852758575;
        Wed, 01 Nov 2023 08:32:38 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id d2-20020adffd82000000b003296b488961sm128146wrr.31.2023.11.01.08.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 08:32:37 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/lib: Fix overflow of variable m when val >= 1410065408
Date: Wed,  1 Nov 2023 15:32:37 +0000
Message-Id: <20231101153237.2214698-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is an overflow in variable m in function num_digits when val
is >= 1410065408 which leads to the digit calculation loop to
iterate more times than required. This results in either more
digits being counted or in some cases (for example where val is
1932683193) the value of m eventually overflows to zero and the
while loop spins forever).

Currently the function num_digits is currently only being used for
small values of val in the SMP boot stage for digit counting on the
number of cpus and NUMA nodes, so the overflow is never encounterd.
However it is useful to fix the overflow issue in case the function
is used for other purposes in the future. (The issue was discovered
while investigating the digit counting performance in various
kernel helper functions rather than any real-world use-case).

The simplest fix is to make m a long int, the overhead in
multiplication speed for a long is very minor for small values
of val less than 10000 on modern processors. The alternative
fix is to replace the multiplication with a constant division
by 10 loop (this compiles down to an multiplication and shift)
without needing to make m a long int, but this is slightly slower
than the fix in this commit when measured on a range of x86
processors).

Fixes: 646e29a1789a ("x86: Improve the printout of the SMP bootup CPU table")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 arch/x86/lib/misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/lib/misc.c b/arch/x86/lib/misc.c
index 92cd8ecc3a2c..41e26e246d8f 100644
--- a/arch/x86/lib/misc.c
+++ b/arch/x86/lib/misc.c
@@ -8,7 +8,7 @@
  */
 int num_digits(int val)
 {
-	int m = 10;
+	long m = 10;
 	int d = 1;
 
 	if (val < 0) {
-- 
2.39.2


