Return-Path: <kernel-janitors+bounces-1772-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55350858DAA
	for <lists+kernel-janitors@lfdr.de>; Sat, 17 Feb 2024 08:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 016F71F222E2
	for <lists+kernel-janitors@lfdr.de>; Sat, 17 Feb 2024 07:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8731CFA8;
	Sat, 17 Feb 2024 07:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="phcQj97w"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0E31CAB5
	for <kernel-janitors@vger.kernel.org>; Sat, 17 Feb 2024 07:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708155123; cv=none; b=VqDsiFim89gFUrczi/EOXZxAu3Mgg9cWKDZhsc66hlqzjYyEgp9qW4jG8c/30WnufcLg/M1VWynoekRqltTH31BMbChrrWGroZR06V29EVfVBl33ITQJHX8hOoavPaSX0a5+8HPuSuaqSiUYKxiBb78+RN7VC385/jTzTAMxwMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708155123; c=relaxed/simple;
	bh=npv7ZOWRpw6sxGJkWx9vOTc73+q2ocP0AqU18/94cms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G3jjuePtU1OWztl6POAeundfPmeEeFtwF53FfMtHMDBuo5WawbUegDy/Vgc7Jhvc3JapaCO/oveL8NbnnQzaX8lslp4C4E4I5iZ/pqOIjhp33WP7PenOdtcSsxH64VvAC2hciM9+RjkJXxNXcZ4aN3Z4XhjZjJvuJ0nBOJsVfLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=phcQj97w; arc=none smtp.client-ip=80.12.242.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id bF9rr7RBlRhCJbF9rr0LV3; Sat, 17 Feb 2024 08:30:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1708155048;
	bh=HXDa8YFPQiliIbuq5HJ9khulV8rK+PXHSC6Ee9kcXik=;
	h=From:To:Cc:Subject:Date;
	b=phcQj97w9FE+Zh+H12MyDYbqxfDXboeZhcdKcaDy6IYyvzkOgI972oBzbtXtwMg5C
	 TSZzZnStNK+6c0yjaRj6GF3y0dBpnOXAJAUlwEsLl9upx5aFrJOzMzF2hKsQXaT49C
	 mXh+FDJQK6n9udm26kvldXMSW6j8/KqH2VouZIXH4wPfx71+y8hUTRLOsfunS4eSb0
	 xMXnV9UilbxMZjyEV378CWYPjQR0nLNmPjq0rPE2VV1lRyo6Te76CGsSbLDlhQVbNA
	 BXcBr0lnTd3SDNbOwf3iQ+bI5ijk3c7TvYPinnOVdFynHb25p4ZKxfLFfGilW4zWsl
	 /+7QF7t8eyVFw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 17 Feb 2024 08:30:48 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-bluetooth@vger.kernel.org
Subject: [PATCH 1/2] Bluetooth: btbcm: Use strreplace()
Date: Sat, 17 Feb 2024 08:30:41 +0100
Message-ID: <79b9c9d9f86b4c573f0d3f2dac0a6fc9e6024058.1708154999.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use strreplace() instead of hand-writing it.
It is less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/bluetooth/btbcm.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
index 0a5445ac5e1b..01d2343b4978 100644
--- a/drivers/bluetooth/btbcm.c
+++ b/drivers/bluetooth/btbcm.c
@@ -11,6 +11,7 @@
 #include <linux/firmware.h>
 #include <linux/dmi.h>
 #include <linux/of.h>
+#include <linux/string.h>
 #include <asm/unaligned.h>
 
 #include <net/bluetooth/bluetooth.h>
@@ -544,7 +545,6 @@ static const char *btbcm_get_board_name(struct device *dev)
 	char *board_type;
 	const char *tmp;
 	int len;
-	int i;
 
 	root = of_find_node_by_path("/");
 	if (!root)
@@ -557,10 +557,7 @@ static const char *btbcm_get_board_name(struct device *dev)
 	len = strlen(tmp) + 1;
 	board_type = devm_kzalloc(dev, len, GFP_KERNEL);
 	strscpy(board_type, tmp, len);
-	for (i = 0; i < len; i++) {
-		if (board_type[i] == '/')
-			board_type[i] = '-';
-	}
+	strreplace(board_type, '/', '-');
 	of_node_put(root);
 
 	return board_type;
-- 
2.43.2


