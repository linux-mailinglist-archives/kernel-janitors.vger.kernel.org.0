Return-Path: <kernel-janitors+bounces-1848-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C300F85F153
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Feb 2024 07:13:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00C171C214D2
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Feb 2024 06:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D9616410;
	Thu, 22 Feb 2024 06:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mYkaeP4m"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB5B179AA
	for <kernel-janitors@vger.kernel.org>; Thu, 22 Feb 2024 06:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708582408; cv=none; b=tRv2q5dpuVzfxTtnNneTBQpwLYNEgDQBfLryYuKDf59wDc2YaI9vHfbNIDsG9cX5X5ky1J7g45uoEOE+9LUAWR1hrCBJgIrEs2Wa6KEAGz31gXlYlynQyRzRMNe2mLN8uhSNsc+3qRBq9iOTIUeLorf3IQ9CvYhMRDzNofjQLvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708582408; c=relaxed/simple;
	bh=UXEAEw7UmL2MRU38lPF6CscWJjihKIKdWohwWysbVHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MhmPKo2nuL0gT+fLjOGOy3N0HgOdjXaZ40nIWsF2EKyhliisDDyWZHQV+SrZSEQw/GGcY8ldvtvSqpApL7ehgZjkMMfQj5DqNVMdxUUS/7eZrWhH3IXNvwF5SHmTLjQrRhflc+wwDrfYXHRAEFQRX8dRXJ5AIxzntAkuAjrkptY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mYkaeP4m; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4125df3c40aso41222075e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Feb 2024 22:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708582405; x=1709187205; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/yg7tRxzbV+EmatCrfewdaj9UpcnaRdPJGRrG9tMkoc=;
        b=mYkaeP4m9bJyAN/MEpgtby9DCAeXot4g9eSiY7HdZJhW0J0UB+dP11Y1YV57kA2eNE
         2KIlcnHZjcPYpcMVxnYnlvpRaD7feqNjo19XZ8x3vd9SA8D12kyi+5oOS7KO5OKkS0ys
         HI8B713RR8bSXXbwUP8DMbplqaeePNQ+Ru09lK2sBt/AW/25yg8ejA4/v7CkLWYgXU4e
         5JPc62lE7P0hldOarTvaQY4zix7GjhQnQxHy42qzNpLTb25Is3+SL7DUprdJJdsPI9Tz
         gqgfEkSlghv3KIVHCvbrKN1qi2uk54olrCC3hyREHwZj8UzDekSuUbaJwlY3GennRAFt
         KcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708582405; x=1709187205;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/yg7tRxzbV+EmatCrfewdaj9UpcnaRdPJGRrG9tMkoc=;
        b=mJEu4vXIB/dwnwrL6yGs99su03mKgw+rJVUuW78QJP12q8420V5CidjZsX3XDrzKVG
         ofU2BSMKhtKQc5EzO6GtvtMZzEEqirMmvJpeLqrQeIablgSLuOvzJRKBqhm6bjrHYjui
         0CflQDN6RhL4Q2FZtKbavqw9AWrgJn1257eA0QEmdHVH4QnGtmBKECBHUSPXX3RGlkIE
         GtiQnHzx3CSvtjlf7262+V/NBvbcoeFMh7VmFWmthw5dXkT6W/p+OGyFUNQ1FyHXWWco
         M0V2acbwCTNoMdclHLYzE+lrn61N6Suwg3gnjNlkNLpwp1b5EJKJOXmEILM2+CCi0IzZ
         1lPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE773tPdGzYq8ZblfBWVHVd3o8gUouL+wNNmpWTnKw6EOnW1oVtw1qCsugqjCPfo2YVMNxK7XvflTbB+qP5azb2otBUPMJdQXuJ3QxbHth
X-Gm-Message-State: AOJu0Yzuptvi0nx+cRS4D0aIdq8fkjSuQXviccvfGNavcyuffqIfHGy+
	MEbPPaqi+fgpF66NSaQ7cuemKQg1SbOZUtWh33EnoVCT48ILUhWSNRe70OP0uwc=
X-Google-Smtp-Source: AGHT+IEfk0s8M8mAHLTsj07Utv328xeqW4cg2gD3PrX3Sqlc5RNEtyazu79guuStk3rCXLGsMq4LEw==
X-Received: by 2002:a05:600c:4f04:b0:412:8850:9c6f with SMTP id l4-20020a05600c4f0400b0041288509c6fmr258709wmq.31.1708582405588;
        Wed, 21 Feb 2024 22:13:25 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id x14-20020a05600c21ce00b00412704a0e4asm4841890wmj.2.2024.02.21.22.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 22:13:25 -0800 (PST)
Date: Thu, 22 Feb 2024 09:13:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] firmware/sysfb: fix an error code in sysfb_init()
Message-ID: <aaaa2e13-849b-41a0-8186-25f3d2a16f86@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This error path accidentally returns success when it should preserve the
error code from sysfb_parent_dev().

Fixes: 4e754597d603 ("firmware/sysfb: Create firmware device only for enabled PCI devices")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/firmware/sysfb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index a6b48703dc9e..880ffcb50088 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -127,8 +127,10 @@ static __init int sysfb_init(void)
 	sysfb_apply_efi_quirks();
 
 	parent = sysfb_parent_dev(si);
-	if (IS_ERR(parent))
+	if (IS_ERR(parent)) {
+		ret = PTR_ERR(parent);
 		goto unlock_mutex;
+	}
 
 	/* try to create a simple-framebuffer device */
 	compatible = sysfb_parse_mode(si, &mode);
-- 
2.43.0


