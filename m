Return-Path: <kernel-janitors+bounces-1378-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 265238325B0
	for <lists+kernel-janitors@lfdr.de>; Fri, 19 Jan 2024 09:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC2671F21E71
	for <lists+kernel-janitors@lfdr.de>; Fri, 19 Jan 2024 08:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A1322318;
	Fri, 19 Jan 2024 08:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HUmJMz+D"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26721DDC3
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Jan 2024 08:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705652665; cv=none; b=SHleMzzJim9g+ALydaNx8OZWkMfB75bfnzbGkWKTAmRrajgTGeFO7zC3b011WeoUQS3u8LY3cL+CKVrsHkPBBZqNkig4bR7+HlMj+qw8amqkdEG+0GwBCaKYwCPT64T4mto3A6+QFGUHULxkINyd5ZuTSPmXGtI9LYvCE76Ojww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705652665; c=relaxed/simple;
	bh=3TLlUYyEGjSmddeI1m8eFgCpNTx2/FhPKC8ben5SFMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lLNJwj0PWcKssQSmwfaAKrDOkn3PtVIOLViFZqcOZp2GZ6S0aDKyessVMhGnO7FGph4RT8/we3J3+f4fOubVAbU2Qh+vSspWbnUNou5OkrYz+sCgPICmurVCmCu+GieKyl+MmWoDrMvxzu9rmdbqIOXku67G8yET6CLPS6GZzoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HUmJMz+D; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40e490c2115so9569335e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Jan 2024 00:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705652662; x=1706257462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JWMsaxBTQZjTZlrkYTLuJn10R3NfYJxlM8FKkmLstP8=;
        b=HUmJMz+DRbec4In328RpcTWO28pMRgUt7mU+9ovJjPg06Rlyj+8x3OUP25+n9XIoS5
         h9XHI3pTTWTYUPLiHQqUUa38edzD9F0zF9YxpnVDxCkDVgLuamYpL2ih4KzRPqSrPVZX
         IyAW05NWZE1zieLDM1sVpj5D8quOxDJan4HgHrc7OykErzXMoiS6259oxXCt4pJzBvQ6
         zSE4OIeLG8Wo6Qd+dA10Xt8QxCudxyp8/HM67OoT8SStvjt7oQDjz3FjiVx1WO/O+Vgs
         ukuPoSOGFqnDM+lKjSQdlfTL+mw4h1l1VmSCJ5RBQTFA2X0Hr1tCU4qRc7HXfx06ixPq
         bpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705652662; x=1706257462;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWMsaxBTQZjTZlrkYTLuJn10R3NfYJxlM8FKkmLstP8=;
        b=LXJkPUghB3yLjVDUkBrM9t31YeS6F+cmK/TIJdyvymHFyFZBIlBAEYQArjeHPXlqf7
         vYOByEPyjwREv9leAq0DYT6Z7zNVdVb7qzhnKa3K2WK2HsVokPwj0Y9ec8db54N7iOU4
         Ta+gx8dxuJ63YJngoSFQMG/Y24zxJuh2XD2Xvwz3ApC2s2bzWo8esxtjG1o9ykSP8TUS
         cv92DljGZ6jHdGneyBqHZmQHbIg/hOCEmcos+QYVM2fCw0I6kPf0Pt4gIUnkH546kl4g
         KIsJZVINlx7sdufY51av+eoCgCDF62ybvgZAAyPUsmZ8yevdIK2Ng2I3M3BaPiYlxo5x
         1n9Q==
X-Gm-Message-State: AOJu0Yy+9NoOK/TIOxlcKV3nEmfsLDeZY/szrRTG1MW95SqhYEfVNkgW
	4i1X6S5DiTvwzppGXgbSvNsVML7KH0KVHmQa/IK9nVod71MR/V10LqDZfMDjOKo=
X-Google-Smtp-Source: AGHT+IGyQPLL+hcBaT9LJKH9qfYGXesrPwcI56OtJT1FCONVzdVABw9eLAIvyZD8cXHaj9MjhcQntQ==
X-Received: by 2002:a05:600c:4486:b0:40e:478c:e864 with SMTP id e6-20020a05600c448600b0040e478ce864mr281639wmo.74.1705652662274;
        Fri, 19 Jan 2024 00:24:22 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id jg1-20020a05600ca00100b0040d4e1393dcsm31685700wmb.20.2024.01.19.00.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 00:24:22 -0800 (PST)
Date: Fri, 19 Jan 2024 11:24:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2 2/2] PCI: dwc: Cleanup in dw_pcie_ep_raise_msi_irq()
Message-ID: <e231e268-d537-4613-a87c-876d99ea49e4@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5035dc2-a379-48f0-8544-aa57d642136b@moroto.mountain>
X-Mailer: git-send-email haha only kidding

The alignment code in dw_pcie_ep_raise_msix_irq() and
dw_pcie_ep_raise_msi_irq() is quite similar.  I recently update the code
in the former, so tweak the latter to match as well for consistency sake.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Add this new patch

I wrote two versions of this, one where both patches were folded
together and this one where the style tweaks are separated out into
their own patch.  This is the better version.

 drivers/pci/controller/dwc/pcie-designware-ep.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 2b6607c23541..ccfc21cd0bb0 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -456,8 +456,8 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 	u32 msg_addr_lower, msg_addr_upper, reg;
 	struct dw_pcie_ep_func *ep_func;
 	struct pci_epc *epc = ep->epc;
-	unsigned int aligned_offset;
 	u16 msg_ctrl, msg_data;
+	u64 aligned_offset;
 	bool has_upper;
 	u64 msg_addr;
 	int ret;
@@ -483,8 +483,8 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 		msg_data = dw_pcie_ep_readw_dbi(ep, func_no, reg);
 	}
 	aligned_offset = msg_addr_lower & (epc->mem->window.page_size - 1);
-	msg_addr = ((u64)msg_addr_upper) << 32 |
-			(msg_addr_lower & ~aligned_offset);
+	msg_addr = ((u64)msg_addr_upper) << 32 | msg_addr_lower;
+	msg_addr &= ~aligned_offset;
 	ret = dw_pcie_ep_map_addr(epc, func_no, 0, ep->msi_mem_phys, msg_addr,
 				  epc->mem->window.page_size);
 	if (ret)
-- 
2.43.0


