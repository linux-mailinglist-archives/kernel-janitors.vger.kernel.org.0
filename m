Return-Path: <kernel-janitors+bounces-3800-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B589B901E6B
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Jun 2024 11:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D0422848BB
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Jun 2024 09:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7453578C71;
	Mon, 10 Jun 2024 09:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ax/Mf6sL"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B78770F6
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Jun 2024 09:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718012037; cv=none; b=QDvhVHQ+k/uh14jSuXVx2WL9i0qtEJca7H05t6igb4uvHvEB1E2Do0uJg5ACujaXbo6bp96xrHD0CRx+DEsRbgLpPJRKgoR9eFyr9PTKqvdZVG8HlicAgsMpuU9pZQAqK1WrwFfx3Hex5CwyXSbQx6FrvGpWfcxhTel6T2fTZ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718012037; c=relaxed/simple;
	bh=Y4u8UCZ3N7F3nxprunHyg90+5gvVlDurQflxxTdao7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=RV0rfDFFqXRwF0pgRrSy4dzp7MBO41Q8BDcgCasTD5jotSKT/yDrXsw1/Q4/5W3RyO40KyrFQAvtVQAnXm3Z2E/9QNW235pgFn4xhROSm9Hj5YEXY83Tplxhsvy21OtPfJG8++0FxcB8oWAv9to9fxL23qEHchPcP68w4Zc4ka4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ax/Mf6sL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4217f2e3450so12821835e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jun 2024 02:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718012034; x=1718616834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JfyZWlscKr9Yqn9KGPRWZidB/h/j24q5WeuU1z+bRpQ=;
        b=Ax/Mf6sLHu5jOpJbfna2GjAKKyTeZlVxGKt9vqDmcPFxgHzmMdUGuRTeOn83du+Jrn
         NAwsgmrhIjc70Fj1RoJuX9gvm2E3bGDsniWdFEa5ysGYETq7gvLwQ65pT2A+3BOyol3z
         dB4G+R8TSoBEFeO7AQvoOtGRWHryUBFEKOhDXwy82D/Jo/PyQb34soDNfEe5enHOki3A
         v0rnokt/IqPZEbaASx9rShbaLZZkLXew5yi12On6MZ9+kocUk2Z4pa9ew48212Ikkl7c
         EsB8CKDT8aUwcAcevdMJmnu0ed9rlj/idmM3vRse096a538WU4bmfXL0+w1BSWFnG6UQ
         RFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718012034; x=1718616834;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JfyZWlscKr9Yqn9KGPRWZidB/h/j24q5WeuU1z+bRpQ=;
        b=G5D1lrS0HV34WsN/b2471cxJzsH2HuWsGds4pEodAGHmrsSxrpLuu7yy5WhNJGm+Tx
         rB4LcvyQc932X/OsSc247yWgO/NnHWOIqzQSqVzvqwJXvgUf5twk3/SfudhJ7PcJ+4jz
         4eMLu3lVHMFivVUImjIZQzj3pNn8nrsXLCZClJ2laGjMNct6oVAwOx6O9NF1zaJyXvao
         L9iZi0d0ZpCeMXB9+Ae3gxHO24K9+fqXxhsOKZO2N3qilIcx9pZZoeuf9QI4/v13XkUx
         eYhk8YFlj7tMUcu6EhHreLh9W1H3whGpFaARSkZBGrOlOewFF+FQoyVhLCrVtn9JdemZ
         hApA==
X-Forwarded-Encrypted: i=1; AJvYcCXd14j6lCUMJwg65YPYvPZTVcbZxFxUcxEGQ2pKM/NfyKWDobs89YJ62ts7bXo8q6jfl3Gzu2JUd9obmuX97oNaxtKzia7M621hl6l7TeUx
X-Gm-Message-State: AOJu0Yx/Om3QsD/vQrvgZJtBGlQp6rWF5AouUVeuNFjWv+clOn2hHGTK
	kzmHIPJAc3+PcIhmsYCs9gyvDsuh6di/oVZ3bAsnHEWfzjgfEbqvRilQBNkJYMg=
X-Google-Smtp-Source: AGHT+IHV0SNoUbda6LDPv2KbyHC0xdaTqp83BCe78LwJZFcnLMqusq8VSWFXidvAy3Xd8mcDYj3/2w==
X-Received: by 2002:a05:600c:4748:b0:421:edf4:1e89 with SMTP id 5b1f17b1804b1-421edf42181mr16200015e9.4.1718012033827;
        Mon, 10 Jun 2024 02:33:53 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2c7e8fsm136565045e9.38.2024.06.10.02.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 02:33:53 -0700 (PDT)
Date: Mon, 10 Jun 2024 12:33:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, ntb@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] PCI: endpoint: Fix epf_ntb_epc_cleanup() a bit
Message-ID: <aaffbe8d-7094-4083-8146-185f4a84e8a1@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6eacdf8e-bb07-4e01-8726-c53a9a508945@moroto.mountain>
X-Mailer: git-send-email haha only kidding

There are two issues related to epf_ntb_epc_cleanup().
1) It should call epf_ntb_config_sspad_bar_clear().
2) The epf_ntb_bind() function should call epf_ntb_epc_cleanup()
   to cleanup.

I also changed the ordering a bit.  Unwinding should be done in the
mirror order from how they are allocated.

Fixes: e35f56bb0330 ("PCI: endpoint: Support NTB transfer between RC and EP")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-vntb.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
index 7f05a44e9a9f..874cb097b093 100644
--- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
+++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
@@ -799,8 +799,9 @@ static int epf_ntb_epc_init(struct epf_ntb *ntb)
  */
 static void epf_ntb_epc_cleanup(struct epf_ntb *ntb)
 {
-	epf_ntb_db_bar_clear(ntb);
 	epf_ntb_mw_bar_clear(ntb, ntb->num_mws);
+	epf_ntb_db_bar_clear(ntb);
+	epf_ntb_config_sspad_bar_clear(ntb);
 }
 
 #define EPF_NTB_R(_name)						\
@@ -1337,7 +1338,7 @@ static int epf_ntb_bind(struct pci_epf *epf)
 	ret = pci_register_driver(&vntb_pci_driver);
 	if (ret) {
 		dev_err(dev, "failure register vntb pci driver\n");
-		goto err_bar_alloc;
+		goto err_epc_cleanup;
 	}
 
 	ret = vpci_scan_bus(ntb);
@@ -1348,6 +1349,8 @@ static int epf_ntb_bind(struct pci_epf *epf)
 
 err_unregister:
 	pci_unregister_driver(&vntb_pci_driver);
+err_epc_cleanup:
+	epf_ntb_epc_cleanup(ntb);
 err_bar_alloc:
 	epf_ntb_config_spad_bar_free(ntb);
 
-- 
2.43.0


