Return-Path: <kernel-janitors+bounces-7745-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4457DA92C79
	for <lists+kernel-janitors@lfdr.de>; Thu, 17 Apr 2025 23:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0142B7B1EC2
	for <lists+kernel-janitors@lfdr.de>; Thu, 17 Apr 2025 21:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F3E207A34;
	Thu, 17 Apr 2025 21:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="LzCtGioE"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-73.smtpout.orange.fr [80.12.242.73])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E318489
	for <kernel-janitors@vger.kernel.org>; Thu, 17 Apr 2025 21:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744923968; cv=none; b=nl+iwF0O7xi/rwD7v/YdpcHut2pG3H9S1z8FgqYD6cxbEfNZZpfAl4/WNzhUZNpqnrNUn8pa/nHPFV0W5207vGBchDEOOP/11jln0Gpx/wYPFhNhkQVd7Xw7VrqkFPaiOE7deglsVGCaS7JRCF4nKGlWfNOLtSxacwo2u9ryRAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744923968; c=relaxed/simple;
	bh=2vPaLziEm58oUXJkqjA9a9mHTrQT3I+I40GkuJYfO+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=chHz8EpZm7dWEpFCRnd48WL+kvo62iKIUwaS+K6x2jViWT3+ORAOoF7nBfMNbVKMPGBOW1ATDaCpBKqPbxqpuU7h5+96DBMi3x9/oxJJ4RebDQqvUbioj3JmS2fHgt5z/LTzu/42RscBvV7Niz7VqvVk/9L+LymMrpROx6aqHCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=LzCtGioE; arc=none smtp.client-ip=80.12.242.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 5WPju9RZpCZIm5WPmuOcq4; Thu, 17 Apr 2025 23:04:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1744923895;
	bh=IdKaA0l6JpiE94V82MTyqFzKEu9YwwkBRqC03GJEZb8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=LzCtGioEJPeBH8Qgj4mnWg1rn0QT8C8M60ASJLytMCzKyhXdlbzzOUTZpjIRelNNh
	 OdB64aoLtKR1R46ia958geLIOc9H5b+rr1PY8Ffx5nPNuGG0MmOTn16tpkP2LGbOE9
	 sjMEj0tGvUKq0SiEY3ySSW2eAGG23SKkaCISbC9Ik/p63s61eQkpZwAwPueiGdU7zs
	 rI0Hgr9SFM+P4s0cfaBwDSCWYLgzfW297VBt3Pg79sgYguHiPGoQRsxCJGgAAQjuuh
	 eD0v7ZoL8zK+GZ8iIFK0uPV/fRH+7SKGna7YwaPTHGKelWCsOKoBq9ZUzkliYo0TfX
	 YwsLeKboIU2mw==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 17 Apr 2025 23:04:55 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Stefani Seibold <stefani@seibold.net>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/3] kfifo: Fix the description of kfifo_alloc()
Date: Thu, 17 Apr 2025 23:04:33 +0200
Message-ID: <e25c871bd379f0f3595c2045925d3d25731bb194.1744923838.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'size' parameter of kfifo_alloc() does not need to be a power of 2. If
it is not, it will be rounded up to the next power of 2 automatically, as
already correctly explained a few lines below.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 include/linux/kfifo.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/kfifo.h b/include/linux/kfifo.h
index fd743d4c4b4b..54fbe2ae6fbd 100644
--- a/include/linux/kfifo.h
+++ b/include/linux/kfifo.h
@@ -349,7 +349,7 @@ __kfifo_uint_must_check_helper( \
 /**
  * kfifo_alloc - dynamically allocates a new fifo buffer
  * @fifo: pointer to the fifo
- * @size: the number of elements in the fifo, this must be a power of 2
+ * @size: the number of elements in the fifo
  * @gfp_mask: get_free_pages mask, passed to kmalloc()
  *
  * This macro dynamically allocates a new fifo buffer.
-- 
2.49.0


