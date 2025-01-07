Return-Path: <kernel-janitors+bounces-6779-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DB9A040EC
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Jan 2025 14:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 027A7188742D
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Jan 2025 13:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868131EE7D5;
	Tue,  7 Jan 2025 13:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IrDiW7tF"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0431EB9F9
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Jan 2025 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736256928; cv=none; b=HuWZRCqBJBShcAhDZtc5Edt5E5IdUIdTVh8fRLOhhsNCye0wUOqDyvZHVWuc7jE5YHh0BpwgERn+IDdVklAcBjflBAITb4jc6sAfGRRt6HgNjFYqc+wzywcCBMqqpWxbxcJLYwouQnKxxn6UxcCblD2Nvr/1cq7Q80PRV/pYnIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736256928; c=relaxed/simple;
	bh=4286aysA7oRVs8jwu5zQ5rCNC2YPaGJojNRwFE8eYfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nzGdm4pD+CZaatTOl/g9iI1HfDKD/FHZETvBqaf82JesGBuiyEpBqOHzGHl0CiwM6c6IfjqroCccmwil0RNu97dK5GsyywtZsdHN9TNOS7lq9AsywG8PGCiltkput/DoOiyz/attVJMWwKvRM1I2EPp3N/K5qlMUMIK048uw+DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IrDiW7tF; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so12118413f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Jan 2025 05:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736256923; x=1736861723; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J7FFIEdHS9CbAL61Tl5ApigOpZoV4UoWP/2qqHJFSmM=;
        b=IrDiW7tFFBPDNCrpIZfSYCI9kKiIqXHdsw2geF3xrMQpptLb0uPLA4OS7g2e+c/eCJ
         /wdDtlNcTGHVDDkouNeGLoD8SitYnPeIF4YA9Q1NQXeIWHoXePPe+SRFiYHKd9cBosSD
         iXF0YEcBGK08fw+X+cQndtTUK2bmGqVZJEI7BwysapFKOBEg/G/KJfX/dprrEprRT7m3
         dLRuwZgKvRMtOZ43iWrJjapSldx1NR60Mh8GKrWVie0+ImzPDfZOcL0YJ1Vj/DhvwJ9b
         VXDx6x+Q2DZFvaJgeRET9dFJhU7ihS3autCDdKjW6xN08qwIweptDPXJTsrcOdoK6e/e
         4Yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736256923; x=1736861723;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J7FFIEdHS9CbAL61Tl5ApigOpZoV4UoWP/2qqHJFSmM=;
        b=e0TOCWXdHhn0wesNQ98ZGw+bpD5+RxUIpMWBcpRXxIKUFNPRNiby5a449nqj2AKP18
         FFivis5qRTZtgOAeKXvHDAl28oK39lrnYYDqFVTbAe1LwX7BCTM8f+8X+cL8Z07+EREi
         WQZIKFmKx8PA274i/kriarCozSPydriXMTg604XHeXnBFpVcAD8vSV+QxxvLTp+JnJws
         lVM8J6ZK+NvuVaFRKp4VWKgQ6ThnAty1M7lPZ6o/n/vHhKCTkrGC1NoYTgctJRx6jqeb
         AeTfh4ootrb/yTdZ7+rDmAOFQSgllNnseokDNy5e0ixjmRaH2WdAKgEKDjSrhdCSNnWU
         M3oQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6Fz9RxCckZdxF3kWET32VTN7JvBiVb1eBRd7CIID8EvxXSnZ0gEy6u82CdJtPWmuXsaSLhb6igzUV+PsIcuA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr8lXztZkxoKESF9D8i/fnIkCOfGIx+143s9hzdASlOqnIconE
	krOga4pI0uQSryXaJnL7948yoj9Lt3xQTdrYF3q/GuPdrhjDCxuYCo/v01RdCaDefwiVBxRhov4
	b
X-Gm-Gg: ASbGncucc6XacosDqeCDff7gESD5QZyljn5w93jbmiWVk+1ogQSks0kICvAYrErENwA
	X0ungCK/w3pHMdKJ7qLBmcdJwmQnl1t3OnLw7/FOhMid8P4ldSPh2dxAXdp7SEO6kmK/poRaAbb
	ForLVstfN19S323BFNlDxsEa1Ke9q3GqaTVltvcpoR/ma97GHagkJqlxqnxCyuvLqEfJA7LvsCP
	bFlEJJeDkneRkblK6HOCaNDJW23Fv3x9LgpUI9VXfVBlQvOr3rfmmDvwqYpyQ==
X-Google-Smtp-Source: AGHT+IGcx6zv+W7uELezmWMCmgGv2pbdtmIgaj3rQCqkbfeqR1hydKp/UfPE/8wdBxQsYajS2jxmFA==
X-Received: by 2002:a05:6000:186d:b0:386:1cd3:8a08 with SMTP id ffacd0b85a97d-38a221ed256mr58676524f8f.5.1736256923354;
        Tue, 07 Jan 2025 05:35:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828817sm51326659f8f.1.2025.01.07.05.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:35:22 -0800 (PST)
Date: Tue, 7 Jan 2025 16:35:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karan Tilak Kumar <kartilak@cisco.com>
Cc: Sesidhar Baddela <sebaddel@cisco.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] scsi: fnic: delete incorrect debugfs error handling
Message-ID: <a5c237cd-449b-4f9d-bcff-6285fb7c28d1@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Debugfs functions are not supposed to require error checking and,
in fact, adding checks would normally lead to the driver refusing to load
when CONFIG_DEBUGFS is disabled.

What saves us here is that this code checks for NULL instead of
error pointers so the error checking is all dead code.  Delete it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/scsi/fnic/fnic_debugfs.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/scsi/fnic/fnic_debugfs.c b/drivers/scsi/fnic/fnic_debugfs.c
index caee32bc9190..5767862ae42f 100644
--- a/drivers/scsi/fnic/fnic_debugfs.c
+++ b/drivers/scsi/fnic/fnic_debugfs.c
@@ -679,46 +679,23 @@ static const struct file_operations fnic_reset_debugfs_fops = {
  */
 int fnic_stats_debugfs_init(struct fnic *fnic)
 {
-	int rc = -1;
 	char name[16];
 
 	snprintf(name, sizeof(name), "host%d", fnic->host->host_no);
 
-	if (!fnic_stats_debugfs_root) {
-		pr_debug("fnic_stats root doesn't exist\n");
-		return rc;
-	}
-
 	fnic->fnic_stats_debugfs_host = debugfs_create_dir(name,
 						fnic_stats_debugfs_root);
-
-	if (!fnic->fnic_stats_debugfs_host) {
-		pr_debug("Cannot create host directory\n");
-		return rc;
-	}
-
 	fnic->fnic_stats_debugfs_file = debugfs_create_file("stats",
 						S_IFREG|S_IRUGO|S_IWUSR,
 						fnic->fnic_stats_debugfs_host,
 						fnic,
 						&fnic_stats_debugfs_fops);
-
-	if (!fnic->fnic_stats_debugfs_file) {
-		pr_debug("Cannot create host stats file\n");
-		return rc;
-	}
-
 	fnic->fnic_reset_debugfs_file = debugfs_create_file("reset_stats",
 						S_IFREG|S_IRUGO|S_IWUSR,
 						fnic->fnic_stats_debugfs_host,
 						fnic,
 						&fnic_reset_debugfs_fops);
-	if (!fnic->fnic_reset_debugfs_file) {
-		pr_debug("Cannot create host stats file\n");
-		return rc;
-	}
-	rc = 0;
-	return rc;
+	return 0;
 }
 
 /*
-- 
2.45.2


