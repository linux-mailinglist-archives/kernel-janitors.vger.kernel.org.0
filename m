Return-Path: <kernel-janitors+bounces-87-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E767DDB6C
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Nov 2023 04:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAEFB281CA7
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Nov 2023 03:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16AE0ED7;
	Wed,  1 Nov 2023 03:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2941010EE
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 03:17:05 +0000 (UTC)
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id EAAB8B4;
	Tue, 31 Oct 2023 20:17:02 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 2C6C06051EAB4;
	Wed,  1 Nov 2023 11:16:59 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: mike.looijmans@topic.nl,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: Su Hui <suhui@nfschina.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] clk: si5341: fix an error code problem in si5341_output_clk_set_rate
Date: Wed,  1 Nov 2023 11:16:36 +0800
Message-Id: <20231101031633.996124-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

regmap_bulk_write() return zero or negative error code, return the value
of regmap_bulk_write() rather than '0'.

Fixes: 3044a860fd09 ("clk: Add Si5341/Si5340 driver")
Acked-by: Mike Looijmans <mike.looijmans@topic.nl>
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/clk/clk-si5341.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 9599857842c7..2920fe2e5e8b 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -895,10 +895,8 @@ static int si5341_output_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	r[0] = r_div ? (r_div & 0xff) : 1;
 	r[1] = (r_div >> 8) & 0xff;
 	r[2] = (r_div >> 16) & 0xff;
-	err = regmap_bulk_write(output->data->regmap,
+	return regmap_bulk_write(output->data->regmap,
 			SI5341_OUT_R_REG(output), r, 3);
-
-	return 0;
 }
 
 static int si5341_output_reparent(struct clk_si5341_output *output, u8 index)
-- 
2.30.2


