Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6463F0D39
	for <lists+kernel-janitors@lfdr.de>; Wed, 18 Aug 2021 23:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233770AbhHRVWk (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 18 Aug 2021 17:22:40 -0400
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:25980 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbhHRVWj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 18 Aug 2021 17:22:39 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d40 with ME
        id j9N1250013riaq2039N1R2; Wed, 18 Aug 2021 23:22:02 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 18 Aug 2021 23:22:02 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     leoyang.li@nxp.com
Cc:     linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] soc: fsl: guts: Fix a resource leak in the error handling path of 'fsl_guts_probe()'
Date:   Wed, 18 Aug 2021 23:21:59 +0200
Message-Id: <b12e8c5c5d6ab3061d9504de8fbaefcad6bbc385.1629321668.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If an error occurs after 'of_find_node_by_path()', the reference taken for
'root' will never be released and some memory will leak.

Instead of adding an error handling path and modifying all the
'return -SOMETHING' into 'goto errorpath', use 'devm_add_action_or_reset()'
to release the reference when needed.

Simplify the remove function accordingly.

As an extra benefit, the 'root' global variable can now be removed as well.

Fixes: 3c0d64e867ed ("soc: fsl: guts: reuse machine name from device tree")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/soc/fsl/guts.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index d5e9a5f2c087..4d9476c7b87c 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -28,7 +28,6 @@ struct fsl_soc_die_attr {
 static struct guts *guts;
 static struct soc_device_attribute soc_dev_attr;
 static struct soc_device *soc_dev;
-static struct device_node *root;
 
 
 /* SoC die attribute definition for QorIQ platform */
@@ -136,14 +135,23 @@ static u32 fsl_guts_get_svr(void)
 	return svr;
 }
 
+static void fsl_guts_put_root(void *data)
+{
+	struct device_node *root = data;
+
+	of_node_put(root);
+}
+
 static int fsl_guts_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
+	struct device_node *root;
 	struct resource *res;
 	const struct fsl_soc_die_attr *soc_die;
 	const char *machine;
 	u32 svr;
+	int ret;
 
 	/* Initialize guts */
 	guts = devm_kzalloc(dev, sizeof(*guts), GFP_KERNEL);
@@ -159,6 +167,10 @@ static int fsl_guts_probe(struct platform_device *pdev)
 
 	/* Register soc device */
 	root = of_find_node_by_path("/");
+	ret = devm_add_action_or_reset(dev, fsl_guts_put_root, root);
+	if (ret)
+		return ret;
+
 	if (of_property_read_string(root, "model", &machine))
 		of_property_read_string_index(root, "compatible", 0, &machine);
 	if (machine)
@@ -197,7 +209,7 @@ static int fsl_guts_probe(struct platform_device *pdev)
 static int fsl_guts_remove(struct platform_device *dev)
 {
 	soc_device_unregister(soc_dev);
-	of_node_put(root);
+
 	return 0;
 }
 
-- 
2.30.2

