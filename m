Return-Path: <kernel-janitors+bounces-1400-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 851F283357C
	for <lists+kernel-janitors@lfdr.de>; Sat, 20 Jan 2024 18:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AB521F21D9B
	for <lists+kernel-janitors@lfdr.de>; Sat, 20 Jan 2024 17:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8503D10A08;
	Sat, 20 Jan 2024 17:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="m47oR2wF"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DFE10A20
	for <kernel-janitors@vger.kernel.org>; Sat, 20 Jan 2024 17:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705771555; cv=none; b=cvUvw61ykuygYAWlInRMK+rmKmtf7oxYSzhs2W8/cXhxRK6T+0+n2dPTFjwCGAFDnJspZwqsN26NP5LQSh+XGVI6qXxtNoPXgUf8uWGOuVl/kTT4woVA7YbaGVZMQmzfl8O5+Cx2yzzMF5oU1r94iDuhXv7AfHmu9nJWz7F4yZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705771555; c=relaxed/simple;
	bh=IHy3yKUWKTLuOD8hN3UJHVbeSR7P1m1XoNYyPhd0+ec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ft6ngUpzghX5kzWwgzkNv1AXovNbWIqeJKf6TJ5yfimk+o/Yks34GCu/6vwZb4AhcWYvMw8M34H0F7hksgSRte7qdmlIXuLIdh0aVFffnAuieDbl/lREg1eBdzT9Qb24ns5k/2YhvyF+oWNyJZboSqhyzz9ddNFawg4MjUZ2TYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=m47oR2wF; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id RF6DrefClXxngRF6DrrUj2; Sat, 20 Jan 2024 18:25:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1705771544;
	bh=wFri96r10IYTNO8+N94yIYZtcJHCQ7p90QlQKgXP2zQ=;
	h=From:To:Cc:Subject:Date;
	b=m47oR2wFqaPhS795diQSgtuX4Cry1l/u1GV8fdwbAzJKCPH2sO5yOU2uBSFK/sZw0
	 WtqVMmILCibiJMHFb9G1XAXukYgkby0Qz0a2znFeu77RdNH3Vg2lRqIMr5q+pQNDsh
	 4ZND9BAePxKXF0TK+RQMZwpst4WWC6lgIaSiGlBfJ0uph6p0iEcnI1jWy5CJUASCZA
	 weMAHL4HFdfiy0tx9tJfjxAn+BwcZMSrwciEamrwCBgxJu+mRLbgBGNXXhzRzUqDS0
	 FA+9pgNY9P8agJN9FOXVj4HcfcTcM+9hWujZkh6+00HqAIe1b320aV91k6xiDgQ+xu
	 wx8zSB/kq4eQw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 20 Jan 2024 18:25:44 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
	Mark Rustad <mark.d.rustad@intel.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org
Subject: [PATCH] ixgbe: Fix an error handling path in ixgbe_read_iosf_sb_reg_x550()
Date: Sat, 20 Jan 2024 18:25:36 +0100
Message-ID: <d39bbffb8817499cc2ae636cdef3b9c1eba59618.1705771534.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All error handling paths, except this one, go to 'out' where
release_swfw_sync() is called.
This call balances the acquire_swfw_sync() call done at the beginning of
the function.

Branch to the error handling path in order to correctly release some
resources in case of error.

Fixes: ae14a1d8e104 ("ixgbe: Fix IOSF SB access issues")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is speculative, review with care.
---
 drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c
index 6208923e29a2..c1adc94a5a65 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c
@@ -716,7 +716,8 @@ static s32 ixgbe_read_iosf_sb_reg_x550(struct ixgbe_hw *hw, u32 reg_addr,
 	if ((command & IXGBE_SB_IOSF_CTRL_RESP_STAT_MASK) != 0) {
 		error = FIELD_GET(IXGBE_SB_IOSF_CTRL_CMPL_ERR_MASK, command);
 		hw_dbg(hw, "Failed to read, error %x\n", error);
-		return -EIO;
+		ret = -EIO;
+		goto out;
 	}
 
 	if (!ret)
-- 
2.43.0


