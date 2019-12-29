Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F54712C385
	for <lists+kernel-janitors@lfdr.de>; Sun, 29 Dec 2019 17:43:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbfL2Qnr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 29 Dec 2019 11:43:47 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38667 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfL2Qnr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 29 Dec 2019 11:43:47 -0500
Received: by mail-wm1-f66.google.com with SMTP id u2so12434327wmc.3
        for <kernel-janitors@vger.kernel.org>; Sun, 29 Dec 2019 08:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G2qQhAzhqDGEo0p96MPBdEHF9c7hPsDdSnYdQveEe3o=;
        b=JhCiMWuGShUVHoy1o1tddMa3lr0rIJQca6C9roz/OGqWz7cil1/AREAe3MVVl5M4tw
         rrNLKRklJ2VuwSddujgMdGkuIQiqKVXsGV21MaOY79t5lIphKct7FbvSyb+VOkpLDaai
         exjCGbn3gQLOwBC0O1msypNTUsblvYMJx/61FjlcRsOgBioYrzNpdswGEc2TlTO7pPAg
         KXTs9TOXLieRvMd0XCHFpKKxxBN680DNhU2KU4f7guztAOZQkxQzDIT9RwclQtzEfOHT
         rQthpKJUAWApIRkwoOaqHY6gYMY/9ePgK3+cwNq5L4yj8mWChY7zF1DFU1+bAXDrtHqu
         pjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G2qQhAzhqDGEo0p96MPBdEHF9c7hPsDdSnYdQveEe3o=;
        b=gQYo3sxT71nzTbdAQSMrOKadURMUunZwreBd9g8kWkI1ZC9xIjZJ0q0lNX+8/uWLxS
         slrqEis5/MqjONA98nT4uckCycIFJdSJOeQUtt5EaLT3wlykE/GrA1jOAYIyC4jt/1LU
         cLvORDEdSEVqBuHjc7URM/YCtn222CGJ8N6KQv3XYbstwj7cDV+b6/o3kbstMjMAEKPe
         KshZY/blGogn9rgggn8EsTZqO+0cZi6Tbk1H22osmTNgUBtZ65bUwG0GcgckFbqoe/+p
         Yoxtb5fPwSObe12sEMm4kUdb32Kykzd10zo/Bl6k6QFaJn87S2WvLB51wSlHEBRT4Bck
         mPQg==
X-Gm-Message-State: APjAAAU41tlht5i1OfzaKsfXzjToqrgA21dTVohbM9X4Ywepsi+CfFTV
        163NP95mvKiX1qeCB1QYY351yUoo
X-Google-Smtp-Source: APXvYqzE/rxfc3SebGWfH7LbUpjMcMwR6ojCIh9D9gK62gglA5X8bWkToYc8EspFo4lQu39CMIraww==
X-Received: by 2002:a1c:a982:: with SMTP id s124mr29314900wme.132.1577637824789;
        Sun, 29 Dec 2019 08:43:44 -0800 (PST)
Received: from archlinux-laptop.lan (199.110.7.51.dyn.plus.net. [51.7.110.199])
        by smtp.gmail.com with ESMTPSA id j2sm18368352wmk.23.2019.12.29.08.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2019 08:43:44 -0800 (PST)
From:   rhysperry111 <rhysperry111@gmail.com>
To:     kernel-janitors@vger.kernel.org
Cc:     Rhys Perry <rhysperry111@gmail.com>
Subject: [PATCH] Added AU6625 to list of supported PCI_IDs
Date:   Sun, 29 Dec 2019 16:43:39 +0000
Message-Id: <20191229164339.7227-1-rhysperry111@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Rhys Perry <rhysperry111@gmail.com>

This is my first kernel patch!

I have added the AU6625 PCI_ID to the list of supported IDs and done some 
general formatting to make it fit in a bit more with the code that is already 
there. From general usage there seems to be no problems.

Signed-off-by: Rhys Perry <rhysperry111@gmail.com>
---
 drivers/misc/cardreader/alcor_pci.c | 8 +++++++-
 include/linux/alcor_pci.h           | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/cardreader/alcor_pci.c b/drivers/misc/cardreader/alcor_pci.c
index 259fe1dfe..cd402c891 100644
--- a/drivers/misc/cardreader/alcor_pci.c
+++ b/drivers/misc/cardreader/alcor_pci.c
@@ -38,12 +38,18 @@ static const struct alcor_dev_cfg au6621_cfg = {
 	.dma = 1,
 };
 
+static const struct alcor_dev_cfg au6625_cfg = {
+	.dma = 0,
+};
+
 static const struct pci_device_id pci_ids[] = {
 	{ PCI_DEVICE(PCI_ID_ALCOR_MICRO, PCI_ID_AU6601),
 		.driver_data = (kernel_ulong_t)&alcor_cfg },
 	{ PCI_DEVICE(PCI_ID_ALCOR_MICRO, PCI_ID_AU6621),
 		.driver_data = (kernel_ulong_t)&au6621_cfg },
-	{ },
+	{ PCI_DEVICE(PCI_ID_ALCOR_MICRO, PCI_ID_AU6625),
+		.driver_data = (kernel_ulong_t)&au6625_cfg },
+	{},
 };
 MODULE_DEVICE_TABLE(pci, pci_ids);
 
diff --git a/include/linux/alcor_pci.h b/include/linux/alcor_pci.h
index 4416df597..8274ed525 100644
--- a/include/linux/alcor_pci.h
+++ b/include/linux/alcor_pci.h
@@ -17,6 +17,7 @@
 #define PCI_ID_ALCOR_MICRO			0x1AEA
 #define PCI_ID_AU6601				0x6601
 #define PCI_ID_AU6621				0x6621
+#define PCI_ID_AU6625				0x6625
 
 #define MHZ_TO_HZ(freq)				((freq) * 1000 * 1000)
 
-- 
2.24.1

