Return-Path: <kernel-janitors+bounces-7227-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FF8A4958A
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Feb 2025 10:42:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B9EB3BB7BF
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Feb 2025 09:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3AD125BAAB;
	Fri, 28 Feb 2025 09:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fSkqxvqY"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372FF2571A9
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 09:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740735505; cv=none; b=XHLEIzyqscsYvclv+aACzXLYQ7k91KvLEJfcuPEgZxSge8xARRzv7y2ePDsjySad/iGLlRFeFMmrP+Hzt4/6h5++yn5Rx2Cy5XGKPo8bo3UvUCo22SjlJS1BWG+LP300+Nyp81rHdC+LwdBj0L3ft3P//XAXlV4roEZ5pjtOH+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740735505; c=relaxed/simple;
	bh=cXXYLWxWcETYA3JP92xi9LGJX/+09zhX17UC5Rt7H30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VyFSNHWc30ZWZ6of1hXRx81bpd7eo2z5Oh7elrUgyOvRPwgNJNHZRY/rVqUOUWSjRpXDbPXCs3oTUdfNo8ts3fmJGeOeGMzooPZEvhzovmyYfPPTC1t3E+C3oKqLVHRw1bOpUeRhuAJgig/F/AYq4m5OPamWHL2wGHC2N4EuJzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fSkqxvqY; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dec817f453so2783984a12.2
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 01:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740735501; x=1741340301; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kAbBHBzTpenwYQ3xIDx+RFfsaRXN6FerVlZhMl5YALM=;
        b=fSkqxvqYgyT28bH4q5/3FMvvvx4m53sFPcRW4zaQ0pV1TpSDLjpmAbrf9nYcHa0a3y
         Y86bm0cBb0jKIP+JJqyQSK8eyvJSHpRgNY+S7G6SbB1Cn+/ZkFDA0B7SGpWg0lu0uYEy
         RuT8h9LXu43yKRfYbL1Akh6EbSIGpctzE20ETHwUDKtqbnXtI5ySDeRsxvJvP16mqVd1
         BZbWU8Cmk/lQ+BU6eWbVkim6vBBXijo2UiSR2mtcO790h1XQmjxHT3zs+kozPGfc7oRo
         dRSyz/ZBoZovtnxmYtG8GvZQbi/3Fo70+I0YWW6nnqRLXWFdx965uQDivlTpTIh5m8iU
         q05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740735501; x=1741340301;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kAbBHBzTpenwYQ3xIDx+RFfsaRXN6FerVlZhMl5YALM=;
        b=ThfwLXCv35IfJmev4wLTpvhTb9BlLV7Fvzb1nTsSxMFXbRTNUAOeT8SW7+HjonwVmi
         E7pO2yl6oKmSrEy/zBlipnTpiU6fas1djF8KZkSnKPjgZB8hJshW3q1AxeCYw09SMRAp
         DWSccd2KBRkNRkFJvx45R9yNgtuUSZyrCywJ+SpSISrMEor7ni6it7zoQWXG/PBRx8SA
         8q9jInlE2Jmo2KgYUXeQFDzGv7Ax6yO5LU7dgMLkN0i5BKl7mCgRSVsDcSMSZd9lRNhx
         GAh/IEjmJV9Ekf6Y7IGryzP7k0FqJhBxrVlbFON7zh9OCi7Sm2IRJx0p+3bRFqqn6606
         i0ig==
X-Forwarded-Encrypted: i=1; AJvYcCVpCmpHwsdYmG0iFuu6Jq4xZ2gsNo32dM2CuEWpPYLLRFwBH3Z7rA/xD0koulrr4BMRJ7Wk/icHJ/+lC17n+J0=@vger.kernel.org
X-Gm-Message-State: AOJu0YziadNHtZHgYqw7rV/69t5yWyhbrx3opChitlcgCmKB8Oiox2TK
	Mu8aNt/qq2/IR19a/TkdsXadC4hTGW2fMwc8GA95y5eP6pNMxG57oUk7+3gwffI=
X-Gm-Gg: ASbGnct2umWMWemyd42+wee5a39cydQjLmQ8p2lG1OxneQo9lnleDcCvUoKGjXJ1Caz
	HDW56SDmvmT4eSK+rEQMn0Vd61QHcwgAkNPYgqrV4tJ4I++HXUtVT61iCE+G0ojzuu4V3zvxUcV
	Ix3jFT1ZSmnrt8qB2VOh8nsU0A+m80Cfph1oOIHyoWRMMXne2vEV/a6NUI/JMRKpZsPRf134fZf
	WYTEV86Q0slBjj5eHegKXGkhpVi0nk6fh18r9byyzVz4WmDep5oATJZgvdvALaVtuGwExOrDFbR
	KDEGi6ncQUiNb8fWR7+aCLsoVmcBLik=
