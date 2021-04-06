Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66B7F355D2C
	for <lists+kernel-janitors@lfdr.de>; Tue,  6 Apr 2021 22:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347256AbhDFUt3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 6 Apr 2021 16:49:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347233AbhDFUt2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Apr 2021 16:49:28 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C07AC061756;
        Tue,  6 Apr 2021 13:49:19 -0700 (PDT)
Received: from ipservice-092-217-067-214.092.217.pools.vodafone-ip.de ([92.217.67.214] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1lTsdP-0005Yc-QR; Tue, 06 Apr 2021 22:49:15 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 06/11] staging: rtl8188eu: clean up usb_read16
Date:   Tue,  6 Apr 2021 22:48:24 +0200
Message-Id: <20210406204829.18130-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406204829.18130-1-martin@kaiser.cx>
References: <20210406204829.18130-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Remove unnecessary variable, summarize declaration and assignment.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
index 0172405c815e..915bf86237b0 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
@@ -306,13 +306,10 @@ u8 usb_read8(struct adapter *adapter, u32 addr)
 
 u16 usb_read16(struct adapter *adapter, u32 addr)
 {
-	u16 wvalue;
-	u16 len;
+	u16 wvalue = (u16)(addr & 0xffff);
 	__le32 data;
 
-	wvalue = (u16)(addr & 0x0000ffff);
-	len = 2;
-	usbctrl_vendorreq(adapter, wvalue, &data, len, REALTEK_USB_VENQT_READ);
+	usbctrl_vendorreq(adapter, wvalue, &data, 2, REALTEK_USB_VENQT_READ);
 
 	return (u16)(le32_to_cpu(data) & 0xffff);
 }
-- 
2.20.1

