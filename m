Return-Path: <kernel-janitors+bounces-632-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DAC80B762
	for <lists+kernel-janitors@lfdr.de>; Sun, 10 Dec 2023 00:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2ECD61F20F8E
	for <lists+kernel-janitors@lfdr.de>; Sat,  9 Dec 2023 23:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7471E51F;
	Sat,  9 Dec 2023 23:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOYBpsJP"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE8312E;
	Sat,  9 Dec 2023 15:12:43 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40c0fc1cf3dso35734925e9.0;
        Sat, 09 Dec 2023 15:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702163561; x=1702768361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fyY7xuerRfmnEXL+mjQb56JPNlX5ZA5VFzoyWh1LMIk=;
        b=IOYBpsJPJJpKaHzIcA6RxIdtDQKYhYFNiFY0nVUhe+0LUqkW1dkbUExszHf2Dns9po
         q5ZFQosOe3ruiXtJ2GoPZVaLcdpPPuDV11FoMo3ncNzvuJUfNH4inJ0Q+DymZr4+pZsx
         IZO6VSM7VLv/zkQfWQ2XhM19V8Xak71ocY6lA1rEuVgTWpHqEcdvozGg+ZdXCPmhB1EN
         +EH3m7JrHF72a9mvbPlqS84O4IHMSWLCuDwN7rzU5i5HnQfDGu1hwm4NKkxOw9IeqRxb
         flnvuMP6IXAOrx5U1lSJfZ3vMawuGncZXkUxEmF6pc2QReGvjoolGSDLCzVZDATuleUv
         B1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702163561; x=1702768361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fyY7xuerRfmnEXL+mjQb56JPNlX5ZA5VFzoyWh1LMIk=;
        b=g2iQi3lV0mDanVHHFg9om/PWn37LZqUhc8swD6cfXNRc/W7unEzTdpVtYT6y67KXMJ
         YMvVM+UntxF09IgcTACsXjoXSIphSjtLVwDR7177u8QvFzoLebMAobAZh2ff4OeKGZd0
         5KuSLACAOy0wYZqd3HkVWUdT/8/WaSnC5jxiK0//FwIJy2e9DlNkG3yWpjjUgbl+H4dj
         rjoLNsSVWVnSq7c0Z7fR45JD5hFH+pGtHaKvSPW3XgSnW5ppSxK33OsyZLJ/Epq058dS
         rE5wLDC5520CY/18ldrSFJJQyE94Q6RuKc90FFZmt9JTjMnvppuRseRiZpG1Uv+dXfpU
         rDxQ==
X-Gm-Message-State: AOJu0YwLYyM1h0QUTK1YEVpQj0vaZ403rvr9hpzmktJRXQcgRUCvQA6u
	bwECiYvQssVRE6p4bcBNiNE=
X-Google-Smtp-Source: AGHT+IFdQhHVp2q3+OtY4B0AVXmBxuggoKt0nW2hBV9K4p3VmS1uZOxsooZUrel6k9hnzvgD0bYoDg==
X-Received: by 2002:a1c:6a16:0:b0:40c:25f6:4585 with SMTP id f22-20020a1c6a16000000b0040c25f64585mr991729wmc.73.1702163561253;
        Sat, 09 Dec 2023 15:12:41 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id w10-20020a05600c474a00b0040b2c195523sm10130953wmo.31.2023.12.09.15.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:12:40 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] iommu/apple-dart: Fix spelling mistake "grups" -> "groups"
Date: Sat,  9 Dec 2023 23:12:40 +0000
Message-Id: <20231209231240.4056082-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/iommu/apple-dart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 7438e9c82ba9..497a516747bd 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -911,7 +911,7 @@ static struct iommu_group *apple_dart_device_group(struct device *dev)
 
 		ret = apple_dart_merge_master_cfg(group_master_cfg, cfg);
 		if (ret) {
-			dev_err(dev, "Failed to merge DART IOMMU grups.\n");
+			dev_err(dev, "Failed to merge DART IOMMU groups.\n");
 			iommu_group_put(group);
 			res = ERR_PTR(ret);
 			goto out;
-- 
2.39.2


