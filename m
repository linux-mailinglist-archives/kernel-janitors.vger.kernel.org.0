Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEDFB66D4FE
	for <lists+kernel-janitors@lfdr.de>; Tue, 17 Jan 2023 04:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235375AbjAQDde (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 16 Jan 2023 22:33:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235348AbjAQDdd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 16 Jan 2023 22:33:33 -0500
X-Greylist: delayed 300 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 16 Jan 2023 19:33:31 PST
Received: from aib29gb125.yyz1.oracleemaildelivery.com (aib29gb125.yyz1.oracleemaildelivery.com [192.29.72.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B46F22A18
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Jan 2023 19:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-2023;
 d=n8pjl.ca;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=cxpiFbfKTwfi/HQ21L22O5XuzZAHjqm8ye08lI1cAuQ=;
 b=dAcIK1B+1NqRtm2fYYOgHDrw+9raPT3P8xBJWj4Q7/7Wg4Ug6bJIKN6ZND1BSMydnrETtfZLSb09
   VDZ3LH4V59wwHp8nUuU7DRGBQAt58OxAF2xzVVC3z+ljIWMntJvQFmLPKoy0ef8pybJ2OURoll4u
   s/DMxIIqMQflTwJTpvd9KBshJ7HfApiO903neaHjySlDVrUUCuUcF58u+nOl8CG9fTOaStmIIVSW
   zX4l32icFGHtvorZw/VciLFgogvoO6wpMpnUJqS3eOxu6i67t402bNZK7MjU++l6DpJiZn2WPEa1
   QNhv/Gck8U9kQxYaZwbYxaLg/HQgMqLzsntavg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-yyz-20200204;
 d=yyz1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=cxpiFbfKTwfi/HQ21L22O5XuzZAHjqm8ye08lI1cAuQ=;
 b=KraK87MOgxiGIKGg7GsABjGSA72fuKVAoynvrvEf3tmN12aLv97FlwvD5V90GAU2Cxl6MHCmpUXs
   msELIJYUY380CDJE74Ni04ZNcZ7mK429+eRcl2SrSpsKK4IUk2Y9RfM8Wsfzx3+z3EAZb7BhR1fi
   jrFOeyO0nGBtF7pw109hpTaPNcUsLQ2lNZeL1qOL2Z+PWlzlvY1Fkef2SsPZyEV4ikGEw39vxuJp
   T79k+CGn/S4JSP/wTw9vWk6eioD48Pq1Os5YIGt04NYSMj57ekW0Lwn68Pe4WOTuhLRZL++XpGHe
   irSeB17Np8y/pXhyWQEEb/+Zpx62DfJupXWmRA==
Received: by omta-ad1-fd2-102-ca-toronto-1.omtaad1.vcndpyyz.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20221212 64bit (built Dec 12
 2022))
 with ESMTPS id <0ROM00AKK1NIJ060@omta-ad1-fd2-102-ca-toronto-1.omtaad1.vcndpyyz.oraclevcn.com> for
 kernel-janitors@vger.kernel.org; Tue, 17 Jan 2023 03:28:30 +0000 (GMT)
From:   Peter Lafreniere <peter@n8pjl.ca>
To:     linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc:     peter@n8pjl.ca, kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: rsi: Avoid defines prefixed with CONFIG
Date:   Mon, 16 Jan 2023 22:27:29 -0500
Message-id: <20230117032729.9578-1-peter@n8pjl.ca>
X-Mailer: git-send-email 2.39.0
MIME-version: 1.0
Content-transfer-encoding: 8bit
Reporting-Meta: AAHiyYFu0MCxKBTa9Dl/SLLmtqNcWrAX7M4oL30YuiG0jhEemrrj8Isyt4Pz+FBl
 MNOofWk5sVY+4ISbEn5msTpse/oJoQH6OH8O3oZyebMidNQf2/tJTT3QG1UsTg9N
 A31VupmjVBI4gePcFtJh97ESOmzhN9/6+FZqwk+C/gMQqRHe1shSlc/1peZuqfRh
 traWu1JNoqAaMkWKaz9Aha3ryDQ43a9zxB/8/7/gX/d4AzUaaHC4ZXJINW8G8k3T
 scb0o/kaxBtcntsIenB9hovshAc/w4+WDVkYb7A+xKxYFdkB0pR/0yt5jSNTPe6a
 mOWEZuGfd5IR/8L2g03DCii0VOqXVc8RH400bNUyKQAk3XASnCopvc/0Lvkbjlrp
 pxEE2zdAVIWNfmKm+WWdYuDYIotrSWqR3YFb5yj/mP22R6+1ih5raxeXfJcbiWvj
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

To avoid confusion, it is best to only define CONFIG_* macros in Kconfig
files. Here we change the name of one define, which causes no change to
functionality.

Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
---
 drivers/net/wireless/rsi/rsi_91x_hal.c | 4 ++--
 drivers/net/wireless/rsi/rsi_hal.h     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/rsi/rsi_91x_hal.c b/drivers/net/wireless/rsi/rsi_91x_hal.c
index c7460fbba014..d2e02d5da3c0 100644
--- a/drivers/net/wireless/rsi/rsi_91x_hal.c
+++ b/drivers/net/wireless/rsi/rsi_91x_hal.c
@@ -894,7 +894,7 @@ static int rsi_load_9113_firmware(struct rsi_hw *adapter)
 	struct ta_metadata *metadata_p;
 	int status;
 
-	status = bl_cmd(adapter, CONFIG_AUTO_READ_MODE, CMD_PASS,
+	status = bl_cmd(adapter, CONFIGURE_AUTO_READ_MODE, CMD_PASS,
 			"AUTO_READ_CMD");
 	if (status < 0)
 		return status;
@@ -984,7 +984,7 @@ static int rsi_load_9113_firmware(struct rsi_hw *adapter)
 	}
 	rsi_dbg(ERR_ZONE, "Firmware upgrade failed\n");
 
-	status = bl_cmd(adapter, CONFIG_AUTO_READ_MODE, CMD_PASS,
+	status = bl_cmd(adapter, CONFIGURE_AUTO_READ_MODE, CMD_PASS,
 			"AUTO_READ_MODE");
 	if (status)
 		goto fail;
diff --git a/drivers/net/wireless/rsi/rsi_hal.h b/drivers/net/wireless/rsi/rsi_hal.h
index 5b07262a9740..e1d9a4676f44 100644
--- a/drivers/net/wireless/rsi/rsi_hal.h
+++ b/drivers/net/wireless/rsi/rsi_hal.h
@@ -69,7 +69,7 @@
 #define EOF_REACHED			'E'
 #define CHECK_CRC			'K'
 #define POLLING_MODE			'P'
-#define CONFIG_AUTO_READ_MODE		'R'
+#define CONFIGURE_AUTO_READ_MODE	'R'
 #define JUMP_TO_ZERO_PC			'J'
 #define FW_LOADING_SUCCESSFUL		'S'
 #define LOADING_INITIATED		'1'
-- 
2.39.0

