Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0A9173024
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Feb 2020 06:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbgB1FCr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 28 Feb 2020 00:02:47 -0500
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:54633 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgB1FCr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 Feb 2020 00:02:47 -0500
Received: from localhost.localdomain ([92.140.213.100])
        by mwinf5d77 with ME
        id 852k2200J2AY1JL0352lX6; Fri, 28 Feb 2020 06:02:45 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 28 Feb 2020 06:02:45 +0100
X-ME-IP: 92.140.213.100
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] Bluetooth: hci_h4: Fix a typo in a comment
Date:   Fri, 28 Feb 2020 06:02:44 +0100
Message-Id: <20200228050244.25304-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'transmittion' should be 'transmission'

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/bluetooth/hci_h4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_h4.c b/drivers/bluetooth/hci_h4.c
index 0b84a05a730b..4b3b14a34794 100644
--- a/drivers/bluetooth/hci_h4.c
+++ b/drivers/bluetooth/hci_h4.c
@@ -83,7 +83,7 @@ static int h4_close(struct hci_uart *hu)
 	return 0;
 }
 
-/* Enqueue frame for transmittion (padding, crc, etc) */
+/* Enqueue frame for transmission (padding, crc, etc) */
 static int h4_enqueue(struct hci_uart *hu, struct sk_buff *skb)
 {
 	struct h4_struct *h4 = hu->priv;
-- 
2.20.1

