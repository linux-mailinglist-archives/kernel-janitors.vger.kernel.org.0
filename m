Return-Path: <kernel-janitors+bounces-1057-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC507825344
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Jan 2024 13:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CD3C1F22E1D
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Jan 2024 12:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DDC2D04E;
	Fri,  5 Jan 2024 12:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dD4ms66B"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69242CCCA
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Jan 2024 12:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e3ab65709so1775605e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Jan 2024 04:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704457226; x=1705062026; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CWCHZKbV0nCInnBBb4G3T1/9XNnm41DOrT+nUORhlYo=;
        b=dD4ms66BzWBO2N87ZD/lmXsaQnZuvR59dWj4ApBMsfe/ZCskpGpzj1ovwrRRq+IWzE
         3ioO2t/frxYk1zoGanU3AwHs7ye/EoQybtblzPAXdePg5fuZwbTB2GwA743OJGeAYllz
         BGWIr1LvVvsrrrQ7EUy/oFqedemAopkHZxYWpROis4sIe4FR12oz09lY/5zoM2Nbttx6
         FYbwbfzsVyTKEOa1JDVcl5vmMOtCMj2hRuUnCIlswFyJvYSlxgay/lWQiKgO8UXL3WAs
         Ucf0xZ4mAlVhLGtht3BA5BP94TxEXHOZNmaZBQs6MDuioCLKOF5Ce8OXBxPkbCFK7uLA
         wn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704457226; x=1705062026;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CWCHZKbV0nCInnBBb4G3T1/9XNnm41DOrT+nUORhlYo=;
        b=lPK+x5UT2ClJXoraWkVS+wBlGsW88AzqNNHIMHrqh0R1SgfeeKh/vQoR/gx4rKZw46
         lyy38/lVn1c8QknnDBvXsgdkfHnEkTkWEb5NZb0PrKl0bOHTlscBeW/YJejYE2rbfWNv
         w5v7LF3Clr31zhI9wnGp+L2X6nWIE52OgGjl2Pt7BmalE93UhtE2cMH1aEohB9Q2HikJ
         K2x3PZr/Nb9cVnWEqUWtibjKx+qStk6/jPbG6Q4jhZlt8bajlQetqk9QIAJsN3+1PyRn
         uN0cIXnNu9ZKnp0O0+vn1ZLezbGX4nvLjyjOHNhzpFjw3eyCJuzWYuo/f+wBUEEi9CAj
         L71A==
X-Gm-Message-State: AOJu0Yw2KuoyasYEyl3ClhumAwTfGUHroVpk/aMThwfZQ3CvSps8PP1E
	ZmOHiEcOnghC+EM/n6MGywrNCDx+S7X4qA==
X-Google-Smtp-Source: AGHT+IEWKVWrdQKSakz2/Ts2zXXX/VWHLXpgdrXQ5rusD+EMlDGmLVQVh6dERCys1XLkof94JDbgvQ==
X-Received: by 2002:a05:600c:3595:b0:40d:8d45:aae4 with SMTP id p21-20020a05600c359500b0040d8d45aae4mr1238303wmq.173.1704457226169;
        Fri, 05 Jan 2024 04:20:26 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id iv20-20020a05600c549400b0040b3d8907fesm1420756wmb.29.2024.01.05.04.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 04:20:25 -0800 (PST)
Date: Fri, 5 Jan 2024 15:20:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/xe: unlock on error path in
 xe_vm_add_compute_exec_queue()
Message-ID: <fa88d289-9886-474d-b697-b69881b4ddbe@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Drop the "&vm->lock" before returning.

Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_vm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9180f2d2d71d..4aa7979fe6bf 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -332,13 +332,13 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	down_write(&vm->lock);
 	err = drm_gpuvm_exec_lock(&vm_exec);
 	if (err)
-		return err;
+		goto out_up_write;
 
 	pfence = xe_preempt_fence_create(q, q->compute.context,
 					 ++q->compute.seqno);
 	if (!pfence) {
 		err = -ENOMEM;
-		goto out_unlock;
+		goto out_fini;
 	}
 
 	list_add(&q->compute.link, &vm->preempt.exec_queues);
@@ -361,8 +361,9 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 
 	up_read(&vm->userptr.notifier_lock);
 
-out_unlock:
+out_fini:
 	drm_exec_fini(exec);
+out_up_write:
 	up_write(&vm->lock);
 
 	return err;
-- 
2.42.0


