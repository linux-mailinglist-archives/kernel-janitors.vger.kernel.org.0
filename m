Return-Path: <kernel-janitors+bounces-2805-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F350A8B4BCA
	for <lists+kernel-janitors@lfdr.de>; Sun, 28 Apr 2024 14:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AADBD28151D
	for <lists+kernel-janitors@lfdr.de>; Sun, 28 Apr 2024 12:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66CD96A8DE;
	Sun, 28 Apr 2024 12:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cpBo87EX"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9A353E0D
	for <kernel-janitors@vger.kernel.org>; Sun, 28 Apr 2024 12:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714308172; cv=none; b=pQ7aCrj7Ka3W9C93JnNXf86FxeDCtJ8Tjx98Qo2JY+VykO+3FRvXt+AqUTj9aDnzdMWvmmV2WOWXVUL98f/lxtRNyqgk4WyqXq2lfk2GUDhZ1KyOZly8bkelqSBgD6HPNNJV3TSRNqbxHepT+m8hvKNqPG3XQRUb1tDLX7ENM5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714308172; c=relaxed/simple;
	bh=k/iZvRfF4dcBdsWWF77jrzu9Aw/WjqQU12YZsvYi4a4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BoyUQT8dhjvG+9Uze/srdsLhgGTWapjdq6vcjW2XalKdGNO508vVmXM45iVeExKK3hxwV2P8dWcSI/fGxY0xdhXf0NRgMYcHet+TfNig/zGcDd8NWdgCKXJCp1SZE3OgcrPHhlY7JU7QkqiRaXUhokxuleN7msTRh3X7T+Ql7vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cpBo87EX; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a58989cd1f8so458910566b.1
        for <kernel-janitors@vger.kernel.org>; Sun, 28 Apr 2024 05:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714308169; x=1714912969; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ruxM04DcwSqc1+5CUH/yirqxxYT+4VUtJYzmah4p6Dc=;
        b=cpBo87EXt3WMgaxpNN31yxuUx0Rcol8oyoxwM47VajTb3LiRx4pgpBjdeYONHMET2O
         RFXgPINGMoAgUXJzEMHlVDVOE32Niqp5+OBHgouT1zeBajOiP2ncGH2Fr5tg6dg8ABc8
         /MCd4x5VxrTAFVPI6RfUi7T6zLaBCm06WmonKBoPmzSMF/Eg7DkuCKgoCL49w2gZTsK2
         a81yKfmYkE+BVXSddXZva9YgkWioOrifykpFaJvGvnBisaKgvbTbXTR3ZdGRe5v528z6
         Bys94BLFRNBtVkasyOvG8SWtFA3aGygFRGNuWr0ROjJ9ghKQc0v5jU66vm2dEyNAkdF2
         Iwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714308169; x=1714912969;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ruxM04DcwSqc1+5CUH/yirqxxYT+4VUtJYzmah4p6Dc=;
        b=OnCmu1cLkz1j9VAs+aY24RR4ifN9xk1aCFK2HnMNVl84ZI/L644oUZf5VyO6O8aazJ
         rbLcvbQIM4RcPfIjm8JvB3/kbfF00XvqsoLrZm8x03eMXNw4iFMRwDTZ4qo/sYOQvDC5
         U/Ik4QwdY0/dg5fcigdzOxszO7H28T4F7/vYEmMbwC9Z+9Tn8HS4IETlRgFxfp1aOXaU
         foBDIU0Ta2ZqwzQLnvzobWmaKfChqSj5vFPU3646nGQzhvFY7jOWOpeo6kByT+7Ozj7X
         PAHrh30Owv7AmOp5GYMrCCat1wCivLJXuPmXRAPobTNyW+ZCoCEJjDckWynqkXNv6gvD
         iFmw==
X-Forwarded-Encrypted: i=1; AJvYcCW1exl5TXKsT5bjmhUgyN0j+o9+F3lNC7EwpbFWBwFYY72xpHJhEwjG0319tUcikp76XJcsE2Vxcg5Tlh3907EcLUcXw/Wg+GcRPNqV3qZZ
X-Gm-Message-State: AOJu0YxS5M3gSg0FT/kku/NFkxHWaQp+bbCo2M8YrFYmS2pYnDSsLbcB
	WKTT4li7IfGnY7ccIbha0/4UpwFhVVX0P2Rh+mIkzIeiiDLCUMIFI/kKZEQ/xr4=
X-Google-Smtp-Source: AGHT+IFEmenVCstN3qRQ3VZod695J/pFmJ7LOK2zFQWoDBSbhtYZRvHLRnkehwSsSY/MkO5h5SEVWQ==
X-Received: by 2002:a17:906:a2d3:b0:a55:856b:5892 with SMTP id by19-20020a170906a2d300b00a55856b5892mr2957543ejb.30.1714308169136;
        Sun, 28 Apr 2024 05:42:49 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id b25-20020a17090630d900b00a5875b34b6asm6935689ejb.14.2024.04.28.05.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 05:42:48 -0700 (PDT)
