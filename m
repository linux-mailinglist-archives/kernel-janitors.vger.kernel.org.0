Return-Path: <kernel-janitors+bounces-7062-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B167FA329EF
	for <lists+kernel-janitors@lfdr.de>; Wed, 12 Feb 2025 16:27:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A02B1887034
	for <lists+kernel-janitors@lfdr.de>; Wed, 12 Feb 2025 15:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A6E2135B0;
	Wed, 12 Feb 2025 15:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TpMAppSM"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F40F2116FC
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 15:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739373951; cv=none; b=qet2Riv6f/KCVrLaNtXal/rOUqAcwgKHbYIdok/vVgqevy2vXK7G/Y1KViRmE86gjqeH0jqe8ADLlSeQzxEX9qght841SjbbcErBjovxqLDkeR0gUL9L67Nw5ZmGy8DX0We2HmotSgL7fp8fCf3NYWZJ12SijMamIWVLfgErkOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739373951; c=relaxed/simple;
	bh=9Xev0WPL3aqSoOZ+iEdwAurHlCOlmppDeErE0Vxv/pY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m99vvnfOIFZmPK3dypuKYa5vgbEnrgb7Yvj+PO1HM6PD2eAYGGaGRckx5ryU+lCtPgH/2IzsQV9FqCxdxLtim+TLMwxxy0cRrPsqie+IZiRsYdL72UASOmyLTzGf6r1kb2wgwZn3NxP/5OIhZtFMB49LSQ6y6MOiubN9OPXNmSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TpMAppSM; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dea50ee572so2856613a12.1
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 07:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739373948; x=1739978748; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m7M5GwfQ+3LOfRzgrXxTqKn9y3djRSUzmsbdmGEOdrs=;
        b=TpMAppSMzGe7Qgv4SD2KCRxTXd7Cs/VAiAWIT/QKGvfTP+ILlGxHKXM4soOQca0ag8
         8GDz5fTZziGjiehapCvZXCW+BJbJclA1dYlLH3SJu359VtyhHMXVb0eICI2ME5DhLHGC
         +nZA9GeBm/Y47BBKn3Fc/Y4k2zMIBp2F/YobO3m+mA18daRp5pzAHM0sMUNQiSVRNIq1
         C6PEo5joERGid0roqAMquRmaXxMokaHzYJQDZIOxlQSYxFCK/pgRLk3SbdBLL1FcOIll
         YUllb/JwuL2OfRpxrDA1g6h4Xzo7dit65ZLhVDQkXsBWtmw7F6MLYxtGtTYyxVqNZLKa
         DmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739373948; x=1739978748;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m7M5GwfQ+3LOfRzgrXxTqKn9y3djRSUzmsbdmGEOdrs=;
        b=Z31hP8818vXt4eGz5RR1RTqO9Bb0SUPDz8Q5K5Vw5XzRS4dfNhKWI+KgG3J0JmLsoG
         SlYTJ/ZoCXUliccW8wl06SmaJg8YctulQjB1vWerMQIFGcF/bf78Tf5a/GsDOo7rOFoq
         2tkBSrTjh9lj6rg3qEqGXPyrKGGNdEA8nXgRXtP/wIZIsd/KCpOXnPfF/uSfDPw9i7+o
         llTgT8v9dJYZti70f42OiTKy5Oj2PJWWEd+SmV04MqCFiqVYpHx6YNNFruThKA6N6rID
         tMaOc084xjch5c6SG0VDru/NFanbP91GacQasOzbrYWOmPN7oMVFnYAKug8XXEuOw/Kf
         +6iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG3F1bWUZhReekhs/N+ddxWBayd7LbNv7BNLBxzhFIZA1vqsJYGiCTGf0dBJZi1VIzoJJRDB5xGPCIQwvusQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCETinCLtn4HHB5cyvKQAruiEU0Y/SdCdZsRfapoNpbiPPQ0gr
	nMtUfgdXYILDNTNKXSutNuv1lxI/0Kvn0es89oLcvTm3ib07glBZwqfDAlSNspA=
X-Gm-Gg: ASbGnctBBz4HNyyHx/PaikoiV1EKBQ9L3v/jUTqwGnHvOaXEpXcz65QcZpb8jYNW1t0
	/6ixNwLFo3DfmEYwyI1JXl7NKsn6j424t0lWe7RO1JXOj7pdA8FtgTghhKs+9o0jJJ1/juHGCly
	kHhHHxTZl5YCmWj1JHpIMEhWmv5gCJidxH+5dLzYdTzUX4+JAQvHdcgcZCk5IjEhBz97wGDkOCv
	syS3VYY2kMi4dC5fo77HmxIbKNjq3jmb163i0hkE16BRmeGTxHSIcEk6bZ5AYXs+z0IZPWrWT8M
	dCSgmyIEtmk+Ms5UWWla
X-Google-Smtp-Source: AGHT+IGbFzs4+6mWsWpYBe7JoXi+IDrmdHZBXOXvhE9G4jtbV7nz5cMuSQAFACr2ooMFlOpmsOYjfg==
X-Received: by 2002:a05:6402:40c7:b0:5de:ab36:699c with SMTP id 4fb4d7f45d1cf-5deade00bc6mr3449416a12.30.1739373947907;
        Wed, 12 Feb 2025 07:25:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5de59f893ebsm9040916a12.45.2025.02.12.07.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 07:25:47 -0800 (PST)
Date: Wed, 12 Feb 2025 18:25:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Cc: Mustafa Ismail <mustafa.ismail@intel.com>,
	Tatyana Nikolova <tatyana.e.nikolova@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] ice, irdma: fix an off by one in error handling code
Message-ID: <47e9c9a0-c943-440c-aea7-75ff189c5f97@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If we don't allocate the MIN number of IRQs then we need to free what
we have and return -ENOMEM.  The problem is this loop is off by one
so it frees an entry that wasn't allocated and it doesn't free the
first entry where i == 0.

Fixes: 3e0d3cb3fbe0 ("ice, irdma: move interrupts code to irdma")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/infiniband/hw/irdma/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/irdma/main.c b/drivers/infiniband/hw/irdma/main.c
index 1ee8969595d3..5fc081ca8905 100644
--- a/drivers/infiniband/hw/irdma/main.c
+++ b/drivers/infiniband/hw/irdma/main.c
@@ -221,7 +221,7 @@ static int irdma_init_interrupts(struct irdma_pci_f *rf, struct ice_pf *pf)
 			break;
 
 	if (i < IRDMA_MIN_MSIX) {
-		for (; i > 0; i--)
+		while (--i >= 0)
 			ice_free_rdma_qvector(pf, &rf->msix_entries[i]);
 
 		kfree(rf->msix_entries);
-- 
2.47.2


