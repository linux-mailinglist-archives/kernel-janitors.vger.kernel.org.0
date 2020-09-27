Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D6027A30D
	for <lists+kernel-janitors@lfdr.de>; Sun, 27 Sep 2020 21:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbgI0T4G (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 27 Sep 2020 15:56:06 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:10070
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726522AbgI0Tz0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 27 Sep 2020 15:55:26 -0400
X-IronPort-AV: E=Sophos;i="5.77,311,1596492000"; 
   d="scan'208";a="360169498"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES256-SHA256; 27 Sep 2020 21:55:13 +0200
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Joe Perches <joe@perches.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 10/18] clk: meson: use semicolons rather than commas to separate statements
Date:   Sun, 27 Sep 2020 21:12:20 +0200
Message-Id: <1601233948-11629-11-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Replace commas with semicolons.  What is done is essentially described by
the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/clk/meson/meson-aoclk.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
index bf8bea675d24..3a6d84cd6601 100644
--- a/drivers/clk/meson/meson-aoclk.c
+++ b/drivers/clk/meson/meson-aoclk.c
@@ -57,7 +57,7 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 	rstc->data = data;
 	rstc->regmap = regmap;
 	rstc->reset.ops = &meson_aoclk_reset_ops;
-	rstc->reset.nr_resets = data->num_reset,
+	rstc->reset.nr_resets = data->num_reset;
 	rstc->reset.of_node = dev->of_node;
 	ret = devm_reset_controller_register(dev, &rstc->reset);
 	if (ret) {

