Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0D567D0A38
	for <lists+kernel-janitors@lfdr.de>; Fri, 20 Oct 2023 10:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235640AbjJTIGC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 20 Oct 2023 04:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233391AbjJTIGB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Oct 2023 04:06:01 -0400
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 247EEE8;
        Fri, 20 Oct 2023 01:05:59 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by a.mx.secunet.com (Postfix) with ESMTP id 4FF1320820;
        Fri, 20 Oct 2023 10:05:57 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
        by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ma7TU1Btuyr6; Fri, 20 Oct 2023 10:05:56 +0200 (CEST)
Received: from mailout1.secunet.com (mailout1.secunet.com [62.96.220.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by a.mx.secunet.com (Postfix) with ESMTPS id C4BF2207A4;
        Fri, 20 Oct 2023 10:05:56 +0200 (CEST)
Received: from cas-essen-02.secunet.de (unknown [10.53.40.202])
        by mailout1.secunet.com (Postfix) with ESMTP id B702680004A;
        Fri, 20 Oct 2023 10:05:56 +0200 (CEST)
Received: from mbx-essen-02.secunet.de (10.53.40.198) by
 cas-essen-02.secunet.de (10.53.40.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 10:05:56 +0200
Received: from gauss2.secunet.de (10.182.7.193) by mbx-essen-02.secunet.de
 (10.53.40.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 20 Oct
 2023 10:05:56 +0200
Received: by gauss2.secunet.de (Postfix, from userid 1000)
        id B183B3183E88; Fri, 20 Oct 2023 10:05:55 +0200 (CEST)
Date:   Fri, 20 Oct 2023 10:05:55 +0200
From:   Steffen Klassert <steffen.klassert@secunet.com>
To:     <netdev@vger.kernel.org>
CC:     Antony Antony <antony.antony@secunet.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH ipsec-next] xfrm Fix use after free in __xfrm6_udp_encap_rcv.
Message-ID: <ZTI0452CF5hoHRoA@gauss3.secunet.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: cas-essen-01.secunet.de (10.53.40.201) To
 mbx-essen-02.secunet.de (10.53.40.198)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

A recent patch changed xfrm6_udp_encap_rcv to not
free the skb itself anymore but fogot the case
where xfrm4_udp_encap_rcv is called subsequently.

Fix this by moving the call to xfrm4_udp_encap_rcv
from __xfrm6_udp_encap_rcv to xfrm6_udp_encap_rcv.

Fixes: 221ddb723d90 ("xfrm: Support GRO for IPv6 ESP in UDP encapsulation")
Signed-off-by: Steffen Klassert <steffen.klassert@secunet.com>
---
 net/ipv4/xfrm4_input.c | 3 ++-
 net/ipv6/xfrm6_input.c | 9 ++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/xfrm4_input.c b/net/ipv4/xfrm4_input.c
index 42879c5e026a..c54676998eb6 100644
--- a/net/ipv4/xfrm4_input.c
+++ b/net/ipv4/xfrm4_input.c
@@ -159,7 +159,6 @@ static int __xfrm4_udp_encap_rcv(struct sock *sk, struct sk_buff *skb, bool pull
 	/* process ESP */
 	return 0;
 }
-EXPORT_SYMBOL(xfrm4_udp_encap_rcv);
 
 /* If it's a keepalive packet, then just eat it.
  * If it's an encapsulated packet, then pass it to the
@@ -184,6 +183,7 @@ int xfrm4_udp_encap_rcv(struct sock *sk, struct sk_buff *skb)
 
 	return ret;
 }
+EXPORT_SYMBOL(xfrm4_udp_encap_rcv);
 
 struct sk_buff *xfrm4_gro_udp_encap_rcv(struct sock *sk, struct list_head *head,
 					struct sk_buff *skb)
@@ -223,6 +223,7 @@ struct sk_buff *xfrm4_gro_udp_encap_rcv(struct sock *sk, struct list_head *head,
 
 	return NULL;
 }
+EXPORT_SYMBOL(xfrm4_gro_udp_encap_rcv);
 
 int xfrm4_rcv(struct sk_buff *skb)
 {
diff --git a/net/ipv6/xfrm6_input.c b/net/ipv6/xfrm6_input.c
index ccf79b84c061..6e36e5047fba 100644
--- a/net/ipv6/xfrm6_input.c
+++ b/net/ipv6/xfrm6_input.c
@@ -80,9 +80,6 @@ static int __xfrm6_udp_encap_rcv(struct sock *sk, struct sk_buff *skb, bool pull
 	__be32 *udpdata32;
 	u16 encap_type;
 
-	if (skb->protocol == htons(ETH_P_IP))
-		return xfrm4_udp_encap_rcv(sk, skb);
-
 	encap_type = READ_ONCE(up->encap_type);
 	/* if this is not encapsulated socket, then just return now */
 	if (!encap_type)
@@ -169,6 +166,9 @@ int xfrm6_udp_encap_rcv(struct sock *sk, struct sk_buff *skb)
 {
 	int ret;
 
+	if (skb->protocol == htons(ETH_P_IP))
+		return xfrm4_udp_encap_rcv(sk, skb);
+
 	ret = __xfrm6_udp_encap_rcv(sk, skb, true);
 	if (!ret)
 		return xfrm6_rcv_encap(skb, IPPROTO_ESP, 0,
@@ -190,6 +190,9 @@ struct sk_buff *xfrm6_gro_udp_encap_rcv(struct sock *sk, struct list_head *head,
 	struct sk_buff *pp = NULL;
 	int ret;
 
+	if (skb->protocol == htons(ETH_P_IP))
+		return xfrm4_gro_udp_encap_rcv(sk, head, skb);
+
 	offset = offset - sizeof(struct udphdr);
 
 	if (!pskb_pull(skb, offset))
-- 
2.34.1

