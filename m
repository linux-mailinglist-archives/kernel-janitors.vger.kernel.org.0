Return-Path: <kernel-janitors+bounces-1061-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B717D8254A2
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Jan 2024 14:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA2591C2281D
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Jan 2024 13:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129682D78C;
	Fri,  5 Jan 2024 13:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="clUa/AGF"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5842DF72
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Jan 2024 13:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40d5aefcc2fso15503645e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Jan 2024 05:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704462478; x=1705067278; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7scXJfb8MpiekK69yzw2lN/iDE5LBn7Yp5Zuvf3udM=;
        b=clUa/AGFNlZ/QHvPZ6clLbGk6C7reNyAc70KJev9NiVfp/cMRUhU0sQb05osr7QSpH
         lratOl0cobqIeaPBBk1OA00BMhSacig52R9IPYAHVcSgZO1KSedlc3sDdMQObueU1Fr2
         5Z4h47ycVQaL1awGfzkzYwNyG3JeM0Bt8u00350pI9Zb/YN3Mw7qN5F3cZjBNmznThHb
         TwNctx9VwF063hAMC0DMovh3YcIOoBu37nKbA24iVwTyDT+HXdzdYXs3RAhx7glNdLuu
         8Q5FASUV6/OG5xvjPI5M1Be37TLa1g3OwIFMUs9V9djgzhSt148WZ2cQuk+g3KUXgwxH
         QaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704462478; x=1705067278;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7scXJfb8MpiekK69yzw2lN/iDE5LBn7Yp5Zuvf3udM=;
        b=j7i1RrGPgmd9DOBU0NBc3WohhtfyJzJj3kLiSXOzo7rhM6siR5KOWBzlPTH7ghrWaa
         XUCpmm9bv84jyeYDS1y703MRxg0mxjZb7m5C+CpWjRK6GpI+FC76lTsvpH4zqbS/ckmO
         LRYme3EOYXIW3tQmg7WjUNJNPcCMSEGmEBSZ/C6gBWRuX/59jAZdqxxyhUHA6AMyhF+l
         b5OPVPlG46vYJofOFXgMNq6En4Ug5cL3SHgy7/ZizrD6xiC87BEOmigRTBbJNq17/sXx
         EBvHbVhHUjirPvi+0tkqc9l5LIZ8/8T1LXr0TpEO6rIFFHAJ0tlQzhtU5nP4x1C0I0pe
         1Lgw==
X-Gm-Message-State: AOJu0YyS1BFAU+S5nIBFiszUImu81qVxkVor8Qu5aIFPGZfWBLKh47kF
	KbQULwQ5GRc4jAQyO451jkY6vbAX7K2o2w==
X-Google-Smtp-Source: AGHT+IHUBJMtUA4V6WC+sNyeJ5Zc5b9FXevLeRPP8Jfb8EVe7sp13SUAwUFU+afaysyE0Q/N7ksdug==
X-Received: by 2002:a05:600c:3b8a:b0:40c:6d5f:e88b with SMTP id n10-20020a05600c3b8a00b0040c6d5fe88bmr1212246wms.112.1704462478113;
        Fri, 05 Jan 2024 05:47:58 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0040d3276ba19sm1631292wmq.25.2024.01.05.05.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 05:47:57 -0800 (PST)
Date: Fri, 5 Jan 2024 16:47:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86: wmi: Fix wmi_dev_probe()
Message-ID: <9c81251b-bc87-4ca3-bb86-843dc85e5145@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This has a reversed if statement so it accidentally disables the wmi
method before returning.

Fixes: 704af3a40747 ("platform/x86: wmi: Remove chardev interface")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 157f1ce8ac0a..e6f6fa2fd080 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -868,7 +868,7 @@ static int wmi_dev_probe(struct device *dev)
 	if (wdriver->probe) {
 		ret = wdriver->probe(dev_to_wdev(dev),
 				find_guid_context(wblock, wdriver));
-		if (!ret) {
+		if (ret) {
 			if (ACPI_FAILURE(wmi_method_enable(wblock, false)))
 				dev_warn(dev, "Failed to disable device\n");
 
-- 
2.42.0


