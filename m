Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3694032C585
	for <lists+kernel-janitors@lfdr.de>; Thu,  4 Mar 2021 01:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235900AbhCDAVZ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 3 Mar 2021 19:21:25 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:35796 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359113AbhCCNo7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Mar 2021 08:44:59 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lHRmt-0000MV-AT; Wed, 03 Mar 2021 13:43:39 +0000
From:   Colin King <colin.king@canonical.com>
To:     "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
        netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] scsi: target: vhost-scsi: remove redundant initialization of variable ret
Date:   Wed,  3 Mar 2021 13:43:39 +0000
Message-Id: <20210303134339.67339-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/vhost/scsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index d16c04dcc144..9129ab8187fd 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -2465,7 +2465,7 @@ static const struct target_core_fabric_ops vhost_scsi_ops = {
 
 static int __init vhost_scsi_init(void)
 {
-	int ret = -ENOMEM;
+	int ret;
 
 	pr_debug("TCM_VHOST fabric module %s on %s/%s"
 		" on "UTS_RELEASE"\n", VHOST_SCSI_VERSION, utsname()->sysname,
-- 
2.30.0

