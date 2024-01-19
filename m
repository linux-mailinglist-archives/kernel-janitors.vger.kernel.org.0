Return-Path: <kernel-janitors+bounces-1386-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77692832D89
	for <lists+kernel-janitors@lfdr.de>; Fri, 19 Jan 2024 17:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1965D1F215A4
	for <lists+kernel-janitors@lfdr.de>; Fri, 19 Jan 2024 16:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F041055C11;
	Fri, 19 Jan 2024 16:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="JcF0q+HU"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D337A5577E
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Jan 2024 16:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705683300; cv=none; b=pauLfeS93XM8GYVK4CjoseNxAoHHXmZGHAC1GefvmkThmCs0D/Lt8J9xibq0RKobAvtVXOiPR7GwUyKu1ygsZMvVNfXCx5EcIxcjQv8uoxiCqncYy+2u7Zu7pg5SWbbryYNWEDcVNiLQuPrL3mHnMPsoQ1W9GNs8VZt1T+Sfbr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705683300; c=relaxed/simple;
	bh=LE7+wVgUJce7/dL+sJXXYk2SeKMoDJ37YB3I+/Gc2sU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b/R9LuKH9N+u+6jO/17++Nbc4e0Zk00YDGlGXCJMWuQu/Khqily6G5oKqgwfe/saY3WT2EhbHQhA9OopBLP8vxGY8HkPEeEUHfjqEdnHThlDdIwlNwZGWkPCquR0EuDIvVRb2rap4Rc3OFh35iIByCJuBCPQzcX3ZLGKRIKWvUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=JcF0q+HU; arc=none smtp.client-ip=80.12.242.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id Qs8mrCrOkCqsFQs8nrvVcC; Fri, 19 Jan 2024 17:54:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1705683290;
	bh=W40Lf8sT4V66LSLUhWVubZrLmbPBBA+E51Iw2SqX3Ow=;
	h=From:To:Cc:Subject:Date;
	b=JcF0q+HUV0l2qnrl6aRn52HPqTYCiDGo1s9pwDtx5hmteW5wGS4mrLSPURJoXxUx3
	 CabJsET1Y+cqArSS3dXO21JYOY3KYkgg34R3ktXPy9plPkDxo5TC67PwGw/yTx6+nm
	 lnfTB1eE74iHA1q0hUEm49uWsldjLpbn5CcbHNAPT/yeP0W4RHVavyaOXOWP+I6PxS
	 A3gxCfNwRBPLEKbXO3ev7A81r3pnoKY/2KUqQAhBkSdqJdLlum1CgzFJiY8UpjafY/
	 R4cbzBbYiXYwj/1cGoDfCpdOURC9MsEDX0KEa51j74lZtTMMvbtMxNfzlyqfjIXNya
	 91aRAY345kDsg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 19 Jan 2024 17:54:50 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH] idr test suite: Remove usage of the deprecated ida_simple_xx() API
Date: Fri, 19 Jan 2024 17:54:44 +0100
Message-ID: <81f44a41b7ccceb26a802af473f931799445821a.1705683269.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

Note that the upper limit of ida_simple_get() is exclusive, but the one of
ida_alloc_range()/ida_alloc_max() is inclusive. But because of the ranges
used for the tests, there is no need to adjust them.

While at it remove some useless {}.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
It should be a question of weeks now before being able to remove the
ida_simple_*() API.
So it is time to convert the testing framework.
---
 tools/testing/radix-tree/idr-test.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/tools/testing/radix-tree/idr-test.c b/tools/testing/radix-tree/idr-test.c
index ca24f6839d50..bb41e93e2acd 100644
--- a/tools/testing/radix-tree/idr-test.c
+++ b/tools/testing/radix-tree/idr-test.c
@@ -503,14 +503,12 @@ void ida_simple_get_remove_test(void)
 	DEFINE_IDA(ida);
 	unsigned long i;
 
-	for (i = 0; i < 10000; i++) {
-		assert(ida_simple_get(&ida, 0, 20000, GFP_KERNEL) == i);
-	}
-	assert(ida_simple_get(&ida, 5, 30, GFP_KERNEL) < 0);
+	for (i = 0; i < 10000; i++)
+		assert(ida_alloc_max(&ida, 20000, GFP_KERNEL) == i);
+	assert(ida_alloc_range(&ida, 5, 30, GFP_KERNEL) < 0);
 
-	for (i = 0; i < 10000; i++) {
-		ida_simple_remove(&ida, i);
-	}
+	for (i = 0; i < 10000; i++)
+		ida_free(&ida, i);
 	assert(ida_is_empty(&ida));
 
 	ida_destroy(&ida);
-- 
2.43.0


