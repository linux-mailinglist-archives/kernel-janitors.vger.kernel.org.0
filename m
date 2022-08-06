Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9E1258B3E9
	for <lists+kernel-janitors@lfdr.de>; Sat,  6 Aug 2022 07:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239084AbiHFFT7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 6 Aug 2022 01:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbiHFFT6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 6 Aug 2022 01:19:58 -0400
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E66613F64
        for <kernel-janitors@vger.kernel.org>; Fri,  5 Aug 2022 22:19:55 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id KCE2oIRdG0UP7KCE2ofqLM; Sat, 06 Aug 2022 07:19:53 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 06 Aug 2022 07:19:53 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: common: usb-conn-gpio: Simplify some error message
Date:   Sat,  6 Aug 2022 07:19:49 +0200
Message-Id: <7705a9dff8e097070c492d6f4f8aafaaa890f049.1659763173.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

dev_err_probe() already prints the error code in a human readable way, so
there is no need to duplicate it as a numerical value at the end of the
message.

Fixes: ddaf0d6dc467 ("usb: common: usb-conn-gpio: use dev_err_probe() to print log")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/common/usb-conn-gpio.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index b39c9f1c375d..44c5127175b7 100644
--- a/drivers/usb/common/usb-conn-gpio.c
+++ b/drivers/usb/common/usb-conn-gpio.c
@@ -208,10 +208,9 @@ static int usb_conn_probe(struct platform_device *pdev)
 	if (PTR_ERR(info->vbus) == -ENODEV)
 		info->vbus = NULL;
 
-	if (IS_ERR(info->vbus)) {
-		ret = PTR_ERR(info->vbus);
-		return dev_err_probe(dev, ret, "failed to get vbus :%d\n", ret);
-	}
+	if (IS_ERR(info->vbus))
+		return dev_err_probe(dev, PTR_ERR(info->vbus),
+				     "failed to get vbus\n");
 
 	info->role_sw = usb_role_switch_get(dev);
 	if (IS_ERR(info->role_sw))
-- 
2.34.1

