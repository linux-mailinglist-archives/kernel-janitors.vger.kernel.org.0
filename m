Return-Path: <kernel-janitors+bounces-4601-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BA392EFB8
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Jul 2024 21:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F8A4B21A7A
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Jul 2024 19:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE3A16F840;
	Thu, 11 Jul 2024 19:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="SZqgLZD2"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from msa.smtpout.orange.fr (smtp-67.smtpout.orange.fr [80.12.242.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F73316F291
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Jul 2024 19:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720726507; cv=none; b=sQrCnIRYNfdVoddbW6mwAFzG4RKQRugXpMLoHPJPJ/rzIkwKnS7e0Gwh6i3c6N73E46Ody2H1dadYiqBF3xKsdlC8BHvdIrZXQLaMhAPPx/qm8Y7IiMxEHRFAAkPFMD3A4PFkMqwnp/G2oE0cwuXDzIYHyDcVU+0ZdyJ3mw5vy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720726507; c=relaxed/simple;
	bh=v71AQWRiys5rJQ4xv9+/2guDlwUCwFTFheOUGFbDVbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c4/0ZgwQo0f8iE8vU4o0/iWdQ4yDB6T/zFf5ubckP04vM3KcPu2JcNIfQwo8Z34HyvcnfHKy2ONGew9bYSUP9kmoXJ2HSe+jbMlRKANJqNXur/f8U65lj9+jly7krjdoLztGXY4JDSd/6XXIvaGXa3GHaOPbpH9cZnoGUWs5tBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=SZqgLZD2; arc=none smtp.client-ip=80.12.242.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.. ([77.131.3.214])
	by smtp.orange.fr with ESMTPA
	id RzZBsCMFrj4pfRzZBsIiR7; Thu, 11 Jul 2024 21:34:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1720726498;
	bh=zXP3sX2ock8JSJD3V0LkyeBJQLuvRqLa/4BAy1nJsH8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=SZqgLZD2K5Whf1JsFaD1Hx/LG/aial+SuQnUKiQqbtrDMVSULcUGttuqBJnUyr6iw
	 sY+Ci+uM7iEuFaB23QEzV5il7gu/sEhSaEYmGiZxe/7vE/AUXWSK5tXuzJq5UTdS2v
	 UMI3Ljg9y9GRW4gy+g+2auZimAQvXqJk1P+dpzQhkVwVuO5UmFdmasxqphitmw6TuB
	 TU8MlVhOTN7aFQQALmAS2l6N8KF1peE3dJc/FqzXDesQS6Y0xFGZ0Y0ZJCo848B3UH
	 YA0kNse3ZP7CeMXkMieJeMTV9RuXoS+4O1HWnzKwplp/q3AqNxf7na6tChIQFjbIVo
	 w9/jkDgmKusnw==
X-ME-Helo: fedora..
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 11 Jul 2024 21:34:58 +0200
X-ME-IP: 77.131.3.214
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/3] phy: cadence: Sierra: Constify some structs
Date: Thu, 11 Jul 2024 21:34:51 +0200
Message-ID: <cover.1720723132.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is just about constification of some structs.

Before:
======
   text	   data	    bss	    dec	    hex	filename
  60489	   4342	     16	  64847	   fd4f	drivers/phy/cadence/phy-cadence-sierra.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  60897	   3878	     16	  64791	   fd17	drivers/phy/cadence/phy-cadence-sierra.o

All patches have been compile tested only.

Christophe JAILLET (3):
  phy: cadence: Sierra: Constify struct cdns_reg_pairs
  phy: cadence: Sierra: Constify struct cdns_sierra_vals
  phy: cadence: Sierra: Constify a u32[]

 drivers/phy/cadence/phy-cadence-sierra.c | 88 ++++++++++++------------
 1 file changed, 44 insertions(+), 44 deletions(-)

-- 
2.45.2


