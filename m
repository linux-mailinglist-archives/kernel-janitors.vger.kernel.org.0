Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C62F98F1C8
	for <lists+kernel-janitors@lfdr.de>; Thu, 15 Aug 2019 19:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731946AbfHOROz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 15 Aug 2019 13:14:55 -0400
Received: from mail-ed1-f97.google.com ([209.85.208.97]:44664 "EHLO
        mail-ed1-f97.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731800AbfHOROh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Aug 2019 13:14:37 -0400
Received: by mail-ed1-f97.google.com with SMTP id a21so2680805edt.11
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Aug 2019 10:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
        bh=2tOdgRw7bHfBUMRr5A78wZooift8kR44FLxZ2fHFoq4=;
        b=de2k5LDVMVVMjJy4rkD5h/+AJUfG1UHKF74GiJMMu8R3K9bawcRwBO3gWM5eTolrCU
         YmP2TExnvWqjXEIOeUrCWQBn8KAl9Umzuj0MqGtxJQqe3V8N4Y3AY1RSCvH7eZAZA+4j
         OA03g5aq0cPbP0XEATzpcpCAMs4xlle1uX3OKqQaTd8pVNzzhyC7ucOp28Je7DOqyMIl
         2IaHAj4yHZNx3k1kDoIjjOqNlVJuSFleDEY6Jjy9I970/rSZQqwYf1qpYSQpN/sU+A3J
         gLdWMSvtx6zTU0T3zu9Zo8vQRR03wWf3c7tSZ1VWDTMZtgLeqI9sXF0NTzUBy2dLS9eb
         WkhQ==
X-Gm-Message-State: APjAAAUtHTZy8/9FuI8/IY/4FScX5m20BRd62F8XCorL2QkydBu/SwWK
        Nz/RnCmQJzhuSkN1OrqLaIRI1OgF/bBvgAwh0OOtgJvFj56ch/f69NKRmsFrASHeuQ==
X-Google-Smtp-Source: APXvYqxFD14tT+W/wcwosNR4mJq7LHL6hBkxp8vUHcz2et2BdUwg/HEyBFE8UDSLNuhEWf01rrv+4zglTLjl
X-Received: by 2002:aa7:dc5a:: with SMTP id g26mr6664165edu.62.1565889275802;
        Thu, 15 Aug 2019 10:14:35 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk. [2a01:7e01::f03c:91ff:fed4:a3b6])
        by smtp-relay.gmail.com with ESMTPS id u22sm54883edi.2.2019.08.15.10.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2019 10:14:35 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hyJKd-00052v-CB; Thu, 15 Aug 2019 17:14:35 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id DD14E2742BD6; Thu, 15 Aug 2019 18:14:34 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Colin Ian King <colin.king@canonical.com>
Cc:     kernel-janitors@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: max8660: remove redundant assignment of variable ret" to the regulator tree
In-Reply-To: <20190813133114.14931-1-colin.king@canonical.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171434.DD14E2742BD6@ypsilon.sirena.org.uk>
Date:   Thu, 15 Aug 2019 18:14:34 +0100 (BST)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The patch

   regulator: max8660: remove redundant assignment of variable ret

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 9e127fab67e3ec4451696da0c7872fd291b9372b Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 13 Aug 2019 14:31:14 +0100
Subject: [PATCH] regulator: max8660: remove redundant assignment of variable
 ret

Variable ret is initialized to a value that is never read before
a return statement and hence can be removed. Remove it.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Link: https://lore.kernel.org/r/20190813133114.14931-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/max8660.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/max8660.c b/drivers/regulator/max8660.c
index 4bca54446287..347043a5a9a7 100644
--- a/drivers/regulator/max8660.c
+++ b/drivers/regulator/max8660.c
@@ -485,7 +485,6 @@ static int max8660_probe(struct i2c_client *client,
 		rdev = devm_regulator_register(&client->dev,
 						  &max8660_reg[id], &config);
 		if (IS_ERR(rdev)) {
-			ret = PTR_ERR(rdev);
 			dev_err(&client->dev, "failed to register %s\n",
 				max8660_reg[id].name);
 			return PTR_ERR(rdev);
-- 
2.20.1

