Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE3A7BCA38
	for <lists+kernel-janitors@lfdr.de>; Tue, 24 Sep 2019 16:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441353AbfIXO2z (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 24 Sep 2019 10:28:55 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:55164 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389555AbfIXO2y (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Sep 2019 10:28:54 -0400
Received: from mail-pl1-f197.google.com ([209.85.214.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <connor.kuehl@canonical.com>)
        id 1iCloD-00021l-Bn
        for kernel-janitors@vger.kernel.org; Tue, 24 Sep 2019 14:28:53 +0000
Received: by mail-pl1-f197.google.com with SMTP id k9so1232030pls.13
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Sep 2019 07:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5YkNuEOOhfnHxAM0RhiQZB+Aq9qlq6ccg1LuS0lMLf0=;
        b=p2D9iqfoUXkq+UeGK9y5dZ25pxXeQXTYSO7TLhOfsnZVzEk2ha2x5cI5xX/ecAUnVS
         b8qeTYU2MTyyBNDmLsB9Z5zkniPQ3k91GuUad7i+0yYd2fmhFXkhADvlOXFc7eBO6cvT
         Qly0otyAV/l6bDaCP0KIMpp92KXEZFkh6awdl+7CW2jY+slDBf4cZ9nLp3UIxMrCEEkf
         fbUh42Cak8kA+VPyaG9rgE3Zr+Y2MFUXGmSE3XUOIqtDYICZiar+dp8Whr+KSQqYNazj
         9ly6WKXSGrkBI+whCf4d5nWRJFvTUO8Bze/mtzV+I7Zn9ZnxxBu4w6rOyzZ5qnpbJ662
         gIig==
X-Gm-Message-State: APjAAAULmUYIelPOzPQEvn7Wf9jbPNk19h3w34P73R/l6/B9rFDeu8Pg
        X+lYCSSPdkYvA7d4EFzLnQr+BmtFEO/HeI9YeoX++E7AWdK/6azZ1MHBgyr9QYNAzpp3sXhjg6g
        jViWJh3uH9HnCFEVemi7i+/ltPJ2I5U6++0cPeYcDRcZaPw==
X-Received: by 2002:a62:f244:: with SMTP id y4mr3837261pfl.2.1569335331988;
        Tue, 24 Sep 2019 07:28:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzzLi9oMclWpMESAA1tm9M09vstATTbyIZMUv+NYjlAT8Bd3t7W6yLfNh3/LXVbQ5DOkTnItw==
X-Received: by 2002:a62:f244:: with SMTP id y4mr3837240pfl.2.1569335331782;
        Tue, 24 Sep 2019 07:28:51 -0700 (PDT)
Received: from localhost.localdomain (c-71-63-131-226.hsd1.or.comcast.net. [71.63.131.226])
        by smtp.gmail.com with ESMTPSA id 74sm1848668pfy.78.2019.09.24.07.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 07:28:51 -0700 (PDT)
From:   Connor Kuehl <connor.kuehl@canonical.com>
To:     Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org,
        straube.linux@gmail.com, devel@driverdev.osuosl.org,
        dan.carpenter@oracle.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] staging: rtl8188eu: remove dead code/vestigial do..while loop
Date:   Tue, 24 Sep 2019 07:28:19 -0700
Message-Id: <20190924142819.5243-1-connor.kuehl@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The local variable 'bcmd_down' is always set to true almost immediately
before the do-while's condition is checked. As a result, !bcmd_down
evaluates to false which short circuits the logical AND operator meaning
that the second operand is never reached and is therefore dead code.

Furthermore, the do..while loop may be removed since it will always only
execute once because 'bcmd_down' is always set to true, so the
!bcmd_down evaluates to false and the loop exits immediately after the
first pass.

Fix this by removing the loop and its condition variables 'bcmd_down'
and 'retry_cnts'

While we're in there, also fix some checkpatch.pl suggestions regarding
spaces around arithmetic operators like '+'

Addresses-Coverity: ("Logically dead code")

Signed-off-by: Connor Kuehl <connor.kuehl@canonical.com>
---
v1 -> v2:
 - remove the loop and its condition variable bcmd_down
 - address some non-invasive checkpatch.pl suggestions as a result of
   deleting the loop

 drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c | 55 +++++++++-----------
 1 file changed, 24 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c b/drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c
index 47352f210c0b..7646167a0b36 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c
@@ -47,8 +47,6 @@ static u8 _is_fw_read_cmd_down(struct adapter *adapt, u8 msgbox_num)
 ******************************************/
 static s32 FillH2CCmd_88E(struct adapter *adapt, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer)
 {
-	u8 bcmd_down = false;
-	s32 retry_cnts = 100;
 	u8 h2c_box_num;
 	u32 msgbox_addr;
 	u32 msgbox_ex_addr;
@@ -71,39 +69,34 @@ static s32 FillH2CCmd_88E(struct adapter *adapt, u8 ElementID, u32 CmdLen, u8 *p
 		goto exit;
 
 	/* pay attention to if  race condition happened in  H2C cmd setting. */
-	do {
-		h2c_box_num = adapt->HalData->LastHMEBoxNum;
-
-		if (!_is_fw_read_cmd_down(adapt, h2c_box_num)) {
-			DBG_88E(" fw read cmd failed...\n");
-			goto exit;
-		}
-
-		*(u8 *)(&h2c_cmd) = ElementID;
-
-		if (CmdLen <= 3) {
-			memcpy((u8 *)(&h2c_cmd)+1, pCmdBuffer, CmdLen);
-		} else {
-			memcpy((u8 *)(&h2c_cmd)+1, pCmdBuffer, 3);
-			ext_cmd_len = CmdLen-3;
-			memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer+3, ext_cmd_len);
+	h2c_box_num = adapt->HalData->LastHMEBoxNum;
 
-			/* Write Ext command */
-			msgbox_ex_addr = REG_HMEBOX_EXT_0 + (h2c_box_num * RTL88E_EX_MESSAGE_BOX_SIZE);
-			for (cmd_idx = 0; cmd_idx < ext_cmd_len; cmd_idx++)
-				usb_write8(adapt, msgbox_ex_addr+cmd_idx, *((u8 *)(&h2c_cmd_ex)+cmd_idx));
-		}
-		/*  Write command */
-		msgbox_addr = REG_HMEBOX_0 + (h2c_box_num * RTL88E_MESSAGE_BOX_SIZE);
-		for (cmd_idx = 0; cmd_idx < RTL88E_MESSAGE_BOX_SIZE; cmd_idx++)
-			usb_write8(adapt, msgbox_addr+cmd_idx, *((u8 *)(&h2c_cmd)+cmd_idx));
+	if (!_is_fw_read_cmd_down(adapt, h2c_box_num)) {
+		DBG_88E(" fw read cmd failed...\n");
+		goto exit;
+	}
 
-		bcmd_down = true;
+	*(u8 *)(&h2c_cmd) = ElementID;
 
-		adapt->HalData->LastHMEBoxNum =
-			(h2c_box_num+1) % RTL88E_MAX_H2C_BOX_NUMS;
+	if (CmdLen <= 3) {
+		memcpy((u8 *)(&h2c_cmd) + 1, pCmdBuffer, CmdLen);
+	} else {
+		memcpy((u8 *)(&h2c_cmd) + 1, pCmdBuffer, 3);
+		ext_cmd_len = CmdLen - 3;
+		memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer + 3, ext_cmd_len);
+
+		/* Write Ext command */
+		msgbox_ex_addr = REG_HMEBOX_EXT_0 + (h2c_box_num * RTL88E_EX_MESSAGE_BOX_SIZE);
+		for (cmd_idx = 0; cmd_idx < ext_cmd_len; cmd_idx++)
+			usb_write8(adapt, msgbox_ex_addr + cmd_idx, *((u8 *)(&h2c_cmd_ex) + cmd_idx));
+	}
+	/*  Write command */
+	msgbox_addr = REG_HMEBOX_0 + (h2c_box_num * RTL88E_MESSAGE_BOX_SIZE);
+	for (cmd_idx = 0; cmd_idx < RTL88E_MESSAGE_BOX_SIZE; cmd_idx++)
+		usb_write8(adapt, msgbox_addr + cmd_idx, *((u8 *)(&h2c_cmd) + cmd_idx));
 
-	} while ((!bcmd_down) && (retry_cnts--));
+	adapt->HalData->LastHMEBoxNum =
+		(h2c_box_num + 1) % RTL88E_MAX_H2C_BOX_NUMS;
 
 	ret = _SUCCESS;
 
-- 
2.17.1

