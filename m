Return-Path: <kernel-janitors+bounces-1272-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC51E82C1DE
	for <lists+kernel-janitors@lfdr.de>; Fri, 12 Jan 2024 15:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 874581F229A1
	for <lists+kernel-janitors@lfdr.de>; Fri, 12 Jan 2024 14:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE196DCF4;
	Fri, 12 Jan 2024 14:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YzKXqoh0"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BA257322
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Jan 2024 14:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-336990fb8fbso5144079f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Jan 2024 06:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705069873; x=1705674673; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aw07nAMv5oGDdJtDs7MOtSYaErH1ufSaIcr/61fVq1Y=;
        b=YzKXqoh06uLU1EhdpA2dr7mGNxUR+54SGsl54pWC4Sq5XMlGSk+pXhc/rHuJGkQowr
         p+23lsKidUU5LavhbfEBEoL+DiG7EAPjcGDyHvssBIrfCeKuxZBHOY1McGMhjomWctfv
         kZSL9TSkXBuHldkT8UTL7JzrkKHcw7MAbZtkVz/7W3QeAnHF8cAI3I2EYsURko4BrJDv
         BOXUf91B3aRwD8myeawLnPz4w2avki/mQMFHNncRxvUvMuG0pdWWiaJNnfTO3k0Txi8A
         BfBfHRgWFXvgz8z8gwALtXTIvLYNylaOXdl+65pputRuDq5u/QQJjI/grBbQBKpbocpa
         lVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705069873; x=1705674673;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aw07nAMv5oGDdJtDs7MOtSYaErH1ufSaIcr/61fVq1Y=;
        b=AJPdTLrCO+3k2f1unz6tL4k0mrcKXbDNZgl20/TYtHkjiDfpMBv+zITzLQdzSgljkG
         8UQJrtsBsEXEfKkjpeuOskFT2Yg/ziKCnPDR/clljsuj0Vl9iwK7zjfLnJIxag18rZCs
         ok6Er3E5YM3Yurg9b21w6E69kvRzKB8nx3UFsL8Ypbv6QZgPWrX2pmRnQmuCmYUtH52P
         34LX/85sLmr5UHkmeTVtqYQ7dza0MwwRnEXH82yEvQyHIaTFPOG04sq9THuDAjCGl9sO
         gCijCckoK/2e/nvWRhkPkg9tfRxFwr3X3jzy0vni6jETecYc5axPG/5xYi6xo2OFIEhs
         z3jA==
X-Gm-Message-State: AOJu0YzIccP6Lc/1yc3RgpXRETTSBUV8Y3O/zlbY2LkklAbt420uL0aU
	N8KXamFP/dE3vNq6DNNdzQUhIP+XMeO5tw==
X-Google-Smtp-Source: AGHT+IFXMCPqgdEgsPkqLjC6vO/Vvti/WhxuK2GBHGBXb1gKi2FF2DFsgVScc5hicSE+pHcaXwfSew==
X-Received: by 2002:a5d:590f:0:b0:337:7680:8ccf with SMTP id v15-20020a5d590f000000b0033776808ccfmr817239wrd.56.1705069873001;
        Fri, 12 Jan 2024 06:31:13 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id x9-20020adfec09000000b00336b8461a5esm4028872wrn.88.2024.01.12.06.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 06:31:12 -0800 (PST)
Date: Fri, 12 Jan 2024 17:31:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Airlie <airlied@gmail.com>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
	Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/nouveau/disp/r535: fix error code in r535_dp_aux_xfer()
Message-ID: <5e2be90e-c7b8-4366-ab93-69040734742e@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code was shuffled around but the return wasn't updated.  It should
return "ret" instead of "ctrl".

Fixes: 4ae3a20102b2 ("nouveau/gsp: don't free ctrl messages on errors")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
index 6a0a4d3b8902..027867c2a8c5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
@@ -1080,7 +1080,7 @@ r535_dp_aux_xfer(struct nvkm_outp *outp, u8 type, u32 addr, u8 *data, u8 *psize)
 	ret = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
 	if (ret) {
 		nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
-		return PTR_ERR(ctrl);
+		return ret;
 	}
 
 	memcpy(data, ctrl->data, size);
-- 
2.43.0


