Return-Path: <kernel-janitors+bounces-8534-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B16BAF9EE7
	for <lists+kernel-janitors@lfdr.de>; Sat,  5 Jul 2025 09:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 788BE4A067D
	for <lists+kernel-janitors@lfdr.de>; Sat,  5 Jul 2025 07:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7FC274FDC;
	Sat,  5 Jul 2025 07:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="hcnAbTcd"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-80.smtpout.orange.fr [80.12.242.80])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995FD275AE6
	for <kernel-janitors@vger.kernel.org>; Sat,  5 Jul 2025 07:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751702346; cv=none; b=sYr2ehFpmtGu1zsV/ByMCuum//8hHIVxLKNIROeksSHaM73p77cKeeaTvg4J2vlYpFYLU8uJ+t9GcPJseJgFwQSCoSPLVaNK9qEdjlZ9rmb2ribtLwV05z+14Bowm6ltCsLPq5K9yxK2WX+02+6FpAxKKi94kMhlmBiWxfRSWDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751702346; c=relaxed/simple;
	bh=/VexuRGfxstLsMBVegl0LgB0EX+vVYZredeeu5BeKfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sQ6u6JJLZhhQjcZahJ25UJVD6gAAYARe791pRQeQb/+OF2nq2d0VSR1ckW8SP84YjXtYJlI07BRisrumm0SXzRMxFmCs16Kgwb3MiPyxi3eE6W3apgZgKNQvihirMoEPI/RQJIaZX3/IMqPiNVOZEE/4Z7zZyYaxJEBrm2RiWVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=hcnAbTcd; arc=none smtp.client-ip=80.12.242.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id XxmRuIndJIhD3XxmRuGMxm; Sat, 05 Jul 2025 09:57:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1751702275;
	bh=BI+j1w9mTZpLw/TaFgSG0lCPQ8EjEl0+1NsDW1CCqCY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=hcnAbTcdE9dhBmNv1p1ojidJSRx56OGpjMVnzdTmNcAuPDAfYoI+7AzM3FxalgGR2
	 UrLZ7te0oTPEP+uP+jrv3UrhfRl6IZEPTSX0QQBGgbBd6AyD30LVwPC4LxRoKzJymr
	 h5fgBFyz9tTrqqI49vo5uHpYvfxdP3DRypGeihhHBRNnN479gVC4Bmd55IxDQmIicg
	 sks05tr+XLsGYUJExNK6janAnLondxBWJlNqJ37ppgxeBu54lA3u/EXzmXSb5zecjj
	 FGEkevjawYi9OMfb5vZ24XdXBIwVJXVwDgutkUiXjiq96D+gtamaENK5c6f4y3aYl8
	 h+zXwKaL9PmoA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 05 Jul 2025 09:57:55 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: vigneshr@ti.com,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	andi.shyti@kernel.org,
	miaoqinglang@huawei.com,
	grygorii.strashko@ti.com,
	wsa@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/2] i2c: omap: 2 Fixes
Date: Sat,  5 Jul 2025 09:57:36 +0200
Message-ID: <cover.1751701715.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small serie is a follow-up of [1].

For an unkwown reason I don't feel really confident with these patches.
Maybe because one is really old and the other one is related to
pm, which ordering is sometimes tricky (from my PoV at least).

They are compile tested only.

So review with care ;-)

[1]: https://lore.kernel.org/all/vhhxtsspywvuzkfgbn52hysghd6tdxhk32wv3wcnlqwhskto3f@h2bbhek3s4s3/

Christophe JAILLET (2):
  i2c: omap: Handle omap_i2c_init() errors in omap_i2c_probe()
  i2c: omap: Fix an error handling path in omap_i2c_probe()

 drivers/i2c/busses/i2c-omap.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.50.0


