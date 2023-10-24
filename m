Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECFAC7D46C6
	for <lists+kernel-janitors@lfdr.de>; Tue, 24 Oct 2023 07:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbjJXFBF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 24 Oct 2023 01:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbjJXFBD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Oct 2023 01:01:03 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8B27F9
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 22:00:59 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-32db8924201so2718328f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 22:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698123658; x=1698728458; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PfAUTnXWgmubMD55oBXowoonH5R6qeZ5OH5Z0vIY35g=;
        b=NwkvYPetnhu5uYsBtd+1JCbNl3mKIMrTxAMZfjauZYCy72aQa0/GcaeXbQpasjjt5r
         6d77CURcn0a55mCdhFnZlZzw7039a0e2DnyQ4bQ3X6RTYPGCojhYWrOQD2Kh/qryrKsb
         SuksJbBlJ3wIwYTdfEx/6HpljuMYrUI3rIaV+T/01od9W7lDF4ek7acYrP6Bu1pDX7Cc
         qvH4qTAQzZl2wU2MprYZjCE4SzpHShYE9UaRf9kYMJjaSQR+eBXIyUs9eIQTCUvYUEUh
         Rdupo1laMo9oFbSztbtMOMewz10EIhglzzr8/Q8N/RqsRJkidLvbKK4UFi4OUgZb/OcU
         uykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698123658; x=1698728458;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PfAUTnXWgmubMD55oBXowoonH5R6qeZ5OH5Z0vIY35g=;
        b=gShqaObIaJRbHpvC5OwUGMpDQkugJVL1ohqY/5e2MXL1+kXl5CLWoH6Rc+UsKYoruD
         51kqthDuWyLM284fq6Sb8gEMo9fmU2zFlYMveNn+OTbHoJRZI67sOCLvKzejdJhHpqNf
         W4y00Sxae1a7iyCrHk6mTU9aXt9Soxn3/aBwcRf8BgtSB2JtLgwLHlP8plF0CWM/MeL0
         9WpBGurwsGgv4d9eaSjXnOPYEYjR1CZES9sX4uqNqZObaGQrMhOMGIwg7uzxvQq1x58v
         1dPiV+sK2botj7ro6AIZQCv5I4aNBd4lGag8m0lfKpi+l7BXZgJmLaSgI9BurpTcDU0q
         Jy6Q==
X-Gm-Message-State: AOJu0YyVmyZSIPkQva/jK7xdpEiExGYVEPG5sA3+yFBr0pZy9lvcM6E9
        DwHU02V7gGslqDT7xgT1NcGycOxN/HHF2XtpFR4=
X-Google-Smtp-Source: AGHT+IGCxa8zVvugVsfJkL9J6ZS+nuttr3UC3F3P4N8AKS3AC9nbGPTuSL5sW9pl6CVyGpEEPy2M/A==
X-Received: by 2002:a5d:44c8:0:b0:32d:83b7:bdb3 with SMTP id z8-20020a5d44c8000000b0032d83b7bdb3mr8294329wrr.70.1698123658157;
        Mon, 23 Oct 2023 22:00:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d17-20020a5d6451000000b0032da022855fsm9020793wrw.111.2023.10.23.22.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 22:00:57 -0700 (PDT)
Date:   Tue, 24 Oct 2023 08:00:53 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Johnson Wang <johnson.wang@mediatek.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Edward-JW Yang <edward-jw.yang@mediatek.com>,
        Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: mediatek: fix double free in mtk_clk_register_pllfh()
Message-ID: <cd7fa365-28cc-4c34-ac64-6da57c98baa6@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The mtk_clk_register_pll_ops() currently frees the "pll" parameter.
The function has two callers, mtk_clk_register_pll() and
mtk_clk_register_pllfh().  The first one, the _pll() function relies on
the free, but for the second _pllfh() function it causes a double free
bug.

Really the frees should be done in the caller because that's where
the allocation is.

Fixes: d7964de8a8ea ("clk: mediatek: Add new clock driver to handle FHCTL hardware")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/mediatek/clk-pll.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index a4eca5fd539c..513ab6b1b322 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -321,10 +321,8 @@ struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
 
 	ret = clk_hw_register(NULL, &pll->hw);
 
-	if (ret) {
-		kfree(pll);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 
 	return &pll->hw;
 }
@@ -340,6 +338,8 @@ struct clk_hw *mtk_clk_register_pll(const struct mtk_pll_data *data,
 		return ERR_PTR(-ENOMEM);
 
 	hw = mtk_clk_register_pll_ops(pll, data, base, &mtk_pll_ops);
+	if (IS_ERR(hw))
+		kfree(pll);
 
 	return hw;
 }
-- 
2.42.0

