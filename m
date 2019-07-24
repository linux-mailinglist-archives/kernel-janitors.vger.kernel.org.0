Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF3E731D2
	for <lists+kernel-janitors@lfdr.de>; Wed, 24 Jul 2019 16:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbfGXOiS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 24 Jul 2019 10:38:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42356 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbfGXOiS (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 24 Jul 2019 10:38:18 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 37E6A8E233;
        Wed, 24 Jul 2019 14:38:18 +0000 (UTC)
Received: from ovpn-112-51.rdu2.redhat.com (ovpn-112-51.rdu2.redhat.com [10.10.112.51])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A0BE010190A9;
        Wed, 24 Jul 2019 14:38:16 +0000 (UTC)
Message-ID: <9153261627a0f84b996e023f1349a2bc06dd03ee.camel@redhat.com>
Subject: [PATCH v3] libertas: Fix a double free in if_spi_c2h_data()
From:   Dan Williams <dcbw@redhat.com>
To:     Kalle Valo <kvalo@codeaurora.org>
Cc:     Philip Rakity <prakity@yahoo.com>,
        libertas-dev@lists.infradead.org, kernel-janitors@vger.kernel.org,
        linux-wireless@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Allison Randal <allison@lohutok.net>
Date:   Wed, 24 Jul 2019 09:38:15 -0500
In-Reply-To: <ee4472e4728becc9713962ba264742cb1f337098.camel@redhat.com>
References: <20190626100926.GD3242@mwanda>
         <be491ab35ba46111a1c90cc12b6d5ff6ea3f57e8.camel@redhat.com>
         <20190626132340.GE28859@kadam>
         <e679c9f99d6952f82924c71f036e4a196d0e72d4.camel@redhat.com>
         <ee4472e4728becc9713962ba264742cb1f337098.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 24 Jul 2019 14:38:18 +0000 (UTC)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The lbs_process_rxed_packet() frees the skb.  It didn't originally, but
we fixed it in commit f54930f36311 ("libertas: don't leak skb on receive
error").

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Dan Williams <dcbw@redhat.com>
---

Kalle: sorry about the build error; previous version of the patch before I fixed it.
Here's the correct one.

 drivers/net/wireless/marvell/libertas/if_spi.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/marvell/libertas/if_spi.c b/drivers/net/wireless/marvell/libertas/if_spi.c
index 27067e79e83fe..d07fe82c557e8 100644
--- a/drivers/net/wireless/marvell/libertas/if_spi.c
+++ b/drivers/net/wireless/marvell/libertas/if_spi.c
@@ -766,19 +766,15 @@ static int if_spi_c2h_data(struct if_spi_card *card)
 
 	/* Read the data from the WLAN module into our skb... */
 	err = spu_read(card, IF_SPI_DATA_RDWRPORT_REG, data, ALIGN(len, 4));
-	if (err)
-		goto free_skb;
+	if (err) {
+		dev_kfree_skb(skb);
+		goto out;
+	}
 
 	/* pass the SKB to libertas */
 	err = lbs_process_rxed_packet(card->priv, skb);
-	if (err)
-		goto free_skb;
+	/* lbs_process_rxed_packet() consumes the skb */
 
-	/* success */
-	goto out;
-
-free_skb:
-	dev_kfree_skb(skb);
 out:
 	if (err)
 		netdev_err(priv->dev, "%s: err=%d\n", __func__, err);
-- 
2.20.1

