Return-Path: <kernel-janitors+bounces-1273-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7E082C1EC
	for <lists+kernel-janitors@lfdr.de>; Fri, 12 Jan 2024 15:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F88F1F232F5
	for <lists+kernel-janitors@lfdr.de>; Fri, 12 Jan 2024 14:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEB36BB48;
	Fri, 12 Jan 2024 14:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QSxNKtH0"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283876A345
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Jan 2024 14:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e67e90d04so4015115e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Jan 2024 06:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705070057; x=1705674857; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wMAozsps9KhdnPC0gC/CqjxcAys0VIF1YUv+72UuGdM=;
        b=QSxNKtH0L5ny97b8ubTtPuslm7pNmNynFnHnzGI/mk4exHOX4oaK6f/LzjXq4m4Pgg
         S2PttR0ATVEnHHRuqAQ/hszkFViYWkW29xxS4hpqduKzbbE0KmkTN7Bv+XmNrZOz922v
         JFt9J4fTpVVMk7QEygpR3hHUoDTzQF6Hi1SzEXFWh5877WesQ1pZ6W54e92A+k+74k5F
         Jg+MDlwuDGu0zpZKLXxXtpmimmiwuPU4zs2BQxsAZTZbqcpSOk4PanE6D5B81vvrkooY
         vTPWxCu5EgZV07p640BUWol6qiBj4+Rdb2B8oEw4atT+ZZjkmhyKJIOC3rxPd729dIxO
         A0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705070057; x=1705674857;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wMAozsps9KhdnPC0gC/CqjxcAys0VIF1YUv+72UuGdM=;
        b=IjtEvVxbkw2AgkHCYrp+clH+HkRQtqPeBVJxwMZlX6kU6mYLj9sYeilCOFCZzhgCts
         kXxXIL9dGp1z6HrSDWYGfYQyVzRPg1s92+nS1HDIfk2PoTtbrhusHldlwWqi+rUF8S19
         TzQmmTqL2EzzT4wcdk9hP8C86VGzkZfgrWsyGkNT1qbP2cuMR96RXl38Cry3HQR3mXUJ
         aZoW7GRK2jukQ1IfmbsT3GU6127X8RfQVuzXmZkh0E3VHsVNJmIY7CqnuZtrSltfKvaF
         waQBxSUe2i/D6MTgdmMFmHitYaI8O1GTT6KkKPtpBSLf88zjF5rUqLChfOqZ/yWyhZT7
         VpSA==
X-Gm-Message-State: AOJu0YyrCOGBAFypNi3/Oq3SnZtyL9w0/wl3cuHCX0cQPqJmZguY32KN
	dgug/7HQ6qmcVPwlbScPquZ/slNdbjNNBQ==
X-Google-Smtp-Source: AGHT+IEo2mOleVaYUfc9j4l2dY3+TK3k54YTZMybDNjOmwmfLYfAMTaWAKbDYx/jgnOTy0AsBo3okg==
X-Received: by 2002:a05:600c:1705:b0:40e:4832:9fab with SMTP id c5-20020a05600c170500b0040e48329fabmr886892wmn.143.1705070057428;
        Fri, 12 Jan 2024 06:34:17 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id l17-20020a05600c1d1100b0040e4a2b36bfsm9849022wms.22.2024.01.12.06.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 06:34:17 -0800 (PST)
Date: Fri, 12 Jan 2024 17:34:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] HID: hid-steam: remove pointless error message
Message-ID: <305898fb-6bd4-4749-806c-05ec51bbeb80@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This error message doesn't really add any information.  If modprobe
fails then the user will already know what the error code is.  In the
case of kmalloc() it's a style violation to print an error message for
that because kmalloc has it's own better error messages built in.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hid/hid-steam.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index b3c4e50e248a..59df6ead7b54 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -1109,10 +1109,9 @@ static int steam_probe(struct hid_device *hdev,
 		return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 
 	steam = devm_kzalloc(&hdev->dev, sizeof(*steam), GFP_KERNEL);
-	if (!steam) {
-		ret = -ENOMEM;
-		goto steam_alloc_fail;
-	}
+	if (!steam)
+		return -ENOMEM;
+
 	steam->hdev = hdev;
 	hid_set_drvdata(hdev, steam);
 	spin_lock_init(&steam->lock);
@@ -1179,9 +1178,6 @@ static int steam_probe(struct hid_device *hdev,
 	cancel_work_sync(&steam->work_connect);
 	cancel_delayed_work_sync(&steam->mode_switch);
 	cancel_work_sync(&steam->rumble_work);
-steam_alloc_fail:
-	hid_err(hdev, "%s: failed with error %d\n",
-			__func__, ret);
 	return ret;
 }
 
-- 
2.43.0


