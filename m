Return-Path: <kernel-janitors+bounces-128-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 907FF7DF928
	for <lists+kernel-janitors@lfdr.de>; Thu,  2 Nov 2023 18:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A43971C20F99
	for <lists+kernel-janitors@lfdr.de>; Thu,  2 Nov 2023 17:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF189208CB;
	Thu,  2 Nov 2023 17:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQ59NtHg"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4041DFE4
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 17:49:08 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 318A01A4;
	Thu,  2 Nov 2023 10:49:05 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-32fb1d757f7so305567f8f.0;
        Thu, 02 Nov 2023 10:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698947343; x=1699552143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C9hmcoXIDDv1qs4YiLqL8xCdffaGDtdVzFefhq4fLAw=;
        b=NQ59NtHg/ktg7FLt0Qgixl+Vg4c1Fw9795aPBRTqRsdZKx1evxBegg9UnLAAep68KY
         e+L6bOUKHoqfgi1uI6kEKNTAgXDYe7Y8FhyDX6WZ2UUmvsFIR64kUj0Uvi1kCezvceVc
         0IUb9fnV3LDt1Z1YkcEWF+QgDLRP9fqgXz4EbJZiRsO2PoDmZ7Hti4b2HKEOIMQc+47l
         NgeGQfu0GHfWIvsJBG/nSqWGixYHhTaS64aZrEecrU1tROwTCpSC5UM6R1WrLAYdDvAF
         FPs9gGnAD/OAP7/nbIJ6p/uWlAnKbP0l6XdFH08z14JCxqMdOjgC048zyVX4EV3W9cH8
         7H6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698947343; x=1699552143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C9hmcoXIDDv1qs4YiLqL8xCdffaGDtdVzFefhq4fLAw=;
        b=V+PYrPyXlvAlBIn2G8XXhHkzdTKTxmmnoHqKD2geX7oVQ1IdXr3sTZF+6wjzhWtZZP
         kEfbekfN+5E+mQ3k3Qz6dUHjRA1vopva+RPtzfbkxpjoHi8A7VFIJqPaHm+dRDQQK/YP
         BDm5DLwB6c3e8rrOpk9fOjIhQ6LCq/KczseCGh4hou85Tv3uDRvCBPVHabbrrTJ8apYe
         i2zSJ07+C58M97jfvLlbBRQCgFrlYYMk+CHYR+ENOLceX2XrKKtqJ+xAn8y12rwrNBEN
         ri5gqng+QCmuzD5X6xLyucbmOo3INA7YPMLjIjCop3Gn56HARCAhWW+MUEfJGeGT6RzF
         7EUA==
X-Gm-Message-State: AOJu0YxKEWDq0Qhm5bPZwR9kPoOURxJ7eiQXCi9w6kF4PdD5yIUvoqoy
	rFhGDBpyulf49E95Pzlkg4I=
X-Google-Smtp-Source: AGHT+IGWx8Sh2cggwtYJe72ZxoGqM6IzjJKQukAxTj4XFXd/h6KhOnKRKjRvmcFzJd90iGGqL+77og==
X-Received: by 2002:a05:6000:1569:b0:32f:7bee:f300 with SMTP id 9-20020a056000156900b0032f7beef300mr16194258wrz.4.1698947342925;
        Thu, 02 Nov 2023 10:49:02 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id h11-20020a056000000b00b0031980783d78sm3008641wrx.54.2023.11.02.10.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 10:49:02 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][V2] x86/lib: Fix overflow of variable m when val >= 1410065408
Date: Thu,  2 Nov 2023 17:49:01 +0000
Message-Id: <20231102174901.2590325-1-colin.i.king@gmail.com>
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
number of cpus and NUMA nodes, so the overflow is never encountered.
However it is useful to fix the overflow issue in case the function
is used for other purposes in the future. (The issue was discovered
while investigating the digit counting performance in various
kernel helper functions rather than any real-world use-case).

The simplest fix is to make m a long long, the overhead in
multiplication speed for a long long is very minor for small values
of val less than 10000 on modern processors. The alternative
fix is to replace the multiplication with a constant division
by 10 loop (this compiles down to an multiplication and shift)
without needing to make m a long long, but this is slightly slower
than the fix in this commit when measured on a range of x86
processors).

Fixes: 646e29a1789a ("x86: Improve the printout of the SMP bootup CPU table")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---

V2: Make m long long instead of long to fix issue for i386 as well as
    x86-64
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
+	long long m = 10;
 	int d = 1;
 
 	if (val < 0) {
-- 
2.39.2


