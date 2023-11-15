Return-Path: <kernel-janitors+bounces-291-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E67E7EBF66
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 Nov 2023 10:24:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D5941C20AFD
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 Nov 2023 09:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76769611B;
	Wed, 15 Nov 2023 09:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9458879E0
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Nov 2023 09:23:59 +0000 (UTC)
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id A157011C;
	Wed, 15 Nov 2023 01:23:57 -0800 (PST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id E98BC602582C0;
	Wed, 15 Nov 2023 17:23:53 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: kvalo@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com
Cc: Su Hui <suhui@nfschina.com>,
	briannorris@chromium.org,
	lukas@wunner.de,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] mwifiex: remove some useless code
Date: Wed, 15 Nov 2023 17:23:29 +0800
Message-Id: <20231115092328.1048103-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang static analyzer complains that value stored to 'priv' is never read.
'priv' is useless, so remove it to save space.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/net/wireless/marvell/mwifiex/cmdevt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/cmdevt.c b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
index 3756aa247e77..9eff29a25544 100644
--- a/drivers/net/wireless/marvell/mwifiex/cmdevt.c
+++ b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
@@ -1244,8 +1244,6 @@ mwifiex_process_sleep_confirm_resp(struct mwifiex_adapter *adapter,
 				   u8 *pbuf, u32 upld_len)
 {
 	struct host_cmd_ds_command *cmd = (struct host_cmd_ds_command *) pbuf;
-	struct mwifiex_private *priv =
-		mwifiex_get_priv(adapter, MWIFIEX_BSS_ROLE_ANY);
 	uint16_t result = le16_to_cpu(cmd->result);
 	uint16_t command = le16_to_cpu(cmd->command);
 	uint16_t seq_num = le16_to_cpu(cmd->seq_num);
@@ -1260,12 +1258,6 @@ mwifiex_process_sleep_confirm_resp(struct mwifiex_adapter *adapter,
 		    "cmd: CMD_RESP: 0x%x, result %d, len %d, seqno 0x%x\n",
 		    command, result, le16_to_cpu(cmd->size), seq_num);
 
-	/* Get BSS number and corresponding priv */
-	priv = mwifiex_get_priv_by_id(adapter, HostCmd_GET_BSS_NO(seq_num),
-				      HostCmd_GET_BSS_TYPE(seq_num));
-	if (!priv)
-		priv = mwifiex_get_priv(adapter, MWIFIEX_BSS_ROLE_ANY);
-
 	/* Update sequence number */
 	seq_num = HostCmd_GET_SEQ_NO(seq_num);
 	/* Clear RET_BIT from HostCmd */
-- 
2.30.2


