Return-Path: <kernel-janitors+bounces-3799-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A0E901E66
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Jun 2024 11:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BCFEB25E0E
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Jun 2024 09:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F1776046;
	Mon, 10 Jun 2024 09:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DxD5TyLn"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0839474BE4
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Jun 2024 09:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718012026; cv=none; b=XWnw3s3Ll3s2BGzjUE6PtajNEa/WORLmEg+4m09/50p1M4VqIsz0xT+Q8Q7GONr22rfGxbP9cF4xw63VP3007EGwV0z3uzwyvF3qZgcoaN/1bY/ctwrvO85EsrtLmbmMXDe5TiKWYQj6H6/BkuPa+7OYWSS8Q7kIy5BkdD5gHfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718012026; c=relaxed/simple;
	bh=tLOcVSiD6Eqw6Yy+f53eqMdy4+lsxuB3aeWvrhbUWPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SoyDd4nl46uX5BggpwdmL7IOR7jJNpnYLjtCOXGxVr+tipTiKslZsxcdJ6Fu9bEx/Jr9xQkfGi03BiTXNzLzN/by6laG8OdSAD3xVIKFOEdQvRk6Avn8KUFijBN5VP3qZQJm0ySICrPNlBgnIu1baaW5pX67UXMDJHvfSJL0KR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DxD5TyLn; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5295eb47b48so4857120e87.1
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jun 2024 02:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718012023; x=1718616823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pzVEamgsK8pIhsebOuX84FJsT0b+I1ivveKg0N5OLWc=;
        b=DxD5TyLnUt2vJ5eV6h8gmlNIM5sfKsNMxoZxcrFkXMM+IfaORIQCFuAgNCq9/XIsIX
         /lUn2W+QfQddSG7CeKqJiKdp0uKZm7Hs/Ym7AyuKC6glA4riQ86KUA3AKP35NGCrRWW9
         y+Oi1CbUGU+J/iHI7iVQ3PnwvRRjFVbKPWaER32KwxfApqigTaFEOIXWim1/URWk/SJR
         thiE6UObycwYrvGtt5gYlOUgVDlnP89S7+88D81FJ1Q/ty+dpfXui8OPK1IkBJpJwMn/
         8hb6ap0Nq8wFKgEGZwC3BZbwPKvinfDSyCpWFw0e6Qj9+xWJk5DnAA1tc9FnzhCsyGL6
         3yLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718012023; x=1718616823;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pzVEamgsK8pIhsebOuX84FJsT0b+I1ivveKg0N5OLWc=;
        b=drH/rVkFRGstLRNXdHCAqIOiWRZ/4K2tF1d6eiGh6FIza/k1QoZXoKiO3ZW5Hu09h+
         qbGlIeeeC3qGFBhgeRQKOT+DuQaO+mD2xOiW793e6IwD0olkj96J12UZt3D6Q//I8yIw
         eFE7eX7FAuHTDvwT4szr5gIbBjxUV33/Nd/S5+juQavVoSy+5thtTyZ3zEdPgI0ZPSp7
         6JzSo+TTWQ+Rwd9dRE6NqC0DZNBiBgBzcLLns0dOz7feqpCbD46v3ae4/w5e0jIcOfR5
         tOzRbEqWuaeSY24U4hgzs6kA/5OXTh1ACFm5gGjaHwbCaAIhFbv1r+tjLI2EfkiaNjrR
         tWOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb96H4Wch3WlLZKAyBGjDy3j3OpfMU6i7CyOcFwFy7DqJ5Ly5s1DJWdylwk/5xo7SEmahZHfsf8x/J/T/62plSPzRjCQ4wBRIxzvjELCOd
X-Gm-Message-State: AOJu0YwD+uIGNH2crhbegmyv3G3s3EzhuUP7Gmev021XHPeeigGpSCR+
	dCYjsFTRujRbz3s5+WhPw4tfNJt2VG4r/BnT8hnbBAOGPDd3lKK6L7tK0FTIfd0=
X-Google-Smtp-Source: AGHT+IEjZLgV6Wy1oAxIIdW1ddfOocWe7sK0ReqlNbZA+bPWxFoLzpJukeMXV37eZ5OiEJagfcMF0A==
X-Received: by 2002:a05:6512:61b:b0:52c:7fc3:601 with SMTP id 2adb3069b0e04-52c7fc306f4mr2851793e87.61.1718012023012;
        Mon, 10 Jun 2024 02:33:43 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f0d512556sm7087985f8f.29.2024.06.10.02.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 02:33:42 -0700 (PDT)
Date: Mon, 10 Jun 2024 12:33:39 +0300
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
Subject: [PATCH 1/2] PCI: endpoint: Clean up error handling in vpci_scan_bus()
Message-ID: <68e0f6a4-fd57-45d0-945b-0876f2c8cb86@moroto.mountain>
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

Smatch complains about inconsistent NULL checking in vpci_scan_bus():

    drivers/pci/endpoint/functions/pci-epf-vntb.c:1024 vpci_scan_bus()
    error: we previously assumed 'vpci_bus' could be null (see line 1021)

Instead of printing an error message and then crashing we should return
an error code and clean up.  Also the NULL check is reversed so it
prints an error for success instead of failure.

Fixes: e35f56bb0330 ("PCI: endpoint: Support NTB transfer between RC and EP")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-vntb.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
index 8e779eecd62d..7f05a44e9a9f 100644
--- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
+++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
@@ -1018,8 +1018,10 @@ static int vpci_scan_bus(void *sysdata)
 	struct epf_ntb *ndev = sysdata;
 
 	vpci_bus = pci_scan_bus(ndev->vbus_number, &vpci_ops, sysdata);
-	if (vpci_bus)
-		pr_err("create pci bus\n");
+	if (!vpci_bus) {
+		pr_err("create pci bus failed\n");
+		return -EINVAL;
+	}
 
 	pci_bus_add_devices(vpci_bus);
 
@@ -1338,10 +1340,14 @@ static int epf_ntb_bind(struct pci_epf *epf)
 		goto err_bar_alloc;
 	}
 
-	vpci_scan_bus(ntb);
+	ret = vpci_scan_bus(ntb);
+	if (ret)
+		goto err_unregister;
 
 	return 0;
 
+err_unregister:
+	pci_unregister_driver(&vntb_pci_driver);
 err_bar_alloc:
 	epf_ntb_config_spad_bar_free(ntb);
 
-- 
2.43.0


