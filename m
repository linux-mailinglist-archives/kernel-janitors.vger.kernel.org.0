Return-Path: <kernel-janitors+bounces-1193-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1170982A010
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jan 2024 19:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 351441C2202C
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jan 2024 18:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D65A4D12A;
	Wed, 10 Jan 2024 18:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="SfNvsRDe"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E614CE1E
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jan 2024 18:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id NczKrhnvRmbVqNczKr2hj7; Wed, 10 Jan 2024 19:07:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1704910059;
	bh=h++82EIQan+T88yr5j4kPHz9mviSiCceIg7Aa1y11k4=;
	h=From:To:Cc:Subject:Date;
	b=SfNvsRDeR8TdAkQvt4n/OVL4ewdeG2WRAmbqHt+JNPVGd8G225QnXgQtnQQJm2etq
	 EfrA+UgeNCDbGx5C898BjKYnVinspvdOUiZ/QOY0liqqyTnmAoueh69f0mwj6ELOfi
	 tdkik6o6b8wYZBHqufFDXeUfSxE7XoT9RpS/742z11yggpxcaAReGMpPZN4jipriVf
	 OOq6F6vsn50X6PbdJiBq+7l/GQKSGS0Rn6sHNJsGtO3g4BF30UfkMEbvGosVpk+eWv
	 pXRUNXp3BrsOSpjTejQjk776F1B5yKp5zbHphaf02zqiDFdxbz0PzFHcDlfv0D3k/S
	 AxQss8G3Jx3Ag==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 10 Jan 2024 19:07:39 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: vkoul@kernel.org,
	jiaheng.fan@nxp.com,
	peng.ma@nxp.com,
	wen.he_1@nxp.com
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] MIPS: Alchemy: Fix an out-of-bound access in db1200_dev_setup()
Date: Wed, 10 Jan 2024 19:07:36 +0100
Message-Id: <ed2a1d5f41c5e83ae82fe6a16cfd40c78eeb8093.1704910022.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When calling spi_register_board_info(), we should pass the number of
elements in 'db1200_spi_devs', not 'db1200_i2c_devs'.

Fixes: 63323ec54a7e ("MIPS: Alchemy: Extended DB1200 board support.")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 arch/mips/alchemy/devboards/db1200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/alchemy/devboards/db1200.c b/arch/mips/alchemy/devboards/db1200.c
index f521874ebb07..67f067706af2 100644
--- a/arch/mips/alchemy/devboards/db1200.c
+++ b/arch/mips/alchemy/devboards/db1200.c
@@ -847,7 +847,7 @@ int __init db1200_dev_setup(void)
 	i2c_register_board_info(0, db1200_i2c_devs,
 				ARRAY_SIZE(db1200_i2c_devs));
 	spi_register_board_info(db1200_spi_devs,
-				ARRAY_SIZE(db1200_i2c_devs));
+				ARRAY_SIZE(db1200_spi_devs));
 
 	/* SWITCHES:	S6.8 I2C/SPI selector  (OFF=I2C	 ON=SPI)
 	 *		S6.7 AC97/I2S selector (OFF=AC97 ON=I2S)
-- 
2.34.1


