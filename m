Return-Path: <kernel-janitors+bounces-1058-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D178A825349
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Jan 2024 13:20:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 888711F23CE5
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Jan 2024 12:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A65A2D045;
	Fri,  5 Jan 2024 12:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xneem7OM"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC12D2D60F
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Jan 2024 12:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a28ac851523so180364866b.0
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Jan 2024 04:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704457239; x=1705062039; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VPgoGs4JCmFCXEz83XMMwyrfsqP4QMFdJVq1Hj+FDjY=;
        b=xneem7OMkoDf3atnrKXSeY3V1gjCPnM7C6WMYvHrjIkLcJ/zxaBjSeiaFyGIrg7w78
         RLry8F4sQXDfg/Tjso7fY43ILc0h/UYoqsCHascN37sU8kUDh2f/GeZ9Tk1BrKR0s4uf
         IYbwKdXMb7IzNtDc1mGnUZEUMtri/UheOyWuG7vUMIXmMFb4U9we1VmOt2M+y6Y7HmuU
         PTP+YjobJEpP85sZCr0Lgji76UAihWb5ntRa4MAZ8jqEIiBpBtWXghC0B8nlNbjiFJx9
         zJoz942agkVdMpt0tvTeFQ+EuyT+WEbti1fdRM+kAtEsRL319TbG8678RJ7S7wOJ9njs
         VPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704457239; x=1705062039;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VPgoGs4JCmFCXEz83XMMwyrfsqP4QMFdJVq1Hj+FDjY=;
        b=jY/t3/IX/3d2ZCzr0j6GiXp9+iFMXdGaAlTZaRIBUfXVjZijY/O4jyRpemUnzPQnId
         FK9n/kFrBvQFZPAtFxDAbKxR9c3ckTINf+JbUUQGBJ6gcEIcbyk/5hT6Y6Jzq2fswels
         d0iZvBktc7jCJEGc5hc4YCRZu5tXX9jV7amr6g0WLYgwRGFscNmXqrpogZ6zfcTzn6aZ
         CvVb2TgPawYyStFB2KEycka6UiZs+Zm/USw3cUkpVPZTTa8DehjKvNbsIbqge1wGiE6g
         fK824tB8QYqmBpxbzv3wHSFsO2wFJwwHLSKBapF83sxls0HoQMFDRdx48MmkeoQtnHGC
         A1Ug==
X-Gm-Message-State: AOJu0Yxgf7ghrapMweuQbkX800GAu0/CQ+XSqYundJ10reZxfiFs4tss
	7BnQf4MlaRyFit8EdKo9K2Wr20LUTf3WXg==
X-Google-Smtp-Source: AGHT+IGTi4ByJkUR6/L3sBCprInPncsNYvpNn81WSpgeD5kLCGkvWCFb+4d+d6d898+eLssOzT1V0A==
X-Received: by 2002:a17:906:51c1:b0:a28:fa55:3597 with SMTP id v1-20020a17090651c100b00a28fa553597mr923237ejk.98.1704457239116;
        Fri, 05 Jan 2024 04:20:39 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id r3-20020a170906704300b00a27e4d34455sm820240ejj.183.2024.01.05.04.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 04:20:38 -0800 (PST)
Date: Fri, 5 Jan 2024 15:20:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Nirmoy Das <nirmoy.das@intel.com>,
	Matt Roper <matthew.d.roper@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Pallavi Mishra <pallavi.mishra@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/xe/selftests: Fix an error pointer dereference bug
Message-ID: <5c0db456-2d8a-485f-875d-6408386fcaa5@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Check if "bo" is an error pointer before calling xe_bo_lock() on it.

Fixes: d6abc18d6693 ("drm/xe/xe2: Modify xe_bo_test for system memory")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 412b2e7ce40c..3436fd9cf2b2 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -125,14 +125,13 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
 
 	bo = xe_bo_create_user(xe, NULL, NULL, SZ_1M, DRM_XE_GEM_CPU_CACHING_WC,
 			       ttm_bo_type_device, bo_flags);
-
-	xe_bo_lock(bo, false);
-
 	if (IS_ERR(bo)) {
 		KUNIT_FAIL(test, "Failed to create bo.\n");
 		return;
 	}
 
+	xe_bo_lock(bo, false);
+
 	kunit_info(test, "Verifying that CCS data is cleared on creation.\n");
 	ret = ccs_test_migrate(tile, bo, false, 0ULL, 0xdeadbeefdeadbeefULL,
 			       test);
-- 
2.42.0