X-Google-Smtp-Source: AGHT+IFG/wAFc+7a3BTiB3lyA+ckJ1OhlFHzEfmEQnuDRhG6Sr2tZqzqalibYqvITqld8TmExotXDg==
X-Received: by 2002:a17:907:2d8a:b0:aab:9430:40e9 with SMTP id a640c23a62f3a-abf2659d531mr240459266b.32.1740735501401;
        Fri, 28 Feb 2025 01:38:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf0c0dc5ebsm263013666b.73.2025.02.28.01.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 01:38:20 -0800 (PST)
Date: Fri, 28 Feb 2025 12:38:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/vc4: hdmi: Fix some NULL vs IS_ERR() bugs
Message-ID: <a952e2b4-d4b8-49ac-abd9-9967c50f4a80@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_platform_ioremap_resource_byname() function doesn't return NULL,
it returns error pointers.  Update the checking to match.

Fixes: b93f07cf090a ("drm/vc4: move to devm_platform_ioremap_resource() usage")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d20e5c53ba75..37238a12baa5 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2928,8 +2928,8 @@ static int vc5_hdmi_init_resources(struct drm_device *drm,
 
 	vc4_hdmi->hdmicore_regs = devm_platform_ioremap_resource_byname(pdev,
 									"hdmi");
-	if (!vc4_hdmi->hdmicore_regs)
-		return -ENOMEM;
+	if (IS_ERR(vc4_hdmi->hdmicore_regs))
+		return PTR_ERR(vc4_hdmi->hdmicore_regs);
 
 	/* This is shared between both HDMI controllers. Cannot
 	 * claim for both instances. Lets not convert to using
@@ -2946,33 +2946,33 @@ static int vc5_hdmi_init_resources(struct drm_device *drm,
 
 	vc4_hdmi->cec_regs = devm_platform_ioremap_resource_byname(pdev,
 								   "cec");
-	if (!vc4_hdmi->cec_regs)
-		return -ENOMEM;
+	if (IS_ERR(vc4_hdmi->cec_regs))
+		return PTR_ERR(vc4_hdmi->cec_regs);
 
 	vc4_hdmi->csc_regs = devm_platform_ioremap_resource_byname(pdev,
 								   "csc");
-	if (!vc4_hdmi->csc_regs)
-		return -ENOMEM;
+	if (IS_ERR(vc4_hdmi->csc_regs))
+		return PTR_ERR(vc4_hdmi->csc_regs);
 
 	vc4_hdmi->dvp_regs = devm_platform_ioremap_resource_byname(pdev,
 								   "dvp");
-	if (!vc4_hdmi->dvp_regs)
-		return -ENOMEM;
+	if (IS_ERR(vc4_hdmi->dvp_regs))
+		return PTR_ERR(vc4_hdmi->dvp_regs);
 
 	vc4_hdmi->phy_regs = devm_platform_ioremap_resource_byname(pdev,
 								   "phy");
 
-	if (!vc4_hdmi->phy_regs)
-		return -ENOMEM;
+	if (IS_ERR(vc4_hdmi->phy_regs))
+		return PTR_ERR(vc4_hdmi->phy_regs);
 
 	vc4_hdmi->ram_regs = devm_platform_ioremap_resource_byname(pdev,
 								   "packet");
-	if (!vc4_hdmi->ram_regs)
-		return -ENOMEM;
+	if (IS_ERR(vc4_hdmi->ram_regs))
+		return PTR_ERR(vc4_hdmi->ram_regs);
 
 	vc4_hdmi->rm_regs = devm_platform_ioremap_resource_byname(pdev, "rm");
-	if (!vc4_hdmi->rm_regs)
-		return -ENOMEM;
+	if (IS_ERR(vc4_hdmi->rm_regs))
+		return PTR_ERR(vc4_hdmi->rm_regs);
 
 	vc4_hdmi->hsm_clock = devm_clk_get(dev, "hdmi");
 	if (IS_ERR(vc4_hdmi->hsm_clock)) {
-- 
2.47.2


