Return-Path: <kernel-janitors+bounces-7257-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD3AA4B273
	for <lists+kernel-janitors@lfdr.de>; Sun,  2 Mar 2025 16:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 169107A51CB
	for <lists+kernel-janitors@lfdr.de>; Sun,  2 Mar 2025 14:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1751E98FB;
	Sun,  2 Mar 2025 14:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="MBsne84T"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060E51E5B9C
	for <kernel-janitors@vger.kernel.org>; Sun,  2 Mar 2025 14:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740927584; cv=none; b=HDahnS/ythjSeZ9xhUu/LLGeh5RLp3XiHiBojdiLkqRvbrMtBHZFVGZFJInssLy+uc7noY5f3PvIIioUphPqDvsneSLD0W3X8YpvnTU0AtLqahDWTfCne6eCp2PgBgQWMAKRD6qQj4tML4pxzQAGrpSsb5+U4qTi0P8ZnQgVo7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740927584; c=relaxed/simple;
	bh=FngX9NDA7j3IY+OdMmDca2IogBcJc4D0V3OHsPIPnrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUbc52wpwpei9F76fmj4+E19B8e8/m0bczCkKk+QrqYHxXuwHfz8er0X+PoX6JXBZxXCJNbne/KqtiKfoyQop4du8fsKBjEZxDqj73NvgFs7E7AMMmMNFLMWIbc7xwVvYLrHsYf5ED0s2UswptHoq35AdoFzbcbqk6MDc9vGozY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=MBsne84T; arc=none smtp.client-ip=80.12.242.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id okmqtJVk70yWRokn4t9OHq; Sun, 02 Mar 2025 15:59:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1740927579;
	bh=7m8X2HCaZAYsFWSmtyiQM+IwxWQ2FTT2RuVDQw5Wmz8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=MBsne84TkdsRHqfUbFe5BPJjnldQEWEA9Xqy7Wj9R4KQIbAr0rCx+jYiaYT7AxYNX
	 Z0GJnimiD/aK+L0gL5zooz1nui+83vDbVo3Nigiw1VpJdLi81Uc7hVzUBjHWyMBNtR
	 6e9SKa2/dbQQ0kwBex9GVNIjf8gJav/HFX+feV8ydI5pUULz1piZ9Gk8jAuLcbDeii
	 /cTrSbyjlD5/QmVKVd+BmjTlneUUTcjDw7vBjlFfR7jMq649WE2fuvM+DjX1zsmN63
	 zLJKvpSWLyLMrGhm87gKpNC+22QrfbBUl8lPYnLAtoEB95Vcqt4fm6ywQ385Pul4D5
	 4G/gkDfIBzcyw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 02 Mar 2025 15:59:39 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2] powerpc: gpio_mdio: Use devm_mdiobus_alloc_size()
Date: Sun,  2 Mar 2025 15:59:15 +0100
Message-ID: <2d02da3bebb2273782e535201cc9512f3cdbccab.1740926808.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740926808.git.christophe.jaillet@wanadoo.fr>
References: <cover.1740926808.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use mdiobus_alloc_size() instead of a hand written mdiobus_alloc() +
kzalloc().

This is less verbose and more robust. It also reduces memory fragmentation
and saves a few bytes of memory.

While at it, switch to devm_mdiobus_alloc_size() for extra simplification.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is compile tested only.

Some memory is saved because pahole states, on a x86_64,  that:

struct mii_bus {
	...
	/* size: 3640, cachelines: 57, members: 23 */
	/* sum members: 3633, holes: 2, sum holes: 7 */
	/* member types with holes: 3, total: 4, bit paddings: 1, total: 1 bit */
	/* paddings: 1, sum paddings: 3 */
	/* forced alignments: 1, forced holes: 1, sum forced holes: 4 */
	/* last cacheline: 56 bytes */
}

Because of the way allocation works, 4096 bytes are allocated. When
mdiobus_alloc_size() is used, struct gpio_priv fits in this "wasted" space
and so is available "for free".
---
 arch/powerpc/platforms/pasemi/gpio_mdio.c | 26 +++++------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/platforms/pasemi/gpio_mdio.c b/arch/powerpc/platforms/pasemi/gpio_mdio.c
index e4538d471256..2c54f5f063b7 100644
--- a/arch/powerpc/platforms/pasemi/gpio_mdio.c
+++ b/arch/powerpc/platforms/pasemi/gpio_mdio.c
@@ -213,15 +213,11 @@ static int gpio_mdio_probe(struct platform_device *ofdev)
 	const unsigned int *prop;
 	int err;
 
-	err = -ENOMEM;
-	priv = kzalloc(sizeof(struct gpio_priv), GFP_KERNEL);
-	if (!priv)
-		goto out;
-
-	new_bus = mdiobus_alloc();
-
+	new_bus = devm_mdiobus_alloc_size(dev, sizeof(*priv));
 	if (!new_bus)
-		goto out_free_priv;
+		return -ENOMEM;
+
+	priv = new_bus->priv;
 
 	new_bus->name = "pasemi gpio mdio bus";
 	new_bus->read = &gpio_mdio_read;
@@ -230,7 +226,6 @@ static int gpio_mdio_probe(struct platform_device *ofdev)
 
 	prop = of_get_property(np, "reg", NULL);
 	snprintf(new_bus->id, MII_BUS_ID_SIZE, "%x", *prop);
-	new_bus->priv = priv;
 
 	prop = of_get_property(np, "mdc-pin", NULL);
 	priv->mdc_pin = *prop;
@@ -246,17 +241,10 @@ static int gpio_mdio_probe(struct platform_device *ofdev)
 	if (err != 0) {
 		pr_err("%s: Cannot register as MDIO bus, err %d\n",
 				new_bus->name, err);
-		goto out_free_irq;
+		return err;
 	}
 
 	return 0;
-
-out_free_irq:
-	kfree(new_bus);
-out_free_priv:
-	kfree(priv);
-out:
-	return err;
 }
 
 
@@ -267,10 +255,6 @@ static void gpio_mdio_remove(struct platform_device *dev)
 	mdiobus_unregister(bus);
 
 	dev_set_drvdata(&dev->dev, NULL);
-
-	kfree(bus->priv);
-	bus->priv = NULL;
-	mdiobus_free(bus);
 }
 
 static const struct of_device_id gpio_mdio_match[] =
-- 
2.48.1