Date: Sun, 28 Apr 2024 15:42:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/display: re-indent dpp401_dscl_program_isharp()
Message-ID: <2b0a61a0-baca-415f-aad4-7dc4cde73ef7@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch complains because some lines are indented more than they should
be.  I went a bit crazy re-indenting this.  ;)

The comments were not useful except as a marker of things which are left
to implement so I deleted most of them except for the TODO.

I introduced a "data" pointer so that I could replace
"scl_data->dscl_prog_data." with just "data->" and shorten the lines a
bit.  It's more readable without the line breaks.

I also tried to align it so you can see what is changing on each line.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../display/dc/dpp/dcn401/dcn401_dpp_dscl.c   | 93 ++++++-------------
 1 file changed, 30 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
index c20376083441..696ccf96b847 100644
--- a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
+++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
@@ -779,75 +779,42 @@ static void dpp401_dscl_program_isharp(struct dpp *dpp_base,
 		const struct scaler_data *scl_data)
 {
 	struct dcn401_dpp *dpp = TO_DCN401_DPP(dpp_base);
+	const struct dscl_prog_data *data;
 
 	if (memcmp(&dpp->scl_data, scl_data, sizeof(*scl_data)) == 0)
 		return;
 
 	PERF_TRACE();
 	dpp->scl_data = *scl_data;
-	// ISHARP_EN
-	REG_SET(ISHARP_MODE, 0,
-		ISHARP_EN, scl_data->dscl_prog_data.isharp_en);
-		// ISHARP_NOISEDET_EN
-		REG_SET(ISHARP_MODE, 0,
-				ISHARP_NOISEDET_EN, scl_data->dscl_prog_data.isharp_noise_det.enable);
-		// ISHARP_NOISEDET_MODE
-		REG_SET(ISHARP_MODE, 0,
-				ISHARP_NOISEDET_MODE, scl_data->dscl_prog_data.isharp_noise_det.mode);
-		// ISHARP_NOISEDET_UTHRE
-		REG_SET(ISHARP_NOISEDET_THRESHOLD, 0,
-				ISHARP_NOISEDET_UTHRE, scl_data->dscl_prog_data.isharp_noise_det.uthreshold);
-		// ISHARP_NOISEDET_DTHRE
-		REG_SET(ISHARP_NOISEDET_THRESHOLD, 0,
-				ISHARP_NOISEDET_DTHRE, scl_data->dscl_prog_data.isharp_noise_det.dthreshold);
-		REG_SET(ISHARP_MODE, 0,
-				ISHARP_NOISEDET_MODE, scl_data->dscl_prog_data.isharp_noise_det.mode);
-		// ISHARP_NOISEDET_UTHRE
-		REG_SET(ISHARP_NOISEDET_THRESHOLD, 0,
-				ISHARP_NOISEDET_UTHRE, scl_data->dscl_prog_data.isharp_noise_det.uthreshold);
-		// ISHARP_NOISEDET_DTHRE
-		REG_SET(ISHARP_NOISEDET_THRESHOLD, 0,
-				ISHARP_NOISEDET_DTHRE, scl_data->dscl_prog_data.isharp_noise_det.dthreshold);
-		// ISHARP_NOISEDET_PWL_START_IN
-		REG_SET(ISHARP_NOISE_GAIN_PWL, 0,
-				ISHARP_NOISEDET_PWL_START_IN, scl_data->dscl_prog_data.isharp_noise_det.pwl_start_in);
-		// ISHARP_NOISEDET_PWL_END_IN
-		REG_SET(ISHARP_NOISE_GAIN_PWL, 0,
-				ISHARP_NOISEDET_PWL_END_IN, scl_data->dscl_prog_data.isharp_noise_det.pwl_end_in);
-		// ISHARP_NOISEDET_PWL_SLOPE
-		REG_SET(ISHARP_NOISE_GAIN_PWL, 0,
-				ISHARP_NOISEDET_PWL_SLOPE, scl_data->dscl_prog_data.isharp_noise_det.pwl_slope);
-		// ISHARP_LBA_MODE
-		REG_SET(ISHARP_MODE, 0,
-				ISHARP_LBA_MODE, scl_data->dscl_prog_data.isharp_lba.mode);
-		// TODO: ISHARP_LBA: IN_SEG, BASE_SEG, SLOPE_SEG
-		// ISHARP_FMT_MODE
-		REG_SET(ISHARP_MODE, 0,
-				ISHARP_FMT_MODE, scl_data->dscl_prog_data.isharp_fmt.mode);
-		// ISHARP_FMT_NORM
-		REG_SET(ISHARP_MODE, 0,
-				ISHARP_FMT_NORM, scl_data->dscl_prog_data.isharp_fmt.norm);
-		// ISHARP_DELTA_LUT
-		dpp401_dscl_set_isharp_filter(dpp, scl_data->dscl_prog_data.isharp_delta);
-		// ISHARP_NLDELTA_SCLIP_EN_P
-		REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
-				ISHARP_NLDELTA_SCLIP_EN_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.enable_p);
-		// ISHARP_NLDELTA_SCLIP_PIVOT_P
-		REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
-				ISHARP_NLDELTA_SCLIP_PIVOT_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.pivot_p);
-		// ISHARP_NLDELTA_SCLIP_SLOPE_P
-		REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
-				ISHARP_NLDELTA_SCLIP_SLOPE_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.slope_p);
-		// ISHARP_NLDELTA_SCLIP_EN_N
-		REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
-				ISHARP_NLDELTA_SCLIP_EN_N, scl_data->dscl_prog_data.isharp_nldelta_sclip.enable_n);
-		// ISHARP_NLDELTA_SCLIP_PIVOT_N
-		REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
-				ISHARP_NLDELTA_SCLIP_PIVOT_N, scl_data->dscl_prog_data.isharp_nldelta_sclip.pivot_n);
-		// ISHARP_NLDELTA_SCLIP_SLOPE_N
-		REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
-				ISHARP_NLDELTA_SCLIP_SLOPE_N, scl_data->dscl_prog_data.isharp_nldelta_sclip.slope_n);
-		PERF_TRACE();
+	data = &scl_data->dscl_prog_data;
+
+	REG_SET(ISHARP_MODE, 0,	ISHARP_EN, data->isharp_en);
+
+	REG_SET(ISHARP_MODE, 0,	              ISHARP_NOISEDET_EN,    data->isharp_noise_det.enable);
+	REG_SET(ISHARP_MODE, 0,               ISHARP_NOISEDET_MODE,  data->isharp_noise_det.mode);
+	REG_SET(ISHARP_NOISEDET_THRESHOLD, 0, ISHARP_NOISEDET_UTHRE, data->isharp_noise_det.uthreshold);
+	REG_SET(ISHARP_NOISEDET_THRESHOLD, 0, ISHARP_NOISEDET_DTHRE, data->isharp_noise_det.dthreshold);
+	REG_SET(ISHARP_MODE, 0,               ISHARP_NOISEDET_MODE,  data->isharp_noise_det.mode);
+	REG_SET(ISHARP_NOISEDET_THRESHOLD, 0, ISHARP_NOISEDET_UTHRE, data->isharp_noise_det.uthreshold);
+	REG_SET(ISHARP_NOISEDET_THRESHOLD, 0, ISHARP_NOISEDET_DTHRE, data->isharp_noise_det.dthreshold);
+	REG_SET(ISHARP_NOISE_GAIN_PWL, 0, ISHARP_NOISEDET_PWL_START_IN, data->isharp_noise_det.pwl_start_in);
+	REG_SET(ISHARP_NOISE_GAIN_PWL, 0, ISHARP_NOISEDET_PWL_END_IN, data->isharp_noise_det.pwl_end_in);
+	REG_SET(ISHARP_NOISE_GAIN_PWL, 0, ISHARP_NOISEDET_PWL_SLOPE, data->isharp_noise_det.pwl_slope);
+
+	REG_SET(ISHARP_MODE, 0, ISHARP_LBA_MODE, data->isharp_lba.mode);
+	// TODO: ISHARP_LBA: IN_SEG, BASE_SEG, SLOPE_SEG
+	REG_SET(ISHARP_MODE, 0, ISHARP_FMT_MODE, data->isharp_fmt.mode);
+	REG_SET(ISHARP_MODE, 0, ISHARP_FMT_NORM, data->isharp_fmt.norm);
+
+	dpp401_dscl_set_isharp_filter(dpp, data->isharp_delta);
+
+	REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, ISHARP_NLDELTA_SCLIP_EN_P,    data->isharp_nldelta_sclip.enable_p);
+	REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, ISHARP_NLDELTA_SCLIP_PIVOT_P, data->isharp_nldelta_sclip.pivot_p);
+	REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, ISHARP_NLDELTA_SCLIP_SLOPE_P, data->isharp_nldelta_sclip.slope_p);
+	REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, ISHARP_NLDELTA_SCLIP_EN_N,    data->isharp_nldelta_sclip.enable_n);
+	REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, ISHARP_NLDELTA_SCLIP_PIVOT_N, data->isharp_nldelta_sclip.pivot_n);
+	REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, ISHARP_NLDELTA_SCLIP_SLOPE_N, data->isharp_nldelta_sclip.slope_n);
+	PERF_TRACE();
 } // dpp401_dscl_program_isharp
 /**
  * dpp401_dscl_set_scaler_manual_scale - Manually program scaler and line buffer
-- 
2.43.0


