Return-Path: <kernel-janitors+bounces-1023-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8AE821C43
	for <lists+kernel-janitors@lfdr.de>; Tue,  2 Jan 2024 14:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E224282932
	for <lists+kernel-janitors@lfdr.de>; Tue,  2 Jan 2024 13:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C98F9EF;
	Tue,  2 Jan 2024 13:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="figEQ5Yr"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC0FF9D6
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Jan 2024 13:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40d89446895so6766715e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Jan 2024 05:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704201025; x=1704805825; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uowTUjLxrj5pVd1k89+sk1irYGIPwxkoZlQeDZRpdQg=;
        b=figEQ5Yr6raSC6f2I8z1J4R0+eNsuyrmweROQ79Hy0Rmy8aTENSYYXEWccGN4IeVZt
         Qrn/atllJPNTa0dJefjhccCWIcf+Qfg33MLULvjhGZm2DWjrSTWMVY/Z9vP7WUU5f/Nf
         lo4ArhPaD8kHp+y+w6e7gkEZ3WrC74h2cCAaVZgpOZhCx0D1F/iq+HtA2NjnpTbm/4RH
         7FEhfAa2Px0Li3vD97TFuH4Ugaw+Rl8xDoSr7eG02YnGJOUk20nFoL9WKfpXXIyaFXi8
         BgP/ROJNpn5hnzMxVq5hox1VG/dQEzV8Yo8FjbKrJj3s/Ndo/AIpVIwqegDhQxCcP+CA
         Cxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704201025; x=1704805825;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uowTUjLxrj5pVd1k89+sk1irYGIPwxkoZlQeDZRpdQg=;
        b=dGxV7L7x7w8sMURxzCIVP7+It+E3poFYye3Hy1nZQ6DhQ8BnFX60LDYkP+q8Z5GFm/
         3lXI+a43e8O3R4rzmOE427zyxcyraURfNpweKtq0UN9zXD/upozPRgm+yLGBzapljtEt
         xUUhiEawfWMwRL5PPxH4trxSaCNiUq0OJeBmKBzqHp9KF+uslLA6SPlfHOJ9dyqPIVUp
         3DlPjvRq6OACJg4Ig3zh7upzJM288Eb1y+9W+A6LZJzEMO1SyOwLjpAsgtxurXeOxibu
         xhszd5/F/ZR5L0koYIpTi9ClOIYhjEOZIVeWmTNmQEpre/COEI525Xs5/7Uct+ok8B8E
         1a+Q==
X-Gm-Message-State: AOJu0YyNDcMF7HCHmtrUSw3TnUKxTYDpqrNKY1bemvv4R4bYFcJdzoQn
	FBldFBA6teYYZ9mO0CaWQ0jxoNZdKrrGjA==
X-Google-Smtp-Source: AGHT+IEoN+ebHJooT4EFia3vvux4q4QYo8ANuuld+tcBrJj7L3tqLsmg4Zf3Hx240ew4nQq4WWIkzQ==
X-Received: by 2002:a05:600c:998:b0:40c:6c8e:8b7c with SMTP id w24-20020a05600c099800b0040c6c8e8b7cmr8100998wmp.55.1704201025149;
        Tue, 02 Jan 2024 05:10:25 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id ay23-20020a05600c1e1700b0040d8d11bf63sm1884557wmb.41.2024.01.02.05.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 05:10:24 -0800 (PST)
Date: Tue, 2 Jan 2024 16:10:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abhijit Gangurde <abhijit.gangurde@amd.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2 1/2] cdx: call of_node_put() on error path
Message-ID: <2e66efc4-a13a-4774-8c9d-763455fe4834@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Add a missing call to of_node_put(np) on error.

There was a second error path where "np" was NULL, but that situation is
impossible.  The for_each_compatible_node() loop iterator is always
non-NULL.  Just deleted that error path.

Fixes: 54b406e10f03 ("cdx: Remove cdx controller list from cdx bus system")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Christophe JAILLET pointed out this bug so I added this patch
    to the patchset.

 drivers/cdx/cdx.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
index d84d153078d7..40035dd2e299 100644
--- a/drivers/cdx/cdx.c
+++ b/drivers/cdx/cdx.c
@@ -572,12 +572,11 @@ static ssize_t rescan_store(const struct bus_type *bus,
 
 	/* Rescan all the devices */
 	for_each_compatible_node(np, NULL, compat_node_name) {
-		if (!np)
-			return -EINVAL;
-
 		pd = of_find_device_by_node(np);
-		if (!pd)
+		if (!pd) {
+			of_node_put(np);
 			return -EINVAL;
+		}
 
 		cdx = platform_get_drvdata(pd);
 		if (cdx && cdx->controller_registered && cdx->ops->scan)
-- 
2.42.0


