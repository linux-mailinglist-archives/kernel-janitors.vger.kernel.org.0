Return-Path: <kernel-janitors+bounces-472-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A48ED7FAFB9
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Nov 2023 02:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28B2DB20FE3
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Nov 2023 01:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AF91C3B;
	Tue, 28 Nov 2023 01:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 39E88138;
	Mon, 27 Nov 2023 17:45:49 -0800 (PST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 946E9604B3FD4;
	Tue, 28 Nov 2023 09:45:36 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: alexander.usyskin@intel.com,
	tomas.winkler@intel.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com
Cc: Su Hui <suhui@nfschina.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v3] misc: mei: client.c: fix problem of return '-EOVERFLOW' in mei_cl_write
Date: Tue, 28 Nov 2023 09:45:08 +0800
Message-Id: <20231128014507.418254-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang static analyzer complains that value stored to 'rets' is never
read.Using 'goto err' to go to the error path and fix this problem.

Fixes: 8c8d964ce90f ("mei: move hbuf_depth from the mei device to the hw modules")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
v3: 
 - using 'goto err' rather than 'buf_len=-EOVERFLOW'.(Thanks to Sasha)

v2:
 - split v1 patch to different patches
https://lore.kernel.org/all/20231120095523.178385-2-suhui@nfschina.com/

v1:
https://lore.kernel.org/all/5c98fc07-36a9-92cc-f8d6-c4efdc0c34aa@nfschina.com/

 drivers/misc/mei/client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
index 7ea80779a0e2..0489bec4fded 100644
--- a/drivers/misc/mei/client.c
+++ b/drivers/misc/mei/client.c
@@ -2033,7 +2033,7 @@ ssize_t mei_cl_write(struct mei_cl *cl, struct mei_cl_cb *cb, unsigned long time
 	hbuf_slots = mei_hbuf_empty_slots(dev);
 	if (hbuf_slots < 0) {
 		rets = -EOVERFLOW;
-		goto out;
+		goto err;
 	}
 
 	hbuf_len = mei_slots2data(hbuf_slots) & MEI_MSG_MAX_LEN_MASK;
-- 
2.30.2


