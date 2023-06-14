Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8B772FF79
	for <lists+kernel-janitors@lfdr.de>; Wed, 14 Jun 2023 15:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244315AbjFNNH0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 14 Jun 2023 09:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244127AbjFNNHZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 14 Jun 2023 09:07:25 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4060710F6
        for <kernel-janitors@vger.kernel.org>; Wed, 14 Jun 2023 06:07:23 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f619c2ba18so8104929e87.1
        for <kernel-janitors@vger.kernel.org>; Wed, 14 Jun 2023 06:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686748041; x=1689340041;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lZBZeD0GaGiCmPYETOfSpqVss+oC7CK9FRJirVMLVdQ=;
        b=cIhiHvfxTBhBdrH8q7x9CzmG6haalwPBeS1QPU8AY0haA5sb8kRwSyeGVjLkzIlDsV
         OBQcpx6TQIVSAVSgrYwGxQCxIw+XL5NapnwOKGnKd8pMhWMDXdDNN1U6lEF4+xriRE1L
         yJmSOXvQm+YDRtlj9Wtsc6bEAEZMVZi8O/W1CzvyYDy1xampTtUyAb3jqP123Hnj7bbK
         t03RVgLKddZHc2/BjUPSo1VA+tsBKrJPQ3/xc8RCP4r1+HVST6h80tuEUHO56MhSqkkd
         Doqa017D6ukUun0TBPA/mmvcri516l3KQteAxPWHpeHwt2E5xiRMZRaG/8lrS7y96v99
         9h/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686748041; x=1689340041;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZBZeD0GaGiCmPYETOfSpqVss+oC7CK9FRJirVMLVdQ=;
        b=C8aHiPAxowZRwC5KTCrcoaWZg2K/noC+dGjBAz/TAYyh+XBPMkHNZN73Ad2CRW8l7Y
         NhYrNW2wBboIiMfqVG1W3tXIwZjUkZGQbphqNEESpU881gMDFAohTRsJoBC6PvfGGZlr
         ESmT3Fi3VdcEm+BuO6C5a5a8YqUU9ww8ChsTukHz+zcCaoQb5VWx9v67s6O+DL46c3mo
         bAFI8ifpqxDjKCkgiq8ok3UeTgPjaJQvF4UrRyaSdVDOHxuDFYPo1rAlUvB5g1m6TDLr
         GCtygyGUJGyxAoU49hPv2fnfiaOhfaC4lkXMxTLFwOIcWUyKmpRiwIk80jKxPw6bedm5
         VCpg==
X-Gm-Message-State: AC+VfDwXMadkOouPZtXC62opbE1seBckxHz2QxtXi4hJlbAmU7CxjQJF
        /rubZtS/RpsnyNxROa9yLDuhDA==
X-Google-Smtp-Source: ACHHUZ7ZMifrDxtIycZi/rDNVoPjvHN6VaI8o4UGCLlqwe0otV/MQAZDcjR62IQuaO1/6WnuCTWntg==
X-Received: by 2002:a19:8c4b:0:b0:4db:3d51:6896 with SMTP id i11-20020a198c4b000000b004db3d516896mr7552938lfj.11.1686748041459;
        Wed, 14 Jun 2023 06:07:21 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l7-20020a7bc447000000b003f7f36896f9sm17299580wmi.42.2023.06.14.06.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:07:19 -0700 (PDT)
Date:   Wed, 14 Jun 2023 16:07:15 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 3/4] media: mediatek: vcodec: Fix potential crash in
 mtk_vcodec_dbgfs_remove()
Message-ID: <d4fffbaa-f01d-4e2e-9b1b-45d996236642@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca491aaa-cfc4-4a84-b7fc-b64f3adc6550@moroto.mountain>
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The list iterator "dbgfs_inst" is always non-NULL.  This means that the
test for NULL inside the loop is unnecessary and it also means that the
test for NULL outside the loop will not work.  If we do not find the item
on the list with the correct the ctx_id then it will free invalid memory
leading to a crash.

Fixes: cd403a6a0419 ("media: mediatek: vcodec: Add a debugfs file to get different useful information")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
index 2151c3967684..2ebf68d33d57 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
@@ -166,16 +166,13 @@ void mtk_vcodec_dbgfs_remove(struct mtk_vcodec_dev *vcodec_dev, int ctx_id)
 	struct mtk_vcodec_dbgfs_inst *dbgfs_inst;
 
 	list_for_each_entry(dbgfs_inst, &vcodec_dev->dbgfs.dbgfs_head, node) {
-		if (dbgfs_inst && dbgfs_inst->inst_id == ctx_id) {
+		if (dbgfs_inst->inst_id == ctx_id) {
 			vcodec_dev->dbgfs.inst_count--;
-			break;
+			list_del(&dbgfs_inst->node);
+			kfree(dbgfs_inst);
+			return;
 		}
 	}
-
-	if (dbgfs_inst) {
-		list_del(&dbgfs_inst->node);
-		kfree(dbgfs_inst);
-	}
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_dbgfs_remove);
 
-- 
2.39.2

