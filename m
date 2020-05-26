Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C83F1AB40B
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 Apr 2020 01:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388302AbgDOXId (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 15 Apr 2020 19:08:33 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:53379 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387914AbgDOXIX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Apr 2020 19:08:23 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jOr8n-0004tN-6X; Wed, 15 Apr 2020 23:08:21 +0000
From:   Colin King <colin.king@canonical.com>
To:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] extcon: remove redundant assignment to variable idx
Date:   Thu, 16 Apr 2020 00:08:21 +0100
Message-Id: <20200415230821.1567410-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable idx is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/extcon/extcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon.c b/drivers/extcon/extcon.c
index 2dfbfec572f9..0a6438cbb3f3 100644
--- a/drivers/extcon/extcon.c
+++ b/drivers/extcon/extcon.c
@@ -900,7 +900,7 @@ int extcon_register_notifier(struct extcon_dev *edev, unsigned int id,
 			     struct notifier_block *nb)
 {
 	unsigned long flags;
-	int ret, idx = -EINVAL;
+	int ret, idx;
 
 	if (!edev || !nb)
 		return -EINVAL;
-- 
2.25.1

