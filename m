Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E054AAD666
	for <lists+kernel-janitors@lfdr.de>; Mon,  9 Sep 2019 12:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390331AbfIIKHf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 9 Sep 2019 06:07:35 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:56282 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390279AbfIIKHb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 9 Sep 2019 06:07:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=0BWb9oFNsrzhHRoXjRJsJwhpQNsxpSMWA6Ianh79KG4=; b=kdfGYxagBog3
        B0uk3QvHNJqgZ5xw0vcglNzkWbAeGRVWdL6/pV38BSZhtOPbuUCzP9jiS2jkT2Paxw/zDKGoLz2SO
        nNpzN1DL8KuPJmOjOcRI446tBSB/P5cuhxI0sFni4lhLMAa3+Qe+tcD4P+zUuj232Q7SxeRpd3ncM
        sESsE=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1i7Ga0-0001ub-4U; Mon, 09 Sep 2019 10:07:28 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id 86F3BD02D18; Mon,  9 Sep 2019 11:07:27 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Markus Elfring <elfring@users.sourceforge.net>
Cc:     kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
Subject: Applied "spi-gpio: Use PTR_ERR_OR_ZERO() in spi_gpio_request()" to the spi tree
In-Reply-To: <b2dd074a-1693-3aea-42b4-da1f5ec155c4@web.de>
X-Patchwork-Hint: ignore
Message-Id: <20190909100727.86F3BD02D18@fitzroy.sirena.org.uk>
Date:   Mon,  9 Sep 2019 11:07:27 +0100 (BST)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The patch

   spi-gpio: Use PTR_ERR_OR_ZERO() in spi_gpio_request()

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.4

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

From 8995673e6f584c2140b565d9ef20e4e4599aad7e Mon Sep 17 00:00:00 2001
From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 7 Sep 2019 13:51:16 +0200
Subject: [PATCH] spi-gpio: Use PTR_ERR_OR_ZERO() in spi_gpio_request()

Simplify this function implementation by using a known function.

Generated by: scripts/coccinelle/api/ptr_ret.cocci

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://lore.kernel.org/r/b2dd074a-1693-3aea-42b4-da1f5ec155c4@web.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-gpio.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/spi/spi-gpio.c b/drivers/spi/spi-gpio.c
index 9eb82150666e..1d3e23ec20a6 100644
--- a/drivers/spi/spi-gpio.c
+++ b/drivers/spi/spi-gpio.c
@@ -290,10 +290,7 @@ static int spi_gpio_request(struct device *dev, struct spi_gpio *spi_gpio)
 		return PTR_ERR(spi_gpio->miso);
 
 	spi_gpio->sck = devm_gpiod_get(dev, "sck", GPIOD_OUT_LOW);
-	if (IS_ERR(spi_gpio->sck))
-		return PTR_ERR(spi_gpio->sck);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(spi_gpio->sck);
 }
 
 #ifdef CONFIG_OF
-- 
2.20.1

