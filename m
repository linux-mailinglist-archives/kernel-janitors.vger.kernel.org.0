Return-Path: <kernel-janitors+bounces-8218-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4487AACFEB6
	for <lists+kernel-janitors@lfdr.de>; Fri,  6 Jun 2025 11:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0514F1772A7
	for <lists+kernel-janitors@lfdr.de>; Fri,  6 Jun 2025 09:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9710F283FFA;
	Fri,  6 Jun 2025 09:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yr1l27W8"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3722728640C
	for <kernel-janitors@vger.kernel.org>; Fri,  6 Jun 2025 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200680; cv=none; b=JDClAW1TozJWmMHzAN0qb9p87hvwRhsSM6B6N0sRXI1pLnzWblGRIpEP8fjloaY0fnFsyU4ZlaTsAtJUOzOp34aW5wLoH+HZRD+nkCgefjxf4aWoY8i4ESp5wDgeC4VkNZBxGCZuGCUrVWBFWlW69H8ecS3x7DcY4T5ovPkSvZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200680; c=relaxed/simple;
	bh=ITvBuxSeIAXDkBJEWGSGD5rlQvO64BrbWaK4vCuf/rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KXibBjBGpPivZdARK3RnF8UYKH5jSN26VvUjW2wKnnSyfSyIxRGOGYyqGDGYFBGUWinpM5DWZbCG/9O3uCoTvKy2DF04gVavl6KAXXf+qLWO+cBnN4+1n7raUQlKcpNOkVJ3AVTCF+IyggRbYP6kB7Dh30IZs5hvR/RSvIW4BpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yr1l27W8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450dd065828so13776075e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Jun 2025 02:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749200676; x=1749805476; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S/emY2XS5cFVoX90o0NgZjiKA3eudgdKvmBzuNCnA9A=;
        b=yr1l27W8cUM/Ij7/AcbfDzBETTN6LucQXjVhHwYsqs+I0cjoajpSHJcGu49FF0LdNd
         UVDmZILBPMmJ/09mBBSgqLIC5ptsMLC691HSZYcXviFtfA5ZJ3rRDjQePX+vHwGci5m8
         qcAaH+8V82AggiqR4EaO4xiFEDfft/CrRxya9h/7I8pUA6T6bJDKZa5JDhBRuKVbxMnM
         VLra/shle7JRd/rtH1cCFkt41lPEIkY+dxoRT14Jp1wYyU3FFhofZ+WKXsR3k2PquYo6
         bYQZA7+2CdXYJjWqL+bx/QNnh3tb+1fGYGeY5BrqO3U9dYt5iDu8e2Tix7jkz4OFSsiF
         n2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200676; x=1749805476;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/emY2XS5cFVoX90o0NgZjiKA3eudgdKvmBzuNCnA9A=;
        b=QijcGQFBiGreOxhsVPbcukDsh6jnUbF06XnpJPU+wRMs0XdJf9AaSVMxAT20FyiYFA
         M4aCeKJnVH8FuZTOHsRA7AIFFtzmeJ2Doi/AojpOm4vWB16OxBU8zd/0kBVXS/ytl8Q5
         VvUX94L3ZQppGsYBnQ1MyXr3ZNUa6Ymepp/pqVvtgGIgoiliQiWu7AeZuZ+jey7rtQVA
         xy9BghCNREWOB+Hwr3xNbO6byaTREzGw5HBuXE6FdqGYC1+a7vJboQ9cjyTLQmCNZSZR
         tR1eVDm8Emi1BnKns87VJF7SKn7pytZSNuVQ7zZ/hz8hqTg4kRKGCjH8i96mN4i9pC2r
         LGkA==
X-Forwarded-Encrypted: i=1; AJvYcCVODyUyIUjPvA6nYBLzv0xNz7CHh9nhIgtIyxdBTti2DbU3XfdPIDHZGvZ3l0mp0wBUfR0I3ju83gfmEBtmszE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcbOkB1UkLXWwmt1dFGcvdB/gT6iFDhqWbuQKQIrETd7eL5yjT
	iOPt6mC9uys4pxqIetYIuANt4qbiJINOxDqbEyvoQGjK/ooLhbsomxYgzLwTDGSczvw=
X-Gm-Gg: ASbGncumunploI59RHIOTDSfsEKiB4o66R/GibGjAZzYn70HCYUyzuXrBDyWeZf1tqn
	EF2IprMch9GoSdD5lPJX6RSiSt86e7RCq3nQWiSxfYMv+IiCEQ902O0RtIb/i15HhGb/R8qUpVE
	H2yCAbj+sMVhj1QDamaxLzy8Yvv1Sxl+RhFQFAg4j1rqKatcLnarlQ5WBRBxczOjN7EZK8wJPvq
	rEWqIrCzmWqh50M8M9SSJIMUD9bFycs88ZUYMWezsrLtMy7xvJ4XhMAshA5Z1umvi6wCpr0WvmL
	WV+X77xRF+RmMdsAVkXAB/fbgmA3mHhqA/O5DcTB7gXZtEhczn7HexE7Hmol+eeamYO+6/sge3W
	c1g==
X-Google-Smtp-Source: AGHT+IFhA2vqyp8xEAIPBvNHsWP+ZzsHRKW0V5DhFiNi2JLK+60alY4CgxuHf71qdKGE0Cj1Xq0Z3g==
X-Received: by 2002:a05:600c:6207:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-452013fd6b5mr27037065e9.4.1749200676516;
        Fri, 06 Jun 2025 02:04:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4526e155ce7sm14210735e9.10.2025.06.06.02.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:04:35 -0700 (PDT)
Date: Fri, 6 Jun 2025 12:04:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@kernel.org>, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86/intel: power-domains: Fix error code in
 tpmi_init()
Message-ID: <aEKvIGCt6d8Gcx4S@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -ENOMEM instead of success if kcalloc() fails.

Fixes: e37be5d85c60 ("platform/x86/intel: power-domains: Add interface to get Linux die ID")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/intel/tpmi_power_domains.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c b/drivers/platform/x86/intel/tpmi_power_domains.c
index 0c5c88eb7baf..9d8247bb9cfa 100644
--- a/drivers/platform/x86/intel/tpmi_power_domains.c
+++ b/drivers/platform/x86/intel/tpmi_power_domains.c
@@ -228,8 +228,10 @@ static int __init tpmi_init(void)
 
 	domain_die_map = kcalloc(size_mul(topology_max_packages(), MAX_POWER_DOMAINS),
 				 sizeof(*domain_die_map), GFP_KERNEL);
-	if (!domain_die_map)
+	if (!domain_die_map) {
+		ret = -ENOMEM;
 		goto free_domain_mask;
+	}
 
 	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 				"platform/x86/tpmi_power_domains:online",
-- 
2.47.2


