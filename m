Return-Path: <kernel-janitors+bounces-7479-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B97A5A407
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Mar 2025 20:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A34E71892943
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Mar 2025 19:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D4E1DB92E;
	Mon, 10 Mar 2025 19:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PvbTrplV"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297EE1D54EE
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 19:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741636117; cv=none; b=bfiQ9QPoDF22hoSDB+JCPWUeptEQ7bjyYmk34I/Slv1xtltu+glESMDasUygKKH4yQzGtPhci+FOQzF6IrAr22reEXTl7EJeVSpXW6xa48tevhQjP5hZ9f1SYKIhamFC81R79zB9iP//c6MXVom57FsCXA+sL9BUOW18tzob7wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741636117; c=relaxed/simple;
	bh=DYZr+XUDk6/mKXNQt7YCnNOvjEe4qIMuJNfHw1nmfRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=osgdN03RHL3wl1L8yyxRFCdNwDNEczbvtoq0+vnzO3HAxXUOYnj89gOB1oF74yfs5WDLxHs1xQNdkW3pSQFWndyaW8u2OtdsntMTWHLJWempgOKCSh0lOhpkFT4m/354kBqZr9hf6HQsUZv6UbZWj4Cg5AUewIA5fzjBqE4ZIOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PvbTrplV; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-390fdaf2897so4499031f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 12:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741636113; x=1742240913; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zQ6DbCWufyeRqp7NYzjJv04giqAQq1F9QSeq7x5lrKc=;
        b=PvbTrplVUh9TUNYK1Ntc5wZxfoDSiFr60sMcpI7T6kEtSJOt3x0zwLf8wi4TLJSzyF
         f2Tg4ypi5oH+coccQd7x6/dtVPTcQYM/kSDVGCHY5EjyHaD1G/c1wEhSiimIuKBJ4jpd
         9zartKKoe0PwxGIRCVoJqf11o6MxfAQzMaCVC06wXkymGhbYP8wkssD8G5ommffJrM2b
         4S2tFPt5uVp1otZrfB/VfGzNeo9/GcS0lf89V64Pdt5CDRxcrwTmfznVFJYcFB9OlaYi
         7uQhCkh/KLdnH+eUkJmJcOLPp9GZBVS71pdlI5z5u+EHbAjqAimRQW/YIJLEiDz3+Bll
         UZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741636113; x=1742240913;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zQ6DbCWufyeRqp7NYzjJv04giqAQq1F9QSeq7x5lrKc=;
        b=aEX5CjTKDJOgTs3laBG0HVBFuQC2J1vI8+bxvSFCIuOPHN0rt6Q2936yrzTAtjqI2n
         Nn85FKo90VIaz409rJ2maDoJzr8uRT4E3b1fWTwqVhBnwAOQtkikuVoaq9oZZ9VA61IO
         XWaK/kQ4+SzV4EZdKDrPTTTK1AR6no4RMPFG72Qgc4c+z7Q1GhrWsQUI1PrDPAB3JdAi
         VPZFCzYDPpwqz/6y5elaJ05Dvojq/ge/K2qt381nDA8eYwkpdMC09GQ7RDR1JujmttLe
         6DwHx7crnjCRaaMMscdlqzLBOlMoY+o+L7v1vnR63PlVK2o+tRDMl2fkBdWXPHJSTgTb
         qDsw==
X-Forwarded-Encrypted: i=1; AJvYcCWZpIxXMdM8+h0QJ38owGMDoEhIXOrK8Jk58/mftDFZfC2wPYBVQah6D5xgz83xuZ+50Du/izEZ6kqUNAB55aw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAxTZWLN7XYQnHnrUP0h7K4awfb7mLzrie2whW8FxpjZL4Me1L
	WSYqR/fpTJbT7EwjIvRZyuSh45okd+hbx3EsyN3pmR6wOkNl+Fy1mcYUN/BoXJU=
X-Gm-Gg: ASbGncuQFbnrOZjvL7pSKRk8h9hqPtWst9Skuj7sacZUk+9HkYUuDLLIgsV7LOeiGkL
	O0kW/Wed3sHVKQAKfoQUWOWXF+adJV9BZsfTimWijfCrWmKjaOEa7STIeDds/DId05yPUDf0aKW
	TMSsErg5Ka3BJY09PqJomqOuICK+RqFwOcX9jyk61rK6jDB4rE6rSjdwM8dYGHkdut4w8MSDZ3t
	lsLeyZvcQhr7mJGnX3a2alje79dF/+fbvOp7CbfqxjV35x+BPCSu99Vqs6UXocjVcUBSYbe44MW
	Ma3QnGP9GDku0Mz4pX/xVInrtrOXPDn2En/sdP+1cdQb/h3gNg==
