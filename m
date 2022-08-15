Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA31592F20
	for <lists+kernel-janitors@lfdr.de>; Mon, 15 Aug 2022 14:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242350AbiHOMon (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 15 Aug 2022 08:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242308AbiHOMom (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 Aug 2022 08:44:42 -0400
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BEFBDEF4
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Aug 2022 05:44:41 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id NZSQoHlfpPMmaNZSQoRFYh; Mon, 15 Aug 2022 14:44:39 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 15 Aug 2022 14:44:39 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-pm@vger.kernel.org
Subject: [PATCH] OPP: Fix an un-initialized variable usage
Date:   Mon, 15 Aug 2022 14:44:37 +0200
Message-Id: <a21fb09a4f2fcdb08eeb43cf4fb525621b16d086.1660567465.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

smatch complains that 'ret' may be returned un-initialized.

Explicitly return 0 if we reach the end of the function (should
'opp_table->clk_count' be 0).

Fixes: 8174a3a613af ("OPP: Provide a simple implementation to configure multiple clocks")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/opp/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 77d1ba3a4154..e87567dbe99f 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -873,7 +873,7 @@ int dev_pm_opp_config_clks_simple(struct device *dev,
 		}
 	}
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_config_clks_simple);
 
-- 
2.34.1

