Return-Path: <kernel-janitors+bounces-4514-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFD69296C1
	for <lists+kernel-janitors@lfdr.de>; Sun,  7 Jul 2024 07:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7666F1C20D5F
	for <lists+kernel-janitors@lfdr.de>; Sun,  7 Jul 2024 05:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37878480;
	Sun,  7 Jul 2024 05:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="lIOVhAW+"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5B46FC7
	for <kernel-janitors@vger.kernel.org>; Sun,  7 Jul 2024 05:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720331790; cv=none; b=a7vUslA5CIIWtcqsyGFNl/1d+wea6xBhoMG5XWlrSE6e7uIT12pKhQutxelQZFyD+BmMig89DFh1VwdVActkK9+OsJ/2bzw2I0vNW45DmMSDKeRM30pCnXRRNdh5sh3sEOz6xje/leOgFD1lWYmQ/cNX1e989xmlZjT14GiLU+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720331790; c=relaxed/simple;
	bh=OZ6IfSHHRN95XSIF6OwiF3W1o8Ut2XRNgJaDOh3EMsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=skamtnJbmA04/onGA/uCZJkNgYisR5zfBp0xPUgBG3Wfq+fO8a130DeOhIv9hBsEzY+4QEwZaDSUxLTuTptyXpompAR13rr/AP7oJ35/EKdA3MmVVEy96SctsDJwSLBW7qdHnjd91wMR7d7A46xaKjPCE1QsqmDfmJHCtJoR5ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=lIOVhAW+; arc=none smtp.client-ip=80.12.242.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id QKkEsyOxChEtDQKkEs8JGj; Sun, 07 Jul 2024 07:47:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1720331253;
	bh=8pSTgdZnyG0WLlJB7fRFIXGVRIVCBFFXYFkuJxWni6Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=lIOVhAW+drTQMVfkDzgXljERlaxfwUOHWEUbsUAQdlUAg4+Ox8JCoD6OD6WNqHu9v
	 F1k0nngx4C99rcgu3tGXM4m7qLPFua7HGlCqCfNBTkF+euLbbtuCl9t6IFlT/qrJo3
	 b7pUGDfSn8rrhadTEwd6umJlYgJupUXhrukZ1NuvKpLyRkvMwxdGFc5c9N/Fi5BRxi
	 44cFKv7OZGUs3Z3qfvnIcf2pGdbmOai/4FJ9m8LNw1PQwcbz4TLKqKq6AosD8ruEwO
	 3erHBv4gG/2l3A7518DvuS9TCnnJIj1//yon6mFbRlXJe8YlXaNir/OSR6vnu4Wx6z
	 Kvot4pAGhQ5zQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 07 Jul 2024 07:47:33 +0200
X-ME-IP: 86.243.222.230
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	fchiby@baylibre.com,
	fparent@baylibre.com,
	s.hauer@pengutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 0/3] soc: mediatek: pwrap: Constify some data and other improvements
Date: Sun,  7 Jul 2024 07:47:19 +0200
Message-ID: <cover.1720331018.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is motivated by patch 1. The 2 other patches are some
additionnal goodies spotted while looking at the code.

Patch 1 constifies struct pmic_wrapper_type to move some data to a
read-only section, in order to increase safety.

Patch 2 does the same for some int arrays. This helps move about 7 ko of
data to a read-only section. Not that bad!

Patch 3 simplifies code related to clk management. It also fixes an
issue if the driver is unloaded.

Christophe JAILLET (3):
  soc: mediatek: pwrap: Constify struct pmic_wrapper_type
  soc: mediatek: pwrap: Constify some struct int[]
  soc: mediatek: pwrap: Use devm_clk_bulk_get_all_enable()

 drivers/soc/mediatek/mtk-pmic-wrap.c | 118 +++++++--------------------
 1 file changed, 30 insertions(+), 88 deletions(-)

-- 
2.45.2


