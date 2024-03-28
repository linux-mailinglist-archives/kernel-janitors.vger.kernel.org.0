Return-Path: <kernel-janitors+bounces-2214-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A5B87D9BE
	for <lists+kernel-janitors@lfdr.de>; Sat, 16 Mar 2024 11:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53833281A24
	for <lists+kernel-janitors@lfdr.de>; Sat, 16 Mar 2024 10:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2AC17727;
	Sat, 16 Mar 2024 10:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="oktPMqE9"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr [80.12.242.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2DF2F28
	for <kernel-janitors@vger.kernel.org>; Sat, 16 Mar 2024 10:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710584252; cv=none; b=IZLwAGw8n/XOgMTw/wAOo3N75dLk24n92WeH1xsg0shjdeIpB828I/Ie+CHscORFuJxwJ1wjUFoT3cLIh6yDIM3pfLmH2dEUKcXap9JsPLDhFCjsLV8hBzI8Mi0uCvwBTj2uUHpI/SCeEwH4t7ZRcKAZg41opxpxJUqsV7z898g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710584252; c=relaxed/simple;
	bh=U28zfjF4OS2fGHai986hSwR2HqlyXw1brLjxlL3M6aE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ndPN+k24Sfchr3KJSbkcq5SgGmDFPz81Dd1o+l7cSdEkUldNiL9wv9I069s7zH9+bicryXBTjlAWTGutZ3yvHqFjcXlxelOMqvtLhqMsT7zpxUqklxPH/s86YUZtuVP7pJyHht5PkMYU8t/L18HaovYauDGCaiGUER7709qIsvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=oktPMqE9; arc=none smtp.client-ip=80.12.242.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id lR5Irs5a0OyIKlR5Jr2quP; Sat, 16 Mar 2024 11:16:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1710584174;
	bh=OSlR5GvDt2806hNeUTYx8/WT+aSfsQ3aAdO0kIWpAbI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=oktPMqE9K76+qTe1SGAycahtUVr0fDUnE20/jtLH0fnfbqvFqpIGtRqVuLnR0CYoj
	 c1xfGyUUbacK6ljMlo8X25MQpLSXBr+2MZVVK2DAvT8IgAJ6MSFH8Gc1hYQH0sbShW
	 CRv9uOdqlrGI+0/hePANK4PIdVjHvGRq1WL7NIsyd94RzPZmt3utmYd+Vvdw4lYZ+p
	 OR1TKdnW4UhODYadew31r5kWXmSuEMdvFVDbdyrseHsyob8WOaALvOgf8mGqop4GKJ
	 +OmmZ/CuRH8eTXWnE6ZqKQ9iakDpuk57RfLzUwrpPLHVRHMKeJpHf7rP/NCX874O8J
	 wf/njDAC6zkzA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 16 Mar 2024 11:16:14 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	netdev@vger.kernel.org
Subject: [PATCH] caif: Use UTILITY_NAME_LENGTH instead of hard-coding 16
Date: Sat, 16 Mar 2024 11:16:10 +0100
Message-ID: <af10f5a3236d47fd183487c9dcba3b3b3c66b595.1710584144.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UTILITY_NAME_LENGTH is 16. So better use the former when defining the
'utility_name' array. This makes the intent clearer when it is used around
line 260.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 net/caif/cfctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/caif/cfctrl.c b/net/caif/cfctrl.c
index 8480684f2762..b6d9462f92b9 100644
--- a/net/caif/cfctrl.c
+++ b/net/caif/cfctrl.c
@@ -206,7 +206,7 @@ int cfctrl_linkup_request(struct cflayer *layer,
 	u8 tmp8;
 	struct cfctrl_request_info *req;
 	int ret;
-	char utility_name[16];
+	char utility_name[UTILITY_NAME_LENGTH];
 	struct cfpkt *pkt;
 	struct cflayer *dn = cfctrl->serv.layer.dn;
 
-- 
2.44.0


