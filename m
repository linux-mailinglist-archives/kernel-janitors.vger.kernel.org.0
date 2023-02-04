Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4395668AC52
	for <lists+kernel-janitors@lfdr.de>; Sat,  4 Feb 2023 21:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbjBDUy0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 4 Feb 2023 15:54:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjBDUyZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 4 Feb 2023 15:54:25 -0500
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB721C33D
        for <kernel-janitors@vger.kernel.org>; Sat,  4 Feb 2023 12:54:24 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id OPY6pZlWT5naBOPY6pVbEa; Sat, 04 Feb 2023 21:54:22 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 04 Feb 2023 21:54:22 +0100
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Gonglei <arei.gonglei@huawei.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        virtualization@lists.linux-foundation.org,
        linux-crypto@vger.kernel.org
Subject: [PATCH] virtio-crypto: Do not use GFP_ATOMIC when not needed
Date:   Sat,  4 Feb 2023 21:54:08 +0100
Message-Id: <00f487d16bf9fc5ce215c44bed3f11df5adf266a.1675544037.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is no need to use GFP_ATOMIC here. GFP_KERNEL is already used for
another memory allocation just the line after.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is speculative ! ! !

Maybe it is the other memory allocation that should use GFP_ATOMIC.

Review with care !
---
 drivers/crypto/virtio/virtio_crypto_akcipher_algs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/virtio/virtio_crypto_akcipher_algs.c b/drivers/crypto/virtio/virtio_crypto_akcipher_algs.c
index b2979be613b8..6963344f6a3a 100644
--- a/drivers/crypto/virtio/virtio_crypto_akcipher_algs.c
+++ b/drivers/crypto/virtio/virtio_crypto_akcipher_algs.c
@@ -116,7 +116,7 @@ static int virtio_crypto_alg_akcipher_init_session(struct virtio_crypto_akcipher
 	struct virtio_crypto_session_input *input;
 	struct virtio_crypto_ctrl_request *vc_ctrl_req;
 
-	pkey = kmemdup(key, keylen, GFP_ATOMIC);
+	pkey = kmemdup(key, keylen, GFP_KERNEL);
 	if (!pkey)
 		return -ENOMEM;
 
-- 
2.34.1

