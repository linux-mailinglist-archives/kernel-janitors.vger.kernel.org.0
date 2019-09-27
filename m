Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B343EC0D80
	for <lists+kernel-janitors@lfdr.de>; Fri, 27 Sep 2019 23:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728442AbfI0Voy (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 27 Sep 2019 17:44:54 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56577 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbfI0Vox (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Sep 2019 17:44:53 -0400
Received: from mail-pg1-f198.google.com ([209.85.215.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <connor.kuehl@canonical.com>)
        id 1iDy2l-0004kn-Po
        for kernel-janitors@vger.kernel.org; Fri, 27 Sep 2019 21:44:51 +0000
Received: by mail-pg1-f198.google.com with SMTP id w13so4386975pge.15
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Sep 2019 14:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uQvH5eP9xpiy0f1cPY42CaQQPMr87X6kYcWUTyFt77M=;
        b=cCVMWJdPWDDFlLWjRUsRjk7t3WRhmpompG5x5MCSJ8bGN2REEbJRpYRSLusg13QmwB
         17fqMVZvdo4k5qAA+fVUiazo+aud5/pjDXTC3+ur+dRaWHi4eaHswnqAm2JrMLGXDnjP
         HUwUHfS0vv2Ct9NPjMy/fg9aup7xfbw3Tpv1+8MFQ9kgxb1Re07rUWPAvXExFjnEf7rP
         IgTngrkIRULN788JYbYfMZsI7lP0PaaT7qP4SWJI7na3GBFGsB47yvUMPfNYFy06X079
         F/+DNS4STSLoYUzbD0QgkZdln721TCAG7eWmEr176WUR96bqD1uMMmkBXHTbTb0L6XYV
         cbFA==
X-Gm-Message-State: APjAAAUpslOFEB5UQBxmoh2WFvOlSnkvR6xLP+FXF1ZslH5oj6bRqGvo
        5e51lc1bU1MYZ1CQPhKPots2UNlBtxM/N51y9Hd/jLnFJ6UuuHW2GwDvJ50+Hwnh6Ux0hrAPzCl
        htBvV7a5vvj/QBiSI/Py5WSHLk9h1ReTYYmIxpY2+qsFC8A==
X-Received: by 2002:a62:2ad6:: with SMTP id q205mr6844850pfq.46.1569620690608;
        Fri, 27 Sep 2019 14:44:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw5fadg5CEjQhSH0zmkl5ewNifNh5xW4jmDcza4yWN2DbT2bNZYx2VRVKTGjCnUlTYTBz1cWA==
X-Received: by 2002:a62:2ad6:: with SMTP id q205mr6844794pfq.46.1569620689563;
        Fri, 27 Sep 2019 14:44:49 -0700 (PDT)
Received: from localhost.localdomain (c-71-63-171-240.hsd1.or.comcast.net. [71.63.171.240])
        by smtp.gmail.com with ESMTPSA id p66sm7150579pfg.127.2019.09.27.14.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 14:44:48 -0700 (PDT)
From:   Connor Kuehl <connor.kuehl@canonical.com>
To:     Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org,
        devel@driverdev.osuosl.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: rtl8188eu: fix null dereference when kzalloc fails
Date:   Fri, 27 Sep 2019 14:44:15 -0700
Message-Id: <20190927214415.899-1-connor.kuehl@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If kzalloc() returns NULL, the error path doesn't stop the flow of
control from entering rtw_hal_read_chip_version() which dereferences the
null pointer. Fix this by adding a 'goto' to the error path to more
gracefully handle the issue and avoid proceeding with initialization
steps that we're no longer prepared to handle.

Also update the debug message to be more consistent with the other debug
messages in this function.

Addresses-Coverity: ("Dereference after null check")

Signed-off-by: Connor Kuehl <connor.kuehl@canonical.com>
---
 drivers/staging/rtl8188eu/os_dep/usb_intf.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_intf.c b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
index 664d93a7f90d..4fac9dca798e 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
@@ -348,8 +348,10 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 	}
 
 	padapter->HalData = kzalloc(sizeof(struct hal_data_8188e), GFP_KERNEL);
-	if (!padapter->HalData)
-		DBG_88E("cant not alloc memory for HAL DATA\n");
+	if (!padapter->HalData) {
+		DBG_88E("Failed to allocate memory for HAL data\n");
+		goto free_adapter;
+	}
 
 	/* step read_chip_version */
 	rtw_hal_read_chip_version(padapter);
-- 
2.17.1

