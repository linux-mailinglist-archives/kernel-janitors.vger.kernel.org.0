Return-Path: <kernel-janitors+bounces-556-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3668032A3
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 Dec 2023 13:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1F7FB20AC0
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 Dec 2023 12:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C0F241ED;
	Mon,  4 Dec 2023 12:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iK8gKI8q"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A942113
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Dec 2023 04:29:34 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40c07ed92fdso15152915e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Dec 2023 04:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701692972; x=1702297772; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5jtRzLSN1qiD5ViHrLDUVaEvxomgxXY/Nh4KNz8w1+w=;
        b=iK8gKI8qJwQOgB/m2v6pIIxBm7uTScfF6I/99ACl6aw6x4BWPm3D1EWnRWZcEZZ+42
         sRu0NKGbe+nIxsni0/dWewg1HJ1uEFq3nCaaoHY3G508XNzd0I1Ct3mOspnVlATGgQPq
         yR0vk96s6R4A2jDWbXdBMEutkGkW5O2Je4hhWcJseTcPVPtudTVKwoo8bPbt3iqyt/OL
         XbjFRKwZhejRtl9BF/7EF54buFlzuDUeGxadq/NYvb8w9t+NxKvGwgHlZc766EGRn7Wi
         a1ebOM8O4dhwwp40Cemd5CPGCgVmnno3j2t4djArIAdFh1zEO7JHtS1hOAyqeykEXrYN
         PX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701692972; x=1702297772;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5jtRzLSN1qiD5ViHrLDUVaEvxomgxXY/Nh4KNz8w1+w=;
        b=v635qsSbBNowKi4UdlOB1XtygsslEWaGSx52sl6i4fbdqcZESzAvJmzkbjrClUCJ6o
         VI5yWYYYAfp230z/64Ev/XOiVGvfEsivPbgJoNsetKLpXAz8MjYqxNA63/30VdGEi3wR
         TvIHtxYEM9xYE/trpcoOSkgDoxQvrQvxlQnY2qg2SC6uPtEABTUOD/e6c/gS/wmO8OjE
         RZ+GresAvgg+ruVrCURr1TEwVXyYUOJlRjUZyaCi8LICeQ3In9h/ULsZQ6IxctSBvDkA
         EtVMK9m2uNsNJRhJXgH542eHR1yfFa90hKKwLmqcdOe3e41qlaO0GwkDRoyIeI++N/3h
         EJ/w==
X-Gm-Message-State: AOJu0Yxg+PhCO6mLrVgA14G8CGdey7z9tQ/a9tGh3iYySkhP67lyedMe
	pf0PG9RWlfQuViJJQY7DI0coag==
X-Google-Smtp-Source: AGHT+IHeQU6ukVh6qvTvC91E/9AZ9tQzE96+lLjiDnPYJUypYWxHlpietrEODuWPZuVKx1JlmTZr4g==
X-Received: by 2002:a1c:7508:0:b0:40b:3566:e54e with SMTP id o8-20020a1c7508000000b0040b3566e54emr2517759wmc.39.1701692972469;
        Mon, 04 Dec 2023 04:29:32 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id cp6-20020a056000400600b003334520e49bsm3763015wrb.53.2023.12.04.04.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:29:32 -0800 (PST)
Date: Mon, 4 Dec 2023 15:29:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86: x86-android-tablets: Fix an IS_ERR() vs NULL
 check in probe
Message-ID: <4b1b2395-c7c5-44a4-b0b0-6d091c7f46a2@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The spi_new_device() function returns NULL on error, it doesn't return
error pointers.

Fixes: 70505ea6de24 ("platform/x86: x86-android-tablets: Add support for SPI device instantiation")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/x86-android-tablets/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 6a5975ac3286..f8221a15575b 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -220,8 +220,8 @@ static __init int x86_instantiate_spi_dev(const struct x86_dev_info *dev_info, i
 
 	spi_devs[idx] = spi_new_device(controller, &board_info);
 	put_device(&controller->dev);
-	if (IS_ERR(spi_devs[idx]))
-		return dev_err_probe(&controller->dev, PTR_ERR(spi_devs[idx]),
+	if (!spi_devs[idx])
+		return dev_err_probe(&controller->dev, -ENOMEM,
 				     "creating SPI-device %d\n", idx);
 
 	return 0;
-- 
2.42.0


