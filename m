Return-Path: <kernel-janitors+bounces-6644-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A0A9E7BBF
	for <lists+kernel-janitors@lfdr.de>; Fri,  6 Dec 2024 23:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D46B9287969
	for <lists+kernel-janitors@lfdr.de>; Fri,  6 Dec 2024 22:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89651CBEAA;
	Fri,  6 Dec 2024 22:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Db06uJAk"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr [80.12.242.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28911213E7F
	for <kernel-janitors@vger.kernel.org>; Fri,  6 Dec 2024 22:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733523970; cv=none; b=hYVrCMXWK9i5loJlBws3DrWnmSRBGytDcyUJ1URGT9QMqOwLLfJstgOVlDQBuW+PRbSBhFeslkbllUBKi+VxgQie4jADY0E9m5U/paUmb1bhlsOGj15OxFUzlkB3fg6N8PpQ2PY3XvEdVpddBl/sefn5k7QYPuTM4wesCweM8R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733523970; c=relaxed/simple;
	bh=Lnuw42Mv5iHPBLo/2AByl5VlBgqQFDUrAunAYV1GFec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nkdNsFDUdiL0VYTvlLh76fJ7EYHNd49KKuVd1jMSE9Iya5yABNZgnQFjXyOEmEy8QIvcARpktEciPWBcEe0QALxZWWq5nLg79qfvRhyZg97FfOeASQyXd5A8ifsoYloj/9lnYJK5lDS376T2XXJXWTI4ow1+tLiepqYplfVNNd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Db06uJAk; arc=none smtp.client-ip=80.12.242.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id JglqtTW6qgyqpJglztoJXr; Fri, 06 Dec 2024 23:26:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733523968;
	bh=g1WxuViRwGa1+bDp1AsTQe31lF4KfiLv3FxP9yuHr6w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Db06uJAkQEDTFLQLzcpIu2x/Dqn+GTenRvjIJBeu0OU/NkxEMORiJW+XxtwycrgZZ
	 cNRffc7eeA6P5XqdjMe0O4kf6uOnqqUYt9DvotIj9ajk98fQxw19YNmKKt2DYumh4/
	 c3MxCwX4GtJhsUsG+2f85lOirQeEH3sB51VUUqMEnT7ocpEx0nrnH/MEBSjSSymge7
	 OSxWS/V7nBtOGm5GyW7Wokzqon8P8+3czkJtYaCf8FX9zFlN7XVKN2+dLsmlBV8W+Z
	 VANKnINwtsgjUQQJcWIS30xxi6XfZbAm63vhIi3XYJnnb7/X1vxVkfV1aBaAaIwoyj
	 HOUWSoTkagc4g==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 06 Dec 2024 23:26:08 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Paul Burton <paulburton@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] auxdisplay: img-ascii-lcd: Constify struct img_ascii_lcd_config
Date: Fri,  6 Dec 2024 23:25:42 +0100
Message-ID: <f205c8ab886a4e12b2ceda6f89c873a9d921625d.1733523925.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <35fab997bcac76cd4135797a4968c2c72511dcb9.1733523925.git.christophe.jaillet@wanadoo.fr>
References: <35fab997bcac76cd4135797a4968c2c72511dcb9.1733523925.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct img_ascii_lcd_config' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   6110	    728	      0	   6838	   1ab6	drivers/auxdisplay/img-ascii-lcd.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   6198	    632	      0	   6830	   1aae	drivers/auxdisplay/img-ascii-lcd.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/auxdisplay/img-ascii-lcd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/auxdisplay/img-ascii-lcd.c b/drivers/auxdisplay/img-ascii-lcd.c
index 693339ba89d0..32e1863ef4b2 100644
--- a/drivers/auxdisplay/img-ascii-lcd.c
+++ b/drivers/auxdisplay/img-ascii-lcd.c
@@ -69,7 +69,7 @@ static void boston_update(struct linedisp *linedisp)
 #endif
 }
 
-static struct img_ascii_lcd_config boston_config = {
+static const struct img_ascii_lcd_config boston_config = {
 	.num_chars = 8,
 	.ops = {
 		.update = boston_update,
@@ -98,7 +98,7 @@ static void malta_update(struct linedisp *linedisp)
 		pr_err_ratelimited("Failed to update LCD display: %d\n", err);
 }
 
-static struct img_ascii_lcd_config malta_config = {
+static const struct img_ascii_lcd_config malta_config = {
 	.num_chars = 8,
 	.external_regmap = true,
 	.ops = {
@@ -200,7 +200,7 @@ static void sead3_update(struct linedisp *linedisp)
 		pr_err_ratelimited("Failed to update LCD display: %d\n", err);
 }
 
-static struct img_ascii_lcd_config sead3_config = {
+static const struct img_ascii_lcd_config sead3_config = {
 	.num_chars = 16,
 	.external_regmap = true,
 	.ops = {
-- 
2.47.1


