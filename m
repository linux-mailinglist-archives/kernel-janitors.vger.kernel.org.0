Return-Path: <kernel-janitors+bounces-638-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D66080BC60
	for <lists+kernel-janitors@lfdr.de>; Sun, 10 Dec 2023 18:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5F6D1C208FF
	for <lists+kernel-janitors@lfdr.de>; Sun, 10 Dec 2023 17:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D1B199DD;
	Sun, 10 Dec 2023 17:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Pc9BW6TF"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr [80.12.242.29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F699FE
	for <kernel-janitors@vger.kernel.org>; Sun, 10 Dec 2023 09:41:14 -0800 (PST)
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id CNnjro87trKXzCNnjrSMYO; Sun, 10 Dec 2023 18:41:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1702230072;
	bh=x7Q4NcLK40y5Q7ePxrJxb3SqI1bHDL9QSepFtUMOD10=;
	h=From:To:Cc:Subject:Date;
	b=Pc9BW6TFksYa1CEROk7anXD820o7hFq69nZ4E1iALGEExKqhPmIfQjNKsEChFtJ5Z
	 qYeVhCs1LQvL7XSmYGMXPUXuZYaaZ2M5iw2j4NcqR7+R/YB6gI9tsQpDgQ151h1H4X
	 o2laG87RbLnpBg6b8XqU/Jlj18zJd7RQYIDeWzSHD//Hk9p4mKj3ydR76xkjp0oz1G
	 XTxFyzAkEv3O7g3cqagVvrD6zahuXOyZDrpxLZn/YvxShNecMuXsBxv/psXKIG4lDU
	 CzYDIt9e3L971bbamm2JzXXpeuWIB2BtJXlCVrNFRQ2iqUO5Z6aWG+KF0ZiNH5UqTc
	 JSOCXIC54YnLw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 10 Dec 2023 18:41:12 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] pps: Remove usage of the deprecated ida_simple_xx() API
Date: Sun, 10 Dec 2023 18:41:07 +0100
Message-Id: <5065a9fe3101dcb7ee0a79bde0ec84de03c637ec.1702230047.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

This is less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/pps/clients/pps_parport.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pps/clients/pps_parport.c b/drivers/pps/clients/pps_parport.c
index 42f93d4c6ee3..af972cdc04b5 100644
--- a/drivers/pps/clients/pps_parport.c
+++ b/drivers/pps/clients/pps_parport.c
@@ -148,7 +148,7 @@ static void parport_attach(struct parport *port)
 		return;
 	}
 
-	index = ida_simple_get(&pps_client_index, 0, 0, GFP_KERNEL);
+	index = ida_alloc(&pps_client_index, GFP_KERNEL);
 	memset(&pps_client_cb, 0, sizeof(pps_client_cb));
 	pps_client_cb.private = device;
 	pps_client_cb.irq_func = parport_irq;
@@ -188,7 +188,7 @@ static void parport_attach(struct parport *port)
 err_unregister_dev:
 	parport_unregister_device(device->pardev);
 err_free:
-	ida_simple_remove(&pps_client_index, index);
+	ida_free(&pps_client_index, index);
 	kfree(device);
 }
 
@@ -208,7 +208,7 @@ static void parport_detach(struct parport *port)
 	pps_unregister_source(device->pps);
 	parport_release(pardev);
 	parport_unregister_device(pardev);
-	ida_simple_remove(&pps_client_index, device->index);
+	ida_free(&pps_client_index, device->index);
 	kfree(device);
 }
 
-- 
2.34.1


