Return-Path: <kernel-janitors+bounces-4583-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2EA92EDD9
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Jul 2024 19:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55F10283B9F
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Jul 2024 17:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585CE42AB5;
	Thu, 11 Jul 2024 17:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="RKGfCXy+"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB94747F7F
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Jul 2024 17:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720719084; cv=none; b=QNuYN/bq6hZNoWF3Fnpbt0rWuCJTBxrVcjNoAakjvbJ4Z6zLQUE3MsFFkLj94Tr0D9xmY2zBU3c5YCaseImTOtIQx8PKJQLFcSAoWG76n5ro3elRmwyFa/UkpVRG2OatygvZP7DFxXn7qbI6H2jHZxBghFy2qlA1Vfs32kDwiuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720719084; c=relaxed/simple;
	bh=i5M/KkEe+fepdyPiWkDJhqjuHP7yldYG6MEfdBmuf1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oRh4a+R77J+5pzXSyCYyBW6T179HVoTekKUTUovvTrKu1TjH0adBMUk5ItTQ0TdS+AomCbJ/ueGtpC1DUJxvQgxoz+TS1t4mh1ks+TNLIa/9NBtlCaBhs5KIec4OlopT/CP5Kz4qQRxxrfPNKRO+CRLZtD0RdcSdKGjBAU4fv3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=RKGfCXy+; arc=none smtp.client-ip=80.12.242.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id RxdPsAr1uHTrpRxdQsVLWC; Thu, 11 Jul 2024 19:31:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1720719073;
	bh=RRQXTK+lQmAsyj99iqPHXhZaL0F3tchaEGasoQcNsJg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=RKGfCXy+SgyVVuegeHXFR9X/K4vy2r5C/OqqhX1Jt7URhz/8Wl8GE4CJClVkmOfag
	 JdcvlzDivjhY5PnmQ86winemWbm3hV7D09j+2d91kFXbtKtbfwUFdHpEDobvFNM3P4
	 RzntG9QMIbD5vNpdHaU3ylw6ITkrkZ/a0lOcPlk5Aw5qTaArCkF4fF+dVpxzB5FII4
	 AKGbV5hg1xJRgMrjeTg0R04QvxcjVHypXVxYs9AxjKAig3EqAXePBWgjUyx3OeOtCc
	 QiDYwnivWHW8N/S5CkkmmWJgmMINyYAiu6GxR50Ar9+fF3AAZiy/QFdncjhSxCHL3K
	 XcUVp9P5XV5Bg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 11 Jul 2024 19:31:13 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/4] phy: cadence-torrent: Constify struct cdns_reg_pairs
Date: Thu, 11 Jul 2024 19:31:05 +0200
Message-ID: <cover.1720718240.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is just abour constification of some structs.

It turns about 15 ko of data in ro section:

Before:
======
   text	   data	    bss	    dec	    hex	filename
  78154	  20222	     16	  98392	  18058	drivers/phy/cadence/phy-cadence-torrent.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  93606	   4790	     16	  98412	  1806c	drivers/phy/cadence/phy-cadence-torrent.o

All patches have been compile tested only.

Christophe JAILLET (4):
  phy: cadence-torrent: Constify struct cdns_reg_pairs
  phy: cadence-torrent: Constify struct cdns_torrent_vals_entry
  phy: cadence-torrent: Constify struct cdns_torrent_vals
  phy: cadence-torrent: Constify a u32[]

 drivers/phy/cadence/phy-cadence-torrent.c | 376 +++++++++++-----------
 1 file changed, 188 insertions(+), 188 deletions(-)

-- 
2.45.2


