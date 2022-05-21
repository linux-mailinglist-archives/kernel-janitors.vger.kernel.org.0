Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0807952FB54
	for <lists+kernel-janitors@lfdr.de>; Sat, 21 May 2022 13:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354836AbiEULNI (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 21 May 2022 07:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349941AbiEULMQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 21 May 2022 07:12:16 -0400
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 906842D1EB;
        Sat, 21 May 2022 04:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IFMk+sG1UkKvvet9eVEjt93RJXFlKUDi3Jz4fWOgUhg=;
  b=PBKOlLXg1sPPVZuZm2u8rC85P2knGUduUA24hKtJrGlcBfo3iDZt85Mt
   xVtAPUidhjAQg3jrSeKusd7UflRGrzlMKveeAxM+fga8okdZFKdOQbHg+
   Cpr1z83U/f+8HMk7rJ5wrocuQI4r6uvHk2cEisQL1eY0SOaHnLv5DrV3m
   s=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,242,1647298800"; 
   d="scan'208";a="14727925"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2022 13:11:57 +0200
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Tiffany Lin <tiffany.lin@mediatek.com>
Cc:     kernel-janitors@vger.kernel.org,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: mediatek: vcodec: fix typo in comment
Date:   Sat, 21 May 2022 13:10:40 +0200
Message-Id: <20220521111145.81697-30-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Spelling mistake (triple letters) in comment.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
index a29041a0b7e0..c156048cd4a5 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
@@ -255,7 +255,7 @@ struct vdec_pic_info {
  * @param_change: indicate encode parameter type
  * @enc_params: encoding parameters
  * @dec_if: hooked decoder driver interface
- * @enc_if: hoooked encoder driver interface
+ * @enc_if: hooked encoder driver interface
  * @drv_handle: driver handle for specific decode/encode instance
  *
  * @picinfo: store picture info after header parsing

