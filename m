Return-Path: <kernel-janitors+bounces-5116-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E92A95CCF6
	for <lists+kernel-janitors@lfdr.de>; Fri, 23 Aug 2024 14:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0101288F9B
	for <lists+kernel-janitors@lfdr.de>; Fri, 23 Aug 2024 12:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DAF7188CA7;
	Fri, 23 Aug 2024 12:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t6spEVrL"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6DC188937
	for <kernel-janitors@vger.kernel.org>; Fri, 23 Aug 2024 12:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417504; cv=none; b=dsMcSwpLJ0koTJV8JWT4d18kKKV1JZg5uUT3nn7V7JTBYsAMs421G+OdNrdlqs+BsqqZ2iMC5BI5LfnwzukfGIIfnVldtD/U9CRHApaUzCRqM73obS/+5OGKqNizpxl0JRwXkrTxPwgqPn/XRUNBQeTTTDcZlIQZ5eMPxxZDN0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417504; c=relaxed/simple;
	bh=0GYm2ySTIWpR5t1AhOZzOLn2pSAeaQl/xmm0Un/1iQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hov5snh7HU6VieiQWTeJ8FO8/Jh4Gf7ryRPYdwIujnfmk3xgMlbt4QP9Zf7xklMK3Rqu7eMoLD+1Z6qY22M3iJC2PspHzWOXMNzCDvKEMjUdrkw40pMRwCmqYqfDCbLu4POQ7JlzQhN0r1sj6ab8xrPQZH4DjtfT0J5O2arJPQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t6spEVrL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-428163f7635so14774715e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Aug 2024 05:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724417501; x=1725022301; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hoe5j+zL5nAbiCIUvREYQpVSE2yifQUHpqXLQ7XWoEA=;
        b=t6spEVrLkloBDjLQeUDFN+MUth0UW8hqeZpFlanPz2oBDR3JDzu/fbfPbXX43b0cOY
         a8BLTtQZSX3u41B/IwylFYhNl2BPxA1K3MT93NS3QD47sCw36DvzJqTGZu3B5hKQaP8m
         5Up9cRi4WJHnUQSEomb3SU1wzHy8x7OPoVxeOph1AXsWs4RdLMScglQZsBBmtiQWYJEv
         bYnzXfk2ZW6YGfw1/HPDbeMJJq9fVsLoIPzlRnCc3n5/pTIEtlqX7ragzk4FKYp01iyD
         VXOWcWYwx+v8dljmchxKr/L5psdvXUxor1baIibjrQ0kM4SxdU25GLpcmEwtPfCVM9Xm
         C1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417501; x=1725022301;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hoe5j+zL5nAbiCIUvREYQpVSE2yifQUHpqXLQ7XWoEA=;
        b=f3XlwmKI7g13P5OJYW/kR8LxIhIXfBGV3kFzKLjc9QI0dID3g4rnVmM4gjMcg/cbov
         dQ5KjfOH3AN4Vb4aIzwmWv1cOlpp6SSNyfxFOAHn3Z0VWY+GQqhz3NhZbS+qo0L8I/Hd
         UqcCS/CA25WsjtiG8dHfOWGvaCjYYPHjJdW5nJ3eSU9EQBE+W7rCtvUiSgyZ3z2ZpGUc
         5us5z3KOqQee3SH/hTlt0l2O084dDtUJ1BRQNx0/gayszGGCJp3sbpJXe1Q1yGXz+7N3
         3IWTkF4v73VjdaC55gQRgekFHnv/oaSDBmygNZVYABVnQhCBQABPGz4RPonx6uAdj7iG
         lbzg==
X-Forwarded-Encrypted: i=1; AJvYcCWnmnsAOC3bkldAXlJo2TLWMctMm2UNq1DhbugkBIsAk/XsvFvOUcpU6Ak/AcGX35w9umWDFKXYxyBgJCj/KoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUeEyGR3DXznMgCCYCgdL6ljsaQsIGpZAbrsgGjCCpjButlbUL
	vt8B8JmF/HJpiX+vHPRZN/kSJIl4/1bcMZ2/WVL5Z81Etu6ddCjoIHg8oYQseX8=
X-Google-Smtp-Source: AGHT+IHkggqQwYF252ozofkl8OYWm3rlLNjamoptyTPU8soyrbqGqbFpghbuhPHDyrmStFxt8rYQdw==
X-Received: by 2002:adf:e54a:0:b0:371:8dcc:7f9e with SMTP id ffacd0b85a97d-37311840e04mr1346482f8f.2.1724417501372;
        Fri, 23 Aug 2024 05:51:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-373081ffeb8sm4092416f8f.88.2024.08.23.05.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 05:51:41 -0700 (PDT)
Date: Fri, 23 Aug 2024 15:51:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dhananjay Ugwekar <Dhananjay.Ugwekar@amd.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] powercap: intel_rapl: Change an error pointer to NULL
Message-ID: <fa719c6a-8d3b-4cca-9b43-bcd477ff6655@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The rapl_find_package_domain_cpuslocked() function is supposed to
return NULL on error.  This new error patch returns ERR_PTR(-EINVAL) but
none of the callers check for that so it would lead to an Oops.

Fixes: 26096aed255f ("powercap/intel_rapl: Fix the energy-pkg event for AMD CPUs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/powercap/intel_rapl_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/powercap/intel_rapl_common.c b/drivers/powercap/intel_rapl_common.c
index d110c5da5cfe..2881687d7900 100644
--- a/drivers/powercap/intel_rapl_common.c
+++ b/drivers/powercap/intel_rapl_common.c
@@ -2157,7 +2157,7 @@ struct rapl_package *rapl_find_package_domain_cpuslocked(int id, struct rapl_if_
 		      topology_physical_package_id(id) : topology_logical_die_id(id);
 		if (uid < 0) {
 			pr_err("topology_logical_(package/die)_id() returned a negative value");
-			return ERR_PTR(-EINVAL);
+			return NULL;
 		}
 	}
 	else
-- 
2.43.0


