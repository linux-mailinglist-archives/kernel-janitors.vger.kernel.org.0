Return-Path: <kernel-janitors+bounces-2931-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2B48BBABA
	for <lists+kernel-janitors@lfdr.de>; Sat,  4 May 2024 13:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65FFC28280A
	for <lists+kernel-janitors@lfdr.de>; Sat,  4 May 2024 11:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A961CA92;
	Sat,  4 May 2024 11:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u8tIGbUm"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3607C182B9
	for <kernel-janitors@vger.kernel.org>; Sat,  4 May 2024 11:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714821979; cv=none; b=Wlcd9o+9aIp0PjfVUyvjEPBIBmVIbkkY+f8ZWL31HF+eWQkTyfiR/iLZTq0+Mc4q7PzNhyzdY6FApgvdk+Oifcx0Ehv9gXAq7W6rWwAPYR3+/3sYlv7LlO153tos3juKkOlDJgkCtXFnD80VKGWxo1jvJVhKZxy6cA86iVnX2dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714821979; c=relaxed/simple;
	bh=q9hMV1BT9OJQ7HePS+PG9LFG1oZyrdoizmQncp9kOz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=klZL0h/8pWkC4Ifxbvw41ibUS0Fb0HV1kkW0JCYQcPqOdpDC/dBekf4y+9PO786HV4aMpGQcUhv6LUliGni1O2iSN/Nx3grb5hVCNkBNaUQ+HnGupzaLDxtKLx1+kM5GwgUUi+RpPZcyGka39PHIIrXHrJpeSBYgO05N/5NwBeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u8tIGbUm; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-34d7d04808bso336513f8f.0
        for <kernel-janitors@vger.kernel.org>; Sat, 04 May 2024 04:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714821976; x=1715426776; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=acScVzoT0UgSxQf+NXyCSZ3pQCph88n8DycCWGq+e7Q=;
        b=u8tIGbUmyYcGQntLcsxP8rRqauFoGukkjBqCzpRqW9uRldZbIUV5I8z4Vw3Y1sOrm2
         v/5KfgeKMXyeSr+KF6zRcAEfPPaWEJ98zJfPHs5Lb0Dz8GHuBLjinsgGQyjzlvfPAUQr
         eXO/wIe3RmpkS3vshAl1DswEtuuruCd6kmIema1I5HR8fYhNaqpraYsYh6i0y9E7/aU7
         RPMcGGFvKVckpEjynT/KTuQXdM4JI3wPR4B/iidowQmfD5T6i814X1hxeS7nLVcK87pQ
         aQk8GqMVT1xMITFfppPUVR3Hch1JOAYh2Dq776UCQbOJj0Qim/Y7ywG7OO4HjLvDICkF
         kF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714821976; x=1715426776;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=acScVzoT0UgSxQf+NXyCSZ3pQCph88n8DycCWGq+e7Q=;
        b=KyXQN5Q2cyaMehXLK6ISObiE6+Nk2MBM8vQxj7APU7Bt2Ktm2QMKfVhNUlUvLaHD5W
         JqVd6qDC76pkiFYVTNMTsTb2IQ8dFgkPrSXN67BncwMIx21ZtIaOL9Vc12IJAi5skETq
         7gdwX1HRN/5oBebbJ0UAQQ6XTsXnmPk+/r2rWC55MctCBZVZ5qVdD3z2jdJhN9IENy3l
         hOO2F/m9GqE4oz4b7lBgjK8CaFM5mMcZlR9nYys61NHR5OxDI4MgysWoUw/GLGei2wo0
         EpHqC8Z573CPaD2B9GGqxIdV/SNGK8s7/WPzqrbgEYu8f7rJRscZRLK3rRraVmGKSpr1
         ywpg==
X-Forwarded-Encrypted: i=1; AJvYcCXugsvUBYFSbug5P6wJX/bpw4lKjkIiw5JOnja47essUVtyukT8EV9tMUL3K2nsnqBym+3eu3EVQUsVZmBnoKd5/0T3xPkAXD/j765RINel
X-Gm-Message-State: AOJu0Yyn+JcIi/1N8NOfiMgyI86j5KhtCPk+g7OWcvvHnuyZTfuhGC9a
	HHkC8zLs0EBwkdb2XHDw9G/JcP2IYMOHRVoHP2jmKKVnZkr1xC74+VYdNCV372A=
X-Google-Smtp-Source: AGHT+IFhfIrzcRrSB3PRVXEa7IfD64x3DWvrLyolPJso7AtMaTEliUXy1Di5c3Y9F+bGsvZnwecfpw==
X-Received: by 2002:a5d:5542:0:b0:34d:1d09:f06d with SMTP id g2-20020a5d5542000000b0034d1d09f06dmr4990315wrw.13.1714821976417;
        Sat, 04 May 2024 04:26:16 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id p8-20020a5d4588000000b00341ce80ea66sm6013320wrq.82.2024.05.04.04.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 04:26:16 -0700 (PDT)
Date: Sat, 4 May 2024 14:26:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Evan Quan <evan.quan@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Tim Huang <Tim.Huang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
	Jesse Zhang <jesse.zhang@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/pm: Fix error code in vega10_hwmgr_backend_init()
Message-ID: <502fda28-fde7-4851-b17f-4d48848955bc@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -EINVAL on error instead of success.  Also on the success path,
return a literal zero instead of "return result;"

Fixes: e098bc9612c2 ("drm/amd/pm: optimize the power related source code layout")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
index 37c915d7723c..9b9f8615070a 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
@@ -924,7 +924,7 @@ static int vega10_hwmgr_backend_init(struct pp_hwmgr *hwmgr)
 
 	data->total_active_cus = adev->gfx.cu_info.number;
 	if (!hwmgr->not_vf)
-		return result;
+		return -EINVAL;
 
 	/* Setup default Overdrive Fan control settings */
 	data->odn_fan_table.target_fan_speed =
@@ -947,7 +947,7 @@ static int vega10_hwmgr_backend_init(struct pp_hwmgr *hwmgr)
 			"Mem Channel Index Exceeded maximum!",
 			return -EINVAL);
 
-	return result;
+	return 0;
 }
 
 static int vega10_init_sclk_threshold(struct pp_hwmgr *hwmgr)
-- 
2.43.0


