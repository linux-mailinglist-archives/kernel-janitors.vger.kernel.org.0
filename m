Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A12960219
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Jul 2019 10:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbfGEIZ7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 5 Jul 2019 04:25:59 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:38096 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726601AbfGEIZ6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 Jul 2019 04:25:58 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hjJXW-0005Cx-Oh; Fri, 05 Jul 2019 08:25:54 +0000
From:   Colin King <colin.king@canonical.com>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8712: remove redundant assignment to variable res
Date:   Fri,  5 Jul 2019 09:25:54 +0100
Message-Id: <20190705082554.15588-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable res is being initialized with a value that is never
read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8712/rtl8712_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl8712_xmit.c b/drivers/staging/rtl8712/rtl8712_xmit.c
index 307b0e292976..dac79e6dcdcb 100644
--- a/drivers/staging/rtl8712/rtl8712_xmit.c
+++ b/drivers/staging/rtl8712/rtl8712_xmit.c
@@ -739,7 +739,7 @@ static void dump_xframe(struct _adapter *padapter,
 
 int r8712_xmit_direct(struct _adapter *padapter, struct xmit_frame *pxmitframe)
 {
-	int res = _SUCCESS;
+	int res;
 
 	res = r8712_xmitframe_coalesce(padapter, pxmitframe->pkt, pxmitframe);
 	pxmitframe->pkt = NULL;
-- 
2.20.1

