Return-Path: <kernel-janitors+bounces-630-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F1580B6FB
	for <lists+kernel-janitors@lfdr.de>; Sat,  9 Dec 2023 23:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 721F61F2102F
	for <lists+kernel-janitors@lfdr.de>; Sat,  9 Dec 2023 22:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D241DA4B;
	Sat,  9 Dec 2023 22:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TymjYtaP"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F1BBF9;
	Sat,  9 Dec 2023 14:58:00 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-333536432e0so3071151f8f.3;
        Sat, 09 Dec 2023 14:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702162679; x=1702767479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QAIlBevUevXrKEyLl8WmeuOwp9gUqiZZAn2K412EKIM=;
        b=TymjYtaP++jhqMgtZ8/aBolHA0TMUs2tgfdvlV0YU410UaSpQS9BGgwsVmia82pk7h
         U7DUZfa/Qudd/qUpt/J1d+25hERrIRfUyfzZ+UdNSW6udB7Aeaq+dCXMxY+n+hT+eQfz
         Z3RBgsFUxAAjo2ZwJTLHelxG5f2qQVsv3UUUfnuIN8ymJV+04WrKSYAEElh4uhndr9OI
         IHmQxU61+JYKzZKVwQaqNxCRR1Dgk/6Rrqi/LrzIH2hMbHxqVz82XbdsFqplVupUPOk+
         FC4Yxx2a+kpi+5vIJm0F1oWyKLciHa++lSo+tiTLAwMkt6jKdf9XFNORYGzaf6GhyXlV
         zv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702162679; x=1702767479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAIlBevUevXrKEyLl8WmeuOwp9gUqiZZAn2K412EKIM=;
        b=e1p6PprXuL5Z7HABD083S2NgYO++NbBAp4vexBUpgXFmaaVGAWb5tZg3STbdmYS4OT
         Tq4tVpRcC4wm3SnNij1VKttUYxDal3MbQGp0PypYqYSvrHcCdXxQTX1K5lQQq+AnRaA2
         jarK7SmcnyeQxLUaVzH08lufjuV5gzcmbA7NTAV7SZKVj5nBK/rc4kN3J2OVXC+fTrBO
         ZW3QMG71mqSMNp7hP68F1B0RALY2Ju8e2UcwfgbhC5dD73zcL+uzZOYt5rGVqUWjPg1e
         ELBEY3AZ2MmmxAsxno1h4M6MeqinGELuoGKYqEg/5BxmbJaoJL2whyYG2gh/Bc2nFi93
         U5Cw==
X-Gm-Message-State: AOJu0YzIS+4fWkuaNN2jaZVu3yiMfCmk7UbzsnANso+ggSVJvU9AHQOd
	ehCddqo1hq0/cLevA79G1qQ=
X-Google-Smtp-Source: AGHT+IFt/dBTIsv2RLCWFXFYS2R03MC1rIRuWdn7TJMPqHYH/7C4VL61To6xzKEvyIR6M/UPChvjUA==
X-Received: by 2002:adf:e98e:0:b0:333:218b:cc88 with SMTP id h14-20020adfe98e000000b00333218bcc88mr1239905wrm.68.1702162678871;
        Sat, 09 Dec 2023 14:57:58 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id a9-20020a5d5709000000b003332aa97101sm5179380wrv.38.2023.12.09.14.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 14:57:58 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/gma500: Fix spelling mistake "patter" -> "pattern"
Date: Sat,  9 Dec 2023 22:57:57 +0000
Message-Id: <20231209225757.4055520-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a DRM_DEBUG_KMS message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 8992a95076f2..2c7d0416e623 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -1548,7 +1548,7 @@ cdv_intel_dp_start_link_train(struct gma_encoder *encoder)
 	}
 
 	if (!clock_recovery) {
-		DRM_DEBUG_KMS("failure in DP patter 1 training, train set %x\n", intel_dp->train_set[0]);
+		DRM_DEBUG_KMS("failure in DP pattern 1 training, train set %x\n", intel_dp->train_set[0]);
 	}
 
 	intel_dp->DP = DP;
-- 
2.39.2


