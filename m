Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC5E873F519
	for <lists+kernel-janitors@lfdr.de>; Tue, 27 Jun 2023 09:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbjF0HMv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 27 Jun 2023 03:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjF0HMu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Jun 2023 03:12:50 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7E81BE4
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Jun 2023 00:12:45 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fa96fd7a01so22404475e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Jun 2023 00:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687849964; x=1690441964;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ggLDGiLASKXjzv41vxcGuD0v2D3Md+XuVsA8ytWFhq0=;
        b=dD4ZR8xlf80OKvytf3PyeqgCLIP4CC6nIl+F8NYd6+cYEP0lEu/52Z6/BbBpzFzQ7m
         kY79A8AAUUBHKPrTwJEhmZudI6xu/p9bD3xdm+15HsaR2cTMJb5r/F2pHv/dTx7kzlR4
         zMHTz/bOflFXKVJm8OFQyuNY/5c50dM4wZhj7FG2mLHEno+033CgjqA8hTiNHnN1DO64
         zfri5fOXOpUFe8O0cBSU8yU1iG32UVPh5HkZc4vB0w7kWUAwwQ+gNKWvIZm0Vz0DuMId
         sWLg5fvMxzRUrvq8jS+dHVivz/ZpZTgBKNrNtkVtTxzM3abYlLkHziG4433gMo9x9q1w
         dGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687849964; x=1690441964;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ggLDGiLASKXjzv41vxcGuD0v2D3Md+XuVsA8ytWFhq0=;
        b=ae5HJM+M1ACFWeaNorc4c6yxj1vLLBGmobTO4EjpUKVwNGdktJl0Ssbql61Z5eFari
         3cvadNWpCeHIzmbaKbo4x9eT05DI7DiNMpIKXv6sYmnBuuKs07U+l2AAV0tvj9CYt354
         X3mBKzFlBADlb2QnA81zDnYneQcx/7iVtCoe9vtzygghTz2YYhJlKE41DZ1XYIIQm+QP
         cg0Pw7Fmti3YPkXJ2em5tSvmOVqOLPXpkho9z/Lqi/efyGXmLtKinK+7/GpwO0n683lC
         Z8IMXtSjCIAGdD1Ri+sbjCrp89yP8PmedWac24vBMiuEP4YhdutxiKDlrPtnQ1VNcaZt
         9MGw==
X-Gm-Message-State: AC+VfDwIhUMpQzJ6fvuicYOlG6IH4NZEiJ5m7wfUATgxIvxs0NXXEMLy
        2AZbZfRWbovuTlAxyGwJne+ZzA==
X-Google-Smtp-Source: ACHHUZ4xx+0rg/Ks+yJHZbTzNzYTWyjpHzcQcOs1x9M64X7tq8jGOULoEd3lGMvz94HJaCLUkFZMUA==
X-Received: by 2002:a05:600c:2247:b0:3fb:a266:3a34 with SMTP id a7-20020a05600c224700b003fba2663a34mr897038wmm.12.1687849963890;
        Tue, 27 Jun 2023 00:12:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm9464956wrz.47.2023.06.27.00.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 00:12:42 -0700 (PDT)
Date:   Tue, 27 Jun 2023 10:12:36 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] i2c: sun6i-p2wi: Fix an error message in probe()
Message-ID: <98afbc28-3366-459e-bd01-f77cf1a67fe9@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

The "ret" variable is uninitialized.  It was the "p2wi->rstc" variable
that was intended.  We can also use the %pe string format to print the
error code name instead of just the number.

Fixes: 75ff8a340a81 ("i2c: sun6i-p2wi: Use devm_clk_get_enabled()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index ad8270cdbd3e..fa6020dced59 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -250,7 +250,8 @@ static int p2wi_probe(struct platform_device *pdev)
 
 	p2wi->rstc = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(p2wi->rstc)) {
-		dev_err(dev, "failed to retrieve reset controller: %d\n", ret);
+		dev_err(dev, "failed to retrieve reset controller: %pe\n",
+			p2wi->rstc);
 		return PTR_ERR(p2wi->rstc);
 	}
 
-- 
2.39.2

