Return-Path: <kernel-janitors+bounces-1798-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CD385B68E
	for <lists+kernel-janitors@lfdr.de>; Tue, 20 Feb 2024 10:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D949028A392
	for <lists+kernel-janitors@lfdr.de>; Tue, 20 Feb 2024 09:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CDF604AA;
	Tue, 20 Feb 2024 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xq1yixNs"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14385D48B
	for <kernel-janitors@vger.kernel.org>; Tue, 20 Feb 2024 09:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708419761; cv=none; b=CCBHBLgMxdwWbIgrnNQsV58toBnzCCUSyMg7nHuXQFMWBNBPqlus70p5FX5MwkkxH0kXAP7MFpvkXqbiul5YyW15e6oX/soJM7N9uEEb9nDG+eYNtq0YT3KMsplXAaD/X5tfrtdKOXFnJYPUPGgdlRdVAomoc+jftVitg9I5evY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708419761; c=relaxed/simple;
	bh=SgoqViaaje+AgC+n7ivCHYAc8WaXGdnEMAxju39c9XY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QfQm2lsI08U/vpIUIjSzdJuuYbYRAIoxXhNVbto4XGEWBkbs5B0D7gO2M9Lh2VxK7calgeYOfyBsR93SnKsZpMTtBwD8rDA2O/+N8NKGLQEQxSjUap5cwepgVxu+jonvYh7ljIAPJF1W49KXDjq+fuR2KbaRR+Gg52M5ZFeinGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xq1yixNs; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3e891b5e4eso203757666b.0
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Feb 2024 01:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708419758; x=1709024558; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c2ULPGAo97hdg1ZsQ6jr2biEBRsVNCZw09zaItnJf/I=;
        b=Xq1yixNso7pw/x5t8IT/f4qOdwR+izJKKj3NoXGeM9aPT4+Y3NB/L0BShKiZE1YuBj
         p7j9E6g6mQj7FcNOV+bbuuaadA+u2XHa7DQ8Ozz6H5YZW5zC21pzl+VLx9U2UWrOAZ9p
         9Y1RM7qjagL1Xv9Zu+UhUPN870GVG/00GRrfnfVbMPGfPX/m86fhH15OmFkUdcAjCk0y
         N+K952V2wtAez61gwBi9T476OzfOBNf+naXLOP+mJDsN7u/8oJOp3cgEmywy8k2QFlGY
         gbonEHErW1zZIp/4loFJ7CGm8obBIU12h5OHtKeinJDtfHfdbWQ71ocPJrmlHukjutid
         0PpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708419758; x=1709024558;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c2ULPGAo97hdg1ZsQ6jr2biEBRsVNCZw09zaItnJf/I=;
        b=tkTTr70H1vIXNOECfVqObwW52brfESLynTWzm0WFae3amPuedMfTe8i+FQbsgsuG5V
         Z5Gt9pKYOon4I4ZrrIcMWX0W+jv6cBlWKpSIyuxFpVJi+HZDEEXYPosFwdqDEvIt79wO
         syHGCGeFibND+4rh2f3IqCp8Boc9HoG9uVNnHFqWVheeOFgNhDAc/lAVVTd+UOQqJS3O
         U+TeCN7IIz5PyvKRBwXuwKjpFossiHgWV2KGo/AbB4asynC3Cn49AHuFmI7DkeI7EF2P
         6lV5eYPCBrhNZeu0rINYMcskKmS98ucWsGSknm/m6n06reMMr1bqiSe1vbv5ICc2oyQC
         nuOw==
X-Forwarded-Encrypted: i=1; AJvYcCVi2Ue6HKEg1Or3rXkGXhGoQ8SC06mQZqHLmnx+FW0Sf2BBIbVo8XZwUY/d0RLCqMX+wsbZ7RCoaOi4+cLOS40v2ljedMBsMtGyrwyK8yH7
X-Gm-Message-State: AOJu0Yx33LDy/NRDSobd2dPFUG6oa13Naka9MyuHIgiQUbkTFju9newG
	1k8mNPHT9jUuK92EuJv0vrGJwVB/7o3VYYRICgwWeehy4sJ8d+XFpZf5JNqXhoo=
X-Google-Smtp-Source: AGHT+IGgsUZUBFncC+mK5wmv+K0Z3E1af7GlrV1iQKeWxOP7lFLcUK6IrhElSY60RHx27sQUgvqCKA==
X-Received: by 2002:a17:906:e2d0:b0:a3f:14f5:2f87 with SMTP id gr16-20020a170906e2d000b00a3f14f52f87mr91187ejb.42.1708419758047;
        Tue, 20 Feb 2024 01:02:38 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ha1-20020a170906a88100b00a381ca0e589sm3746733ejb.22.2024.02.20.01.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 01:02:37 -0800 (PST)
Date: Tue, 20 Feb 2024 12:02:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] char: xilinx_hwicap: Fix NULL vs IS_ERR() bug
Message-ID: <ef647a9c-b1b7-4338-9bc0-28165ec2a367@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_platform_ioremap_resource() function returns error pointers.
It never returns NULL.  Update the check accordingly.

Fixes: 672371832193 ("char: xilinx_hwicap: Modernize driver probe")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/char/xilinx_hwicap/xilinx_hwicap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/xilinx_hwicap/xilinx_hwicap.c b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
index 019cf6079cec..6d2eadefd9dc 100644
--- a/drivers/char/xilinx_hwicap/xilinx_hwicap.c
+++ b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
@@ -639,8 +639,8 @@ static int hwicap_setup(struct platform_device *pdev, int id,
 	dev_set_drvdata(dev, (void *)drvdata);
 
 	drvdata->base_address = devm_platform_ioremap_resource(pdev, 0);
-	if (!drvdata->base_address) {
-		retval = -ENODEV;
+	if (IS_ERR(drvdata->base_address)) {
+		retval = PTR_ERR(drvdata->base_address);
 		goto failed;
 	}
 
-- 
2.43.0


