Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 067142BC7A5
	for <lists+kernel-janitors@lfdr.de>; Sun, 22 Nov 2020 19:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgKVSHM (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 22 Nov 2020 13:07:12 -0500
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:59934 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727888AbgKVSHL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 22 Nov 2020 13:07:11 -0500
Received: from localhost.localdomain ([81.185.166.181])
        by mwinf5d28 with ME
        id vW742300D3v9GFD03W75hr; Sun, 22 Nov 2020 19:07:07 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 22 Nov 2020 19:07:07 +0100
X-ME-IP: 81.185.166.181
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     vyasevich@gmail.com, nhorman@tuxdriver.com,
        marcelo.leitner@gmail.com, davem@davemloft.net, kuba@kernel.org
Cc:     linux-sctp@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] sctp: Fix some typo
Date:   Sun, 22 Nov 2020 19:07:04 +0100
Message-Id: <20201122180704.1366636-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

s/tranport/transport/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 net/sctp/transport.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/sctp/transport.c b/net/sctp/transport.c
index 60fcf31cdcfb..bf0ac467e757 100644
--- a/net/sctp/transport.c
+++ b/net/sctp/transport.c
@@ -8,7 +8,7 @@
  *
  * This file is part of the SCTP kernel implementation
  *
- * This module provides the abstraction for an SCTP tranport representing
+ * This module provides the abstraction for an SCTP transport representing
  * a remote transport address.  For local transport addresses, we just use
  * union sctp_addr.
  *
@@ -123,7 +123,7 @@ void sctp_transport_free(struct sctp_transport *transport)
 	/* Delete the T3_rtx timer if it's active.
 	 * There is no point in not doing this now and letting
 	 * structure hang around in memory since we know
-	 * the tranport is going away.
+	 * the transport is going away.
 	 */
 	if (del_timer(&transport->T3_rtx_timer))
 		sctp_transport_put(transport);
-- 
2.27.0

