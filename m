Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7B567B4C0C
	for <lists+kernel-janitors@lfdr.de>; Mon,  2 Oct 2023 09:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235622AbjJBHCB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 2 Oct 2023 03:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjJBHB7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 2 Oct 2023 03:01:59 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC409F
        for <kernel-janitors@vger.kernel.org>; Mon,  2 Oct 2023 00:01:57 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4065f29e933so26642565e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 02 Oct 2023 00:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696230116; x=1696834916; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=To5Z1ek1ng/bcrw4gcWQYfPUL1tJalZo399lDaaqlbk=;
        b=gjh37sAPabYEUrw8HCwH0189hKj07WBRiWaMzSlsgk+A9vIdWk0xfBx/nUCZqG8WXi
         mJcugLbICX5RPDpfUuRZp66oCbJUB1BQZaOFFLG4fyAl5fkZhNl1So6h5L9p7wMpiAMO
         a7pbs/v1+fbPTHCjU8ZCgWNCcI1WW/TnhE9xCuWQpZ544Qe794c3+ga6JQoYN71IfQBF
         KmWcrFuOwXa+05H3HT+lBc9XxHHrd7txiD0n0NyNtPmFosj/+CCxgHbbFPKVC4h87gHc
         fCr6bwzHEZxEf3JTQoPfQssL6mpE7xmBiRMSgXy3GzB/cnN7JloqH4mnsEubB+wAasgr
         eOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696230116; x=1696834916;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=To5Z1ek1ng/bcrw4gcWQYfPUL1tJalZo399lDaaqlbk=;
        b=GtrLv5wRuFeQJfKBSDVxbTIfgYfrvVQjRRRVYj6VAFppie/zRTxLzkHTpsGVh3aBUB
         EZY4TX2MjRpHQC+FaoEVFnVCstfSPSevYFoIzLRsy+PRZC04kUVqi3V7iyRNqsx7I4OX
         IARkNMmjUKpErROQHiaqcRalxIW6QizGYd02oLJJAxHiO9hKTojFzXsZBZsdbk371r9j
         YsrbBVUkOysUDxaE0brZXLPDlO/dExXvelD8fd9vXjeDCe5+O8nGgXC3TmKVP+ZJvbkF
         ELgZ/oVitLriZv78kKEDYVXvT3La1KGU6a4iRILAnCpqeAGzT8F0E37Es7NF43cPIequ
         NsMw==
X-Gm-Message-State: AOJu0YwxLLwVHguryZeQ/1LNWqAO8Q7ca9yefCojA01e8G/3ssN/bEAW
        bX0xq9XNUyWYnjswWSuJJ5b04w==
X-Google-Smtp-Source: AGHT+IFUaESPnID8Bx8Iq2U2O1ScDfATW117K0k6Diplm+aeOUbawH1TDpLk+t5XmonRkAxYLh2RTw==
X-Received: by 2002:a7b:ce8b:0:b0:402:98cd:a3e9 with SMTP id q11-20020a7bce8b000000b0040298cda3e9mr9220533wmj.32.1696230115893;
        Mon, 02 Oct 2023 00:01:55 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v3-20020a05600c214300b004063ea92492sm6595641wml.22.2023.10.02.00.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 00:01:55 -0700 (PDT)
Date:   Mon, 2 Oct 2023 10:01:51 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] clk: imx: imx8: Fix an IS_ERR() vs NULL check in
 clk_imx_acm_attach_pm_domains()
Message-ID: <44bacaba-848b-4e62-908c-16538330d4dd@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The device_link_add() function returns NULL on error.  It doesn't return
error pointers.  Fix the check accordingly.

Fixes: d3a0946d7ac9 ("clk: imx: imx8: add audio clock mux driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/imx/clk-imx8-acm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-acm.c
index 1e82f72b75c6..83019b986622 100644
--- a/drivers/clk/imx/clk-imx8-acm.c
+++ b/drivers/clk/imx/clk-imx8-acm.c
@@ -287,9 +287,9 @@ static int clk_imx_acm_attach_pm_domains(struct device *dev,
 							 DL_FLAG_STATELESS |
 							 DL_FLAG_PM_RUNTIME |
 							 DL_FLAG_RPM_ACTIVE);
-		if (IS_ERR(dev_pm->pd_dev_link[i])) {
+		if (!dev_pm->pd_dev_link[i]) {
 			dev_pm_domain_detach(dev_pm->pd_dev[i], false);
-			ret = PTR_ERR(dev_pm->pd_dev_link[i]);
+			ret = -EINVAL;
 			goto detach_pm;
 		}
 	}
-- 
2.39.2

