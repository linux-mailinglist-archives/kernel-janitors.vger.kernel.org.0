Return-Path: <kernel-janitors+bounces-8518-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF1FAF1627
	for <lists+kernel-janitors@lfdr.de>; Wed,  2 Jul 2025 14:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18C104A6581
	for <lists+kernel-janitors@lfdr.de>; Wed,  2 Jul 2025 12:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A645275112;
	Wed,  2 Jul 2025 12:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bzU1HxKK"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405D225E824
	for <kernel-janitors@vger.kernel.org>; Wed,  2 Jul 2025 12:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751460916; cv=none; b=kik8n5oeguz1PNQ8yQr0x394bNWK/CHKCN21bobLyyB0vWLuTusYNFLNGb6ydXHx+W9vBQszcQrIYemGk1F4jF9ZDnEL64GJ3+OViMAxNy/d7mtZb0zps/ViqJKBvJRWb8vbMVK6BakYNz5eDtuyVTryw0YQtwNsOwm13uAE3wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751460916; c=relaxed/simple;
	bh=mM64/l+BoAfrZDnKLhvKyOQO1tYBWKk29YEAVmVFW5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DnQv8yr7bZPqIfIISeR5alII/zMzEv9ze//m3Qiwynf0/+Cf8vq57D5m5EdW0zTbEdssDxPziSYXyltgvMXq9PZ6Mw6cBfuCCbCWgUZHcr2NMIdNvBNTgvyUHQu19L+8laaGIIaSYMYnIlOuvkEpINhj2cnoaNmPUK0W6TSa81I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bzU1HxKK; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2ef8df09ce9so2171791fac.1
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Jul 2025 05:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751460914; x=1752065714; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NmMXignAcgy9m6Sf/k76zsomjXcz7tyoG6UG//CdDIU=;
        b=bzU1HxKKRVGr9UPj5EMkLH9JvDJxkUxJPexxVtxiEtPnauAC2V3e7bFSU/1YNkfoW4
         dxtZUqTTjUVppnIFUz5IGijXCBEz92LLIVlYGqesZAdyay0H/9EO2cMx2OJDZuDO7cEY
         8fByr9irjKSnnYvcwk9dwcCqpo3VkSebWTWpqhXBvFuEk03KYHUw0Yq76PXsarhmOpVV
         EwBGfIAx3r7ehMIsUP6NqXWWLRip6MZgSSLzxoucocaSkjsDEeGmB4CJFYOldLs3CMvV
         G72wQZ1+74ZR/ZuD63eiNvFAt7XZB3ws/ewOiCgTm0M2Tcbqzt6juon0M4nVit/GrKa9
         qAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751460914; x=1752065714;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NmMXignAcgy9m6Sf/k76zsomjXcz7tyoG6UG//CdDIU=;
        b=VV+BWFN1RIod4elE4F1Qs/DVczlbIgTbRCLeTgEvCJjFWtUUF+gw6vMmM+nfrQMuVx
         yKZMhs4BqByrpcDvnpHLMyECiCsJ99RwAhBwbJi3LnREVitw9I68n2wLtTOwR8IYfz7P
         BSEOa+5cgchaRNTMFx2u6YT/LqdW+kj4CuCcGwI6b7bstJ5jiOCNYb8BtI011lu5biU/
         F04I9UU68mFXTyR9Igb1lIVo3rIIm6nkT/X28fFIOFsTGqwBSlGdvkOWgnbbWMr/1c1O
         V74jMEkGKijTvhDYQEcQbYm8zbCw1qhN97698Jrk8/kZBrQZJb27172nn3ERg9i/E0bB
         BkvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU29Qn5Vdq0r+X0jRxH2r+B9WHFHNuWq6hLqF4PCK2Yzt08A5mTyrshylvdP13pt4K/Q8bT7brR6aqJufHA5cc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfO5n+Aq4reSF43rjWXeoiv4wM8Mu6ynpfb/WxE+HqGRCu/ZMD
	bOXzPWTlU2lbS7ZHfDiVwt2gjMXah5ut48UQQr7YNf2RKNmBlygu0Zb0LcJBiqO3HVU=
X-Gm-Gg: ASbGncvBrlHDXLW0709gATVNX6FT32O8Ju6k8Sp+Hgsteu2PfxQaJdItIerOZ8oAvLI
	JqhVWhmZVtJyO+go+2JZv0MXqzOdzhOa30cm3yXa3kmQbtDCQJmnsvo2AD83WkKVeBVZOdqVD0M
	AlP/nWLv07fnQK0eSWmxK5HtuabEB9BAwuHyTpF24+PrbkmjLfOvH0stXymsC5KNUJTo3ZE00Ox
	bCrNKA4g/Mr6wOqzSsrqEso9jJHJvcDz81Gljb5aaCSS48TpRG801Ltx3defwfdrtJAbtEPfIHK
	1TMkw2QC4FeQd2Ie5B1tARYas9adhnA2ROMapiY/tsgBhLNj61/viU2jx04vy3Wr3FRYd2IOJiS
	Uk0fX
X-Google-Smtp-Source: AGHT+IGcYN9rPOHHdQ7PsgYM3Fqg0wPgCuGzQFBF1b+DB5bmZT4Xud99Stxy6A9dj5LlWMYjIyWJnw==
X-Received: by 2002:a05:6870:3d92:b0:2c2:cd87:7521 with SMTP id 586e51a60fabf-2f58890100cmr1816505fac.4.1751460914344;
        Wed, 02 Jul 2025 05:55:14 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:93a7:d85e:d088:8154])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2efd5145967sm3792144fac.49.2025.07.02.05.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 05:55:13 -0700 (PDT)
Date: Wed, 2 Jul 2025 07:55:10 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Arun R Murthy <arun.r.murthy@intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/dp: Clean up white space in
 drm_edp_backlight_probe_state()
Message-ID: <30b896c2-ae71-4cf2-9511-2713da7e1632@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code needs to be indented one more tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index db7896c7edb8..1c3920297906 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4245,14 +4245,14 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 					    "%s: Failed to read backlight level: %d\n",
 					    aux->name, ret);
 				return ret;
-		}
+			}
 
-		/*
-		 * Incase luminance is set we want to send the value back in nits but since
-		 * DP_EDP_PANEL_TARGET_LUMINANCE stores values in millinits we need to divide
-		 * by 1000.
-		 */
-		return (buf[0] | buf[1] << 8 | buf[2] << 16) / 1000;
+			/*
+			 * Incase luminance is set we want to send the value back in nits but
+			 * since DP_EDP_PANEL_TARGET_LUMINANCE stores values in millinits we
+			 * need to divide by 1000.
+			 */
+			return (buf[0] | buf[1] << 8 | buf[2] << 16) / 1000;
 		} else {
 			ret = drm_dp_dpcd_read_data(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB,
 						    buf, size);
-- 
2.47.2


