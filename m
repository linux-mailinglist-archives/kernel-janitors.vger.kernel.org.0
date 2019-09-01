Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB9AA4A08
	for <lists+kernel-janitors@lfdr.de>; Sun,  1 Sep 2019 17:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729101AbfIAPf5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 1 Sep 2019 11:35:57 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43592 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfIAPf5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 1 Sep 2019 11:35:57 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1i4RtT-00038I-FJ; Sun, 01 Sep 2019 15:35:55 +0000
From:   Colin King <colin.king@canonical.com>
To:     Ian Kent <raven@themaw.net>, autofs@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][V2] autofs: remove redundant assignment to variable err
Date:   Sun,  1 Sep 2019 16:35:53 +0100
Message-Id: <20190901153553.15306-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable err is being assigned a value that is never read and
is being re-assigned a little later on. The assignment is redundant
and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: Fix spelling mistake "Unused"

---
 fs/autofs/dev-ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/autofs/dev-ioctl.c b/fs/autofs/dev-ioctl.c
index a3cdb0036c5d..65d84b4d4464 100644
--- a/fs/autofs/dev-ioctl.c
+++ b/fs/autofs/dev-ioctl.c
@@ -422,7 +422,7 @@ static int autofs_dev_ioctl_requester(struct file *fp,
 	struct autofs_info *ino;
 	struct path path;
 	dev_t devid;
-	int err = -ENOENT;
+	int err;
 
 	/* param->path has been checked in validate_dev_ioctl() */
 
-- 
2.20.1

