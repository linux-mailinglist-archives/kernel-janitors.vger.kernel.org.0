Return-Path: <kernel-janitors+bounces-1420-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5C1836B8A
	for <lists+kernel-janitors@lfdr.de>; Mon, 22 Jan 2024 17:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D48D281327
	for <lists+kernel-janitors@lfdr.de>; Mon, 22 Jan 2024 16:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BE63FE53;
	Mon, 22 Jan 2024 15:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oHfHWQAd"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1972A3FE38
	for <kernel-janitors@vger.kernel.org>; Mon, 22 Jan 2024 15:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705936806; cv=none; b=sSBomklptvCnPeMdT3eLoagnUNCyCRabM5PY/dMWAYU5rvxzPnW3pdtdkZdrqvQi1RZpkzWdaiFt8MXhHVD2AzL07m2RIXZ4R6qi1JGnvSfmx4Ig9GE4aNISV04YdvFRlEyfJq12udNMcZjZYMFL+3j03YwnLKbv6+fjsxgaO+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705936806; c=relaxed/simple;
	bh=m4MGMs661LvxuVoMi2VRNPo731uFP8vGEpbQg/5j/tM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HQF71O6kw5fLt7+c6FUkfLk4erY7yW8TYyHBjOW5oiQ9x2Q6Gs5V7hK1RYakfsX/kOjhYpe+KPYu0EWInVoeJe/dcXBwpJEtxp5vkXL+4rY+L6uqVmkupB5Wk6VgSYpuc0LIBKqSKin7ZlFRvRFqR24uNGdkREDg9uESHctwbUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oHfHWQAd; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e60e137aaso36821935e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 22 Jan 2024 07:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705936803; x=1706541603; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=51vsAZMyiuoWGilDubxFAIW5UswLDidC9cUFWVb4jQY=;
        b=oHfHWQAdkaHGPHs//F5eAiexnsh9KX5DvNpxTiNZNguOD2+vKBA1rtzBZpUjQ+FOBb
         fatcC+x+Jfsr2oBbn5zGtjUzmULZ4sZvWcTNZVKqqMHIaSB05vXbcIexNcPktqhzkA6K
         FcFAg734N8bbDL7nObYWGZL3JSpXWUdzeJNkC0RM14ccH5/48bdBc6RsPDOIF39nhMh5
         Xy84hu7GTLgRdj7Tbaj26/+SwHCIS+RoH4e9LvG37JU8T7TGYxnlGasbD9GMbGAj3WHR
         Psy9gSAGTNIth6eYXA5MGZG7j0s9ODBerF3k92yhJ4i3ypnSU0OzVAvz8/1qUq77g+eF
         Qpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705936803; x=1706541603;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=51vsAZMyiuoWGilDubxFAIW5UswLDidC9cUFWVb4jQY=;
        b=CzI3JcK7Yd4Y6Airjc3NvXPuaatdSESqbZj0jzuHMIn5cYBQcibtlzyPCvflFYYwmK
         PAVcujb0wDW2163OhoMFDm3ZoxdwME8J7bNGG7DaPoqn9vfQyIfrZRo1zGzwYvoF0zto
         HfQA3wi1QpJYI8sMFqHyzr+9YYXWHn0TQ/W1S76AJ3U90M9PFDA44nVQsSs49FRMlzEQ
         sOK5Q8ngQ//aNjxLcm71cl9OKZOW0rnzQHW9Bww72j3ghp5DT9ZLlK5PPs++oUijLaFy
         0UTY1ZhLSzGADZf3oIbdBjCuv4QYppOKoVwi/JwQd3YDY3RzbYZwajgc9/44SKBjCRhF
         71XA==
X-Gm-Message-State: AOJu0YzREReOeJEuJ2RSmykwzkMLN2bXqfF5eBhalD1sUs+23Uda+4mT
	3mdmlZml8m1s3JBRBewNwHxom5ywk1/Y6jIOSRfwnQwU3989+20TUb95zvKobag=
X-Google-Smtp-Source: AGHT+IHTV1kA/0qXPnxQ84QWYnvv/6NzOjiS+BvHkGqypUc1brW25YLtC5GJJCpXssCVPWm8h3NEew==
X-Received: by 2002:a7b:c455:0:b0:40e:47fb:fcca with SMTP id l21-20020a7bc455000000b0040e47fbfccamr2747709wmi.147.1705936803255;
        Mon, 22 Jan 2024 07:20:03 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id d21-20020adfa355000000b003392a486758sm6401113wrb.99.2024.01.22.07.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 07:20:02 -0800 (PST)
Date: Mon, 22 Jan 2024 18:19:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v3 1/2] PCI: dwc: Fix a 64bit bug in
 dw_pcie_ep_raise_msix_irq()
Message-ID: <d0d5b689-9437-43cd-8c1f-daa72aeafb2e@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "msg_addr" variable is u64.  However, the "aligned_offset" is an
unsigned int.  This means that when the code does:

        msg_addr &= ~aligned_offset;

it will unintentionally zero out the high 32 bits.  Use ALIGN_DOWN()
to do the alignment instead.

Fixes: 2217fffcd63f ("PCI: dwc: endpoint: Fix dw_pcie_ep_raise_msix_irq() alignment support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: fix typo in commit message
v3: Use ALIGN_DOWN() instead of ANDing with ~aligned_offset (this is a
    style improvement).

 drivers/pci/controller/dwc/pcie-designware-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 5befed2dc02b..51679c6702cf 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -551,7 +551,7 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	}
 
 	aligned_offset = msg_addr & (epc->mem->window.page_size - 1);
-	msg_addr &= ~aligned_offset;
+	msg_addr = ALIGN_DOWN(msg_addr, epc->mem->window.page_size);
 	ret = dw_pcie_ep_map_addr(epc, func_no, 0, ep->msi_mem_phys, msg_addr,
 				  epc->mem->window.page_size);
 	if (ret)
-- 
2.43.0


