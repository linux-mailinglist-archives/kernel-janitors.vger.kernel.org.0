Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C92616FF7EB
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 May 2023 19:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238734AbjEKRBb (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 11 May 2023 13:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238731AbjEKRBa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 May 2023 13:01:30 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4654E6A64
        for <kernel-janitors@vger.kernel.org>; Thu, 11 May 2023 10:01:28 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f315712406so293984695e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 11 May 2023 10:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683824486; x=1686416486;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BThxZ5qi5ZNyRU4lsGs8ocEG84A93PngIlciELB2NNI=;
        b=m/HD4hQlRgyd2SGHzWi88Fr3gwfsMNZODqFGE5mkkvK5w/AN9HnoEJoeRA499CrTe6
         WZQaRPFFQZmlBBVPZurKwheiFd6dFn9C7AKRCp28K8r2F6gzSZGXWsq04HZj3yV1Mrxl
         76BMAHPU9quoKkaL/Tskfkvqoev9i7LYoFiVX6tple/fmeVQEDGzqcO6hk10hssUF5bv
         JzzG8NvXkBt6DvcEHci8cjCAFWxjJkriow1jY84zHgV0wk5JXZTeBgz+VKIsr0Sjzw29
         wBR7751luWrc6nUpvn9NE2AcK7sitIn8Qo70tv/jyau3aL0ArIeT155lqSGYZOQ4Sr0p
         31xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683824486; x=1686416486;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BThxZ5qi5ZNyRU4lsGs8ocEG84A93PngIlciELB2NNI=;
        b=OzYydo5gtEiiK/7SEUj/NxX4ux9rxB3qfhrOH0I8sJAQ0ea7um/GPfBA2rXuEFbXDc
         5I/ypeM4Ja0Snm1ibyzzII0YwIcKt49vJurkl+eyH1aHcZfCrQEAXA6mr/hpX5y7qH5v
         jj0ifCk1/w1podXN+X11EuHJRHVs5YTP6deBXNYzolBg/jmH3lQQuH13fKMD5PR86JNg
         4Iid9FpidxLiVZB5s0IEdLbQ0UsYFamWxcV4zsCV5yFx8OV1haKjYWVxHgBrmBDR1SVo
         7LMpXH4pZpt+sCUO7QkJRjqCRg3HNv/0asF91J7hWjBeyUZMntA5ezdlQNGUtacGUr/O
         wJyw==
X-Gm-Message-State: AC+VfDz+EFp+zd/QBhmlPctkF79rzi7toAWWqRq/2O9ONJ/ozMMitosK
        CV4K1SFL5jw0HQ07odL5jOjg+g==
X-Google-Smtp-Source: ACHHUZ5JL4gXLXUOqHx3p6v3/0DbjsId5F+MeRpyBYEevBpuAOdKnVqihMWW6aPYv73kSnSntFOGNA==
X-Received: by 2002:adf:e681:0:b0:2f6:661:c03c with SMTP id r1-20020adfe681000000b002f60661c03cmr14618617wrm.28.1683824486641;
        Thu, 11 May 2023 10:01:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q10-20020adfcd8a000000b00307c8d6b4a0sm2356284wrj.26.2023.05.11.10.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 10:01:24 -0700 (PDT)
Date:   Thu, 11 May 2023 20:01:20 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: clocking-wizard: Fix Oops in clk_wzrd_register_divider()
Message-ID: <f0e39b5c-4554-41e0-80d9-54ca3fabd060@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch detected this potential error pointer dereference
clk_wzrd_register_divider().  If devm_clk_hw_register() fails then
it sets "hw" to an error pointer and then dereferences it on the
next line.  Return the error directly instead.

Fixes: 5a853722eb32 ("staging: clocking-wizard: Add support for dynamic reconfiguration")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index e83f104fad02..16df34f46280 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -525,7 +525,7 @@ static struct clk *clk_wzrd_register_divider(struct device *dev,
 	hw = &div->hw;
 	ret = devm_clk_hw_register(dev, hw);
 	if (ret)
-		hw = ERR_PTR(ret);
+		return ERR_PTR(ret);
 
 	return hw->clk;
 }
-- 
2.39.2