X-Google-Smtp-Source: AGHT+IFFqcTSj/t1359bhB8c8EifY3B7tW6Wrutajm8qntIhs7THjc0NQ/hLcMTl+rrF6l8gJ///5g==
X-Received: by 2002:a05:6000:1887:b0:391:2c67:7999 with SMTP id ffacd0b85a97d-39132db1bf2mr13833769f8f.48.1741636113478;
        Mon, 10 Mar 2025 12:48:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c11e9desm15654911f8f.101.2025.03.10.12.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 12:48:32 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:48:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Patil Rajesh Reddy <Patil.Reddy@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] platform/x86/amd/pmf: fix cleanup in
 amd_pmf_init_smart_pc()
Message-ID: <232231fc-6a71-495e-971b-be2a76f6db4c@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There are a few problems in this code:

First, if amd_pmf_tee_init() fails then the function returns directly
instead of cleaning up.  We cannot simply do a "goto error;" because
the amd_pmf_tee_init() cleanup calls tee_shm_free(dev->fw_shm_pool);
and amd_pmf_tee_deinit() calls it as well leading to a double free.
I have re-written this code to use an unwind ladder to free the
allocations.

Second, if amd_pmf_start_policy_engine() fails on every iteration though
the loop then the code calls amd_pmf_tee_deinit() twice which is also a
double free.  Call amd_pmf_tee_deinit() inside the loop for each failed
iteration.  Also on that path the error codes are not necessarily
negative kernel error codes.  Set the error code to -EINVAL.

There is a very subtle third bug which is that if the call to
input_register_device() in amd_pmf_register_input_device() fails then
we call input_unregister_device() on an input device that wasn't
registered.  This will lead to a reference counting underflow
because of the device_del(&dev->dev) in __input_unregister_device().
It's unlikely that anyone would ever hit this bug in real life.

Fixes: 376a8c2a1443 ("platform/x86/amd/pmf: Update PMF Driver for Compatibility with new PMF-TA")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Edit the commit message

 drivers/platform/x86/amd/pmf/tee-if.c | 36 +++++++++++++++++++--------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index ceaff1ebb7b9..a1e43873a07b 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -510,18 +510,18 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
 	ret = amd_pmf_set_dram_addr(dev, true);
 	if (ret)
-		goto error;
+		goto err_cancel_work;
 
 	dev->policy_base = devm_ioremap_resource(dev->dev, dev->res);
 	if (IS_ERR(dev->policy_base)) {
 		ret = PTR_ERR(dev->policy_base);
-		goto error;
+		goto err_free_dram_buf;
 	}
 
 	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
 	if (!dev->policy_buf) {
 		ret = -ENOMEM;
-		goto error;
+		goto err_free_dram_buf;
 	}
 
 	memcpy_fromio(dev->policy_buf, dev->policy_base, dev->policy_sz);
@@ -531,13 +531,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
 	if (!dev->prev_data) {
 		ret = -ENOMEM;
-		goto error;
+		goto err_free_policy;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
 		ret = amd_pmf_tee_init(dev, &amd_pmf_ta_uuid[i]);
 		if (ret)
-			return ret;
+			goto err_free_prev_data;
 
 		ret = amd_pmf_start_policy_engine(dev);
 		switch (ret) {
@@ -550,27 +550,41 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 			status = false;
 			break;
 		default:
-			goto error;
+			ret = -EINVAL;
+			amd_pmf_tee_deinit(dev);
+			goto err_free_prev_data;
 		}
 
 		if (status)
 			break;
 	}
 
-	if (!status && !pb_side_load)
-		goto error;
+	if (!status && !pb_side_load) {
+		ret = -EINVAL;
+		goto err_free_prev_data;
+	}
 
 	if (pb_side_load)
 		amd_pmf_open_pb(dev, dev->dbgfs_dir);
 
 	ret = amd_pmf_register_input_device(dev);
 	if (ret)
-		goto error;
+		goto err_pmf_remove_pb;
 
 	return 0;
 
-error:
-	amd_pmf_deinit_smart_pc(dev);
+err_pmf_remove_pb:
+	if (pb_side_load && dev->esbin)
+		amd_pmf_remove_pb(dev);
+	amd_pmf_tee_deinit(dev);
+err_free_prev_data:
+	kfree(dev->prev_data);
+err_free_policy:
+	kfree(dev->policy_buf);
+err_free_dram_buf:
+	kfree(dev->buf);
+err_cancel_work:
+	cancel_delayed_work_sync(&dev->pb_work);
 
 	return ret;
 }
-- 
2.47.2


