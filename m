Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25D13355D31
	for <lists+kernel-janitors@lfdr.de>; Tue,  6 Apr 2021 22:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347224AbhDFUte (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 6 Apr 2021 16:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347266AbhDFUtc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Apr 2021 16:49:32 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 924ECC06174A;
        Tue,  6 Apr 2021 13:49:23 -0700 (PDT)
Received: from ipservice-092-217-067-214.092.217.pools.vodafone-ip.de ([92.217.67.214] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1lTsdT-0005Yc-GC; Tue, 06 Apr 2021 22:49:19 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 08/11] staging: rtl8188eu: clean up usb_write8
Date:   Tue,  6 Apr 2021 22:48:26 +0200
Message-Id: <20210406204829.18130-8-martin@kaiser.cx>
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
 drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
index beab5343fda8..e2ff4f70610e 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
@@ -487,14 +487,10 @@ void rtw_hal_inirp_deinit(struct adapter *padapter)
 
 int usb_write8(struct adapter *adapter, u32 addr, u8 val)
 {
-	u16 wvalue;
-	u16 len;
-	u8 data;
+	u16 wvalue = (u16)(addr & 0xffff);
+	u8 data = val;
 
-	wvalue = (u16)(addr & 0x0000ffff);
-	len = 1;
-	data = val;
-	return usbctrl_vendorreq(adapter, wvalue, &data, len, REALTEK_USB_VENQT_WRITE);
+	return usbctrl_vendorreq(adapter, wvalue, &data, 1, REALTEK_USB_VENQT_WRITE);
 }
 
 int usb_write16(struct adapter *adapter, u32 addr, u16 val)
-- 
2.20.1

