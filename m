Return-Path: <kernel-janitors+bounces-69-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC5F7DCA39
	for <lists+kernel-janitors@lfdr.de>; Tue, 31 Oct 2023 10:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B908B20F74
	for <lists+kernel-janitors@lfdr.de>; Tue, 31 Oct 2023 09:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97EB3179B9;
	Tue, 31 Oct 2023 09:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BZiU5eGV"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B083410A33
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 09:54:32 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7B9123
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 02:54:31 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-507975d34e8so7896831e87.1
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 02:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698746069; x=1699350869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZU07pbgnI66N/yRyT5yyBSwPkEnTukC8jFqVdALn0X8=;
        b=BZiU5eGV+X+mdjCmMdBqukIX03icf7W+SpBXYNkFyoYAGOCD6ACQ54Z4ZSG+ORITTJ
         GrkLbO9mD/FZpl8Qcj+YU1o0U0zB8GwjkNMAW5F8/OG/kvjalHHclaM/67Pb4V+Nquis
         qYZEx1k+QY7CtYVd24xzM+6h02vsK2StMuNt/l1AJ6D/zfISmQEcDRj7hKD44EXseECB
         tJbjwoAPjbPWcPfQK02iZApCxXNax/yNPQtX3je7j87SKuLbQCaQb5wwX0YJeDaqxgfr
         8fdUVrFlrclS1PSHMJmsAyfddS+Wi833dbeY3Z1GOeFcwlx8EcCdFFziZh6K6K3N7QU/
         lIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698746069; x=1699350869;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZU07pbgnI66N/yRyT5yyBSwPkEnTukC8jFqVdALn0X8=;
        b=aliiY9oSOAKQOmFHMyo34AcqalY2b0i39+zfEJSn79v3QBFwAfAJ6GRE6QXCBcEIgU
         FbmMTg/EbsSO7G8FC8QoldZIb3l0x3ynf4/Jvcms0dfaz/mk6PPOI/Js7NoDGt1dxlJO
         wKVBlWfMJZ5WnpdCC9DK73oKmLJTzF4Py1g+OiV4K9D2rZ6Q8G6mJLI8gi5KPW81ihBo
         1wfJTQZt3HhKKWaDNs/WNcwhxocuf3B+tFF9aneWYeUGNKxiYIrjn0pw+Qg2YAmvsb9L
         GixrDoCyDC7Sbix9tp8bXvoCQubRYduh6+xdaUOKRjkQli+rZZZM0TLqmmeSi32FGj4k
         g19Q==
X-Gm-Message-State: AOJu0YyKeVvRTNMTX8Jn8TLTKPUrHmEyfVTmk0VBXSBRFIVY8MZgqArR
	5Lv3O4bD6dpGO18R2jLhGtWZHg==
X-Google-Smtp-Source: AGHT+IHr8nE960Uc3xUzQfase2Sduc+v8EfCz56jdjXt6Q8sabke258Q3uhp/yrn2zXUrL7L3ceaBA==
X-Received: by 2002:a05:6512:312f:b0:507:9ae3:6ba7 with SMTP id p15-20020a056512312f00b005079ae36ba7mr8585994lfd.67.1698746069663;
        Tue, 31 Oct 2023 02:54:29 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h13-20020a5d6e0d000000b0032dbf26e7aesm1091362wrz.65.2023.10.31.02.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 02:54:29 -0700 (PDT)
Date: Tue, 31 Oct 2023 12:54:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Robert Richter <rrichter@amd.com>, linux-cxl@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] cxl/hdm: add unlock on error path
Message-ID: <63295673-5d63-4919-b851-3b06d48734c0@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60028378-d3d5-4d6d-90fd-f915f061e731@moroto.mountain>
X-Mailer: git-send-email haha only kidding

This error path needs to call up_read(&cxl_dpa_rwsem).

Fixes: 176baefb2eb5 ("cxl/hdm: Commit decoder state to hardware")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/cxl/core/hdm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cxl/core/hdm.c b/drivers/cxl/core/hdm.c
index af17da8230d5..0eb580245276 100644
--- a/drivers/cxl/core/hdm.c
+++ b/drivers/cxl/core/hdm.c
@@ -684,6 +684,7 @@ static int cxl_decoder_commit(struct cxl_decoder *cxld)
 		if (rc) {
 			dev_dbg(&port->dev, "%s: target configuration error\n",
 				dev_name(&cxld->dev));
+			up_read(&cxl_dpa_rwsem);
 			goto err;
 		}
 
-- 
2.42.0


