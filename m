Return-Path: <kernel-janitors+bounces-3665-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DDA8FE738
	for <lists+kernel-janitors@lfdr.de>; Thu,  6 Jun 2024 15:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E5A0B24816
	for <lists+kernel-janitors@lfdr.de>; Thu,  6 Jun 2024 13:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B364195F06;
	Thu,  6 Jun 2024 13:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fDx1Lh6r"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE25195B3F
	for <kernel-janitors@vger.kernel.org>; Thu,  6 Jun 2024 13:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679431; cv=none; b=lPCtBFxR1NbYhSnChaJ+Gdr3ODLzRS1N57tZGvfec/5p4LcBwo9j2C6sH1qinJlQASk/31m4aLX0OP1cG3Djfx6Y62vblvJFZKj4Fw83XEIlqaGNNGPskmr3ShNx3jlnsJpNnYb0WEI8k7rg9t+6Z/SRg3cAJcpcENMkFGIByEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679431; c=relaxed/simple;
	bh=zT88eZfNNd+RiyI4o59iAJCPJIAf8oivhPTjWxX35MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jOs3U3gPItnU0CMfoK8gAtAOw9F3pTxeCuFw4yRGDmAtL+QqOmhX/jVK8ckkZ6Ok5c01ULabvrwFAuUDSEl41IofCg5prZiSwARA88FnUPAh6OPgffINWLGoL5FhoWejda2G3YGT4OXAzfm08Fu2PfSWIrpv//LYNgXizbhv4hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fDx1Lh6r; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a68ca4d6545so173154566b.0
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Jun 2024 06:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717679428; x=1718284228; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LLTo6IN//CUfT633Q+EgtwxBk4Zhgr8yvAaTHaRrJKc=;
        b=fDx1Lh6rX1LDP8w/JsHdvLHz6V6cyvu0Vc8B/sXq4YtcwW1DmqkH+afCojavFduOcZ
         W/iz5jps5OsEzdRzyqWum3X1ZH2mcBRUS8rhCi2WXEb3qhKOvY2hcu3JIXz0pEEJ8Wpa
         IFT3ASthAA3NgddTEw5N+hLmRycL/jwcPCoKTzD2JjR9HdXMEmBywKEV2WC2kNrMeMUJ
         kqCUS3sxhg0mG+dkjghTfr51mJdZuN8a5YmSxnqkyZnTSYfIy7Ybs6XQWmSmTQ3be1Dl
         Iz/l2+dm/W2xjGTI/gWFY9djaSSlciEJ2JGHp0rCK5mDJfJwAeqSoOPGOPePQKsx7330
         yAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679428; x=1718284228;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LLTo6IN//CUfT633Q+EgtwxBk4Zhgr8yvAaTHaRrJKc=;
        b=tgKlrIdefT5hyDEX+2IAWJAAA/c3D6qs14j7YDsHXvIkROQK7Rm3DVtU6Rjl8Ray9l
         eIMjmmUXJMKaPHUNrtA2zqz/2y8i29F/Fpd9FUBgqfN8r5W1EfxkOY+fjnsQG+copUet
         piD78s7oVw7b7eRfZyBZq6HtU0750Cs9tyKaMD/xAREpKvXm47ee5gAMUN2iMVdNyimC
         QJjapTGXmKqmtbdDcuFG8NOp9KTyoHq9ITEtfizZtDQ/DtpiYsPqdARBd31akvHroZFJ
         nhpJ7IU0PkYUHchUbro5GD5sSiKEyyvVaHDDR1V7UjgpKkxy6KsRiBR3Kk1yPyCi0UWW
         p1IA==
X-Forwarded-Encrypted: i=1; AJvYcCU0e7BymGYFyluzz01JPM7SZKU7MhDNJ4b8H4RWn9uN5PYrihDCNbsMUvmtVFDuQyygnjGe1sxutzJNUmNGL8biNhSyGXPXL39fSEVIZkkS
X-Gm-Message-State: AOJu0YyUMhohWXuj7yRoYkbDfwyk4URWv2FFeNYSMlzpeziflGpR8kZE
	EjrwHkaQjVsdbeN4POtOEs6cg5TRgEgg9oB6Wf7mo9xFJZqD/H+hmcoHf/DYGII=
X-Google-Smtp-Source: AGHT+IE/O3Z7xTXrhanwtiiAy00RvXG9RUOoWD1wIob6c3DU4S0+HjI1sOf6DL7JHERx+RQuhoT5dg==
X-Received: by 2002:a17:906:e218:b0:a68:a476:6957 with SMTP id a640c23a62f3a-a6c7650a2ffmr216652566b.24.1717679428406;
        Thu, 06 Jun 2024 06:10:28 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c8070e82esm94963466b.161.2024.06.06.06.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:10:27 -0700 (PDT)
Date: Thu, 6 Jun 2024 16:10:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrick Gansterer <paroga@paroga.com>
Cc: Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] backlight: lm3509_bl: Fix NULL vs IS_ERR() check in
 register() function
Message-ID: <187b5bc5-a010-46c2-8ead-980df9efae79@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_backlight_device_register() doesn't return NULL, it returns
error pointers.  Update the error checking to match.

Fixes: b72755f5b577 ("backlight: Add new lm3509 backlight driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/video/backlight/lm3509_bl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/lm3509_bl.c b/drivers/video/backlight/lm3509_bl.c
index ab57f79ffe23..c93cdedff5ad 100644
--- a/drivers/video/backlight/lm3509_bl.c
+++ b/drivers/video/backlight/lm3509_bl.c
@@ -114,9 +114,10 @@ lm3509_backlight_register(struct device *dev, const char *name_suffix,
 	}
 
 	bd = devm_backlight_device_register(dev, label, dev, data, ops, &props);
-	if (bd)
-		backlight_update_status(bd);
+	if (IS_ERR(bd))
+		return bd;
 
+	backlight_update_status(bd);
 	return bd;
 }
 
-- 
2.43.0


