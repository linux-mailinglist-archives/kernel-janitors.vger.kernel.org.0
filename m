Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39A717345C0
	for <lists+kernel-janitors@lfdr.de>; Sun, 18 Jun 2023 11:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjFRJqx (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 18 Jun 2023 05:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjFRJqv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 18 Jun 2023 05:46:51 -0400
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C80E718B
        for <kernel-janitors@vger.kernel.org>; Sun, 18 Jun 2023 02:46:50 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id AozfqabYVEYhqAozfqlrwt; Sun, 18 Jun 2023 11:46:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1687081609;
        bh=McAeXz2J4UO1BECLY75Q24ChR053II0UqATm+dnPZxw=;
        h=From:To:Cc:Subject:Date;
        b=q67rMZnTDuv5OjLYdkOvp6ilJo6+ksdle57v4Zxzt272ZA4hRFtvynP0Ahhm2BKjp
         TRac47I8b6MwG85Lh25bHHwhWyECgazWwVDhqkilAFsspTUL3IfDCd9RNZQ4Fkt+6C
         OBVTMJnS3Vy4CGh+s7lbzC59py2LUrshOiGqL/VL50qmvQ6HuSLUaVOxwZ9kXfxr4A
         3rnm68FSGkOhi/xF263vENFM0Pc+ERxijNH0XPAgN9+vwF6EcYqMcyJD7987/B9LqY
         +aWlIWBlE5UUx8WZaxSD5H9A+qCE4NqpsA76hl3X/SQT3H9lFjDBkRuZiIleVWEtR5
         86mGZAHzlCuXQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 18 Jun 2023 11:46:49 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Matthieu Baerts <matthieu.baerts@tessares.net>,
        Mat Martineau <martineau@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        netdev@vger.kernel.org, mptcp@lists.linux.dev
Subject: [PATCH net-next] mptcp: Reorder fields in 'struct mptcp_pm_add_entry'
Date:   Sun, 18 Jun 2023 11:46:46 +0200
Message-Id: <e47b71de54fd3e580544be56fc1bb2985c77b0f4.1687081558.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Group some variables based on their sizes to reduce hole and avoid padding.
On x86_64, this shrinks the size of 'struct mptcp_pm_add_entry'
from 136 to 128 bytes.

It saves a few bytes of memory and is more cache-line friendly.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Using pahole

Before:
======
struct mptcp_pm_add_entry {
	struct list_head           list;                 /*     0    16 */
	struct mptcp_addr_info     addr;                 /*    16    12 */

	/* XXX 4 bytes hole, try to pack */

	struct timer_list          add_timer;            /*    32    88 */
	/* --- cacheline 1 boundary (64 bytes) was 56 bytes ago --- */
	struct mptcp_sock *        sock;                 /*   120     8 */
	/* --- cacheline 2 boundary (128 bytes) --- */
	u8                         retrans_times;        /*   128     1 */

	/* size: 136, cachelines: 3, members: 5 */
	/* sum members: 125, holes: 1, sum holes: 4 */
	/* padding: 7 */
	/* last cacheline: 8 bytes */
};


After:
=====
struct mptcp_pm_add_entry {
	struct list_head           list;                 /*     0    16 */
	struct mptcp_addr_info     addr;                 /*    16    12 */
	u8                         retrans_times;        /*    28     1 */

	/* XXX 3 bytes hole, try to pack */

	struct timer_list          add_timer;            /*    32    88 */
	/* --- cacheline 1 boundary (64 bytes) was 56 bytes ago --- */
	struct mptcp_sock *        sock;                 /*   120     8 */

	/* size: 128, cachelines: 2, members: 5 */
	/* sum members: 125, holes: 1, sum holes: 3 */
};
---
 net/mptcp/pm_netlink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mptcp/pm_netlink.c b/net/mptcp/pm_netlink.c
index a12a87b780f6..a56718ffdd02 100644
--- a/net/mptcp/pm_netlink.c
+++ b/net/mptcp/pm_netlink.c
@@ -25,9 +25,9 @@ static int pm_nl_pernet_id;
 struct mptcp_pm_add_entry {
 	struct list_head	list;
 	struct mptcp_addr_info	addr;
+	u8			retrans_times;
 	struct timer_list	add_timer;
 	struct mptcp_sock	*sock;
-	u8			retrans_times;
 };
 
 struct pm_nl_pernet {
-- 
2.34.1

