Return-Path: <kernel-janitors+bounces-1269-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DAB82C1D4
	for <lists+kernel-janitors@lfdr.de>; Fri, 12 Jan 2024 15:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD2591F24F16
	for <lists+kernel-janitors@lfdr.de>; Fri, 12 Jan 2024 14:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAADE6E2A3;
	Fri, 12 Jan 2024 14:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fg78jlqL"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B089A58AB7
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Jan 2024 14:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e68d836bcso2487725e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Jan 2024 06:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705069804; x=1705674604; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+wi6LxV5EZ0n10N9SHFswFNcko0BVzpNz628Oa0p9E=;
        b=fg78jlqLaXCKFa/ziQkns4T/jKeR0o2I/la2AMYIazf1zPwK/LCeaUge6Z3inIcb++
         Slx8xYafdHWNOKqWD1+Lcuarh0NJHuXdOrv8xCBI/QIKm1lv7FLtTMWffDnoEnVoMXyu
         ZNNJWI7p7FxtUA0nAEBCTZ2NUhiDKpWP8SbjjXWG77aTeuLCJ20VMrV30s5A0ZiIBl/Z
         NIe7I2wxR/XihVmjLVARsLYWTr/ogZ7TGalF7xOa95RaBb66LOqm6ZvhyXCTK6oH45kb
         1ZU1ptJPTvVyXJhKtRx08b60nZhPQPeeisZRrIwE81+QV38IS9SlvxEgE+iYl0AA9Fms
         7yKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705069804; x=1705674604;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z+wi6LxV5EZ0n10N9SHFswFNcko0BVzpNz628Oa0p9E=;
        b=vmd34VufLJB1Qs7+VaWx51K191GL9lGF66vhhMtb+jqgWqGZybOwV5pzaCqZN3q3K5
         iuCJdvYsie72CfD7BO9T67UinTk0LZtL6+bGAER7NPZqCZot8wFVei4mdMlvHjeI9KrW
         6gbAejN5ISVhn146oOvf7tjfi2B1A3y/0C+jSlujwOOpdFVYKYwTaHyUqKRkeiMkHSeV
         rwGiK8AXbOlgrKqv4y1WuP5rOkWQHMLdCadSkD7MqN9XKW2J2PuyIEr6YvpdeoNnFwpW
         cUboqe19tnAOKlOqN+R3pGJiFSMeNDcRKxtVVM2eMbljQGhdVqSSpKQjUctzk1H8+HCK
         cw8w==
X-Gm-Message-State: AOJu0Yy86jQqZ6lo2oYZuwSrHFwEkZFirSaPQrmtSfOpo90pfLU40MGv
	mGYAhzPWH0aoIBpBIc066K2UHKcOZlfgdg==
X-Google-Smtp-Source: AGHT+IFEpB1LZ1xc3CQ44FCbNbDdLXUyk9YByyFqv5s3twL1MZ7zUuKibTl7Ck+2HxkJODQhK7YCyQ==
X-Received: by 2002:a05:600c:4ecc:b0:40e:500c:23d8 with SMTP id g12-20020a05600c4ecc00b0040e500c23d8mr791947wmq.151.1705069804093;
        Fri, 12 Jan 2024 06:30:04 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c0a0a00b0040e4bcfd826sm6116088wmp.47.2024.01.12.06.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 06:30:03 -0800 (PST)
Date: Fri, 12 Jan 2024 17:30:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yang Wang <kevinyang.wang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: fix return value in aca_bank_hwip_is_matched()
Message-ID: <b311c5e2-ae9a-4558-a51a-a332d0fdfd9b@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The aca_bank_hwip_is_matched() function is type bool.  This error path
return -EINVAL which is cast to true, but it should return false
instead.

Fixes: 22a4fa4709e3 ("drm/amdgpu: implement RAS ACA driver framework")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
index 6074a529caf7..1d3ae7c241e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
@@ -182,7 +182,7 @@ static bool aca_bank_hwip_is_matched(struct aca_bank *bank, enum aca_hwip_type t
 	u64 ipid;
 
 	if (!bank || type == ACA_HWIP_TYPE_UNKNOW)
-		return -EINVAL;
+		return false;
 
 	hwip = &aca_hwid_mcatypes[type];
 	if (!hwip->hwid)
-- 
2.43.0


