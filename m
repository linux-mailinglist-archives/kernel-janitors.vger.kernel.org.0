Return-Path: <kernel-janitors+bounces-4935-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AA894A44E
	for <lists+kernel-janitors@lfdr.de>; Wed,  7 Aug 2024 11:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AFF8281E60
	for <lists+kernel-janitors@lfdr.de>; Wed,  7 Aug 2024 09:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1412C1D0DEB;
	Wed,  7 Aug 2024 09:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="a5qUT5lD"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF551AE87B
	for <kernel-janitors@vger.kernel.org>; Wed,  7 Aug 2024 09:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723023080; cv=none; b=SWS7H6vj+MfaJ50qaCTHwkUePHG/oFTnS/jHvGeXe7f//Xz7WDsS/fRhRxrH4eH1UNYd6q+gtQQDCr2LJqq/q8kVqC9r5OXMSuLkJWn9pxPZGHYct2iYNsqvSADCjdcG9vG/vUVvBCg+yi42pPM8nBVH5WV5CjWDYHqag+LQtvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723023080; c=relaxed/simple;
	bh=5tPWi08O5qzNfmwk5NjD9LrsMpBYwEvC/I+o1C/aDUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SNzUrDK8xCw5NUHCtiq1t4mf9s2VLxjD32Vd1O5Qlgx6JcdvWtgCRZN9klFRByAYFjvGXZ1G3emQiGHk5ZNQwAmaGArlA+IzIDoYH9mz+AFxpLXcOzSR2KlG3ReVZAkmTDH820fgr+fC8ELbcYTMPh+3I7Z3xSyWbxl+LD5k7bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=a5qUT5lD; arc=none smtp.client-ip=80.12.242.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id bd0dsp4BgEfqMbd0dsKOjo; Wed, 07 Aug 2024 11:31:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1723023068;
	bh=2qDpc338vFqtRKWlFJJWiHrZKzxO9fZfTIrYjI9ogs4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=a5qUT5lDdKymjqBOdI/vLqm1Z1CwtzAfHwkQ3nhOaGVORDnH+eSSynlNTrpH5yQN6
	 mClMWt1l2e70ZaoEUP6hsdtHpfyygX3SA3jJndvEOiRat8EWn+wlicqc67P3zFC6uM
	 /UA8zVl20HNeHkqFaL56mZVas2HFuR+qZBkwxtwJGA5fxCDwuHe++h/kUnvYqaTM+C
	 0O6k9INFiyhAzMe5X7dy4Bf1XXOsNr5XDCSn4tGSlXKBEZHzpI7FUQSqikBsDlJMGQ
	 /X+qCpabcVQ1V4ka495o4/mEO7kTfidjVBgnojXu+49WKlAEC3R5Htw/XMCakTllzn
	 VwTmW+jj1U//Q==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 07 Aug 2024 11:31:08 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: linus.walleij@linaro.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/3] pinctrl: meson: Constify some structure
Date: Wed,  7 Aug 2024 11:30:54 +0200
Message-ID: <cover.1723022467.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These 3 patches constify some structures in order to move some data to a
read-only section, so increase overall security.

It is splitted in 3 to ease review.
Patch 1: struct meson_pmx_group and meson_pmx_func
patch 2: struct meson_bank
patch 3: struct meson_pmx_bank

All patches are only compile tested.

In order to compile them, I update Kconfig to add some "| COMPILE_TEST"
on depends line.
Should it be useful, I can send a patch to add it, but I don't think it
would be that useful.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  10818	  11696	      0	  22514	   57f2	drivers/pinctrl/meson/pinctrl-amlogic-c3.o
  17198	  17680	      0	  34878	   883e	drivers/pinctrl/meson/pinctrl-amlogic-t7.o
  14161	  11200	      0	  25361	   6311	drivers/pinctrl/meson/pinctrl-meson8b.o
  17348	  12512	      0	  29860	   74a4	drivers/pinctrl/meson/pinctrl-meson8.o
   3070	    324	      0	   3394	    d42	drivers/pinctrl/meson/pinctrl-meson8-pmx.o
   9317	   9648	      0	  18965	   4a15	drivers/pinctrl/meson/pinctrl-meson-a1.o
  12115	  11664	      0	  23779	   5ce3	drivers/pinctrl/meson/pinctrl-meson-axg.o
   2470	    120	      0	   2590	    a1e	drivers/pinctrl/meson/pinctrl-meson-axg-pmx.o
  15125	  15224	      0	  30349	   768d	drivers/pinctrl/meson/pinctrl-meson-g12a.o
  13800	  10160	      0	  23960	   5d98	drivers/pinctrl/meson/pinctrl-meson-gxbb.o
  13040	   9648	      0	  22688	   58a0	drivers/pinctrl/meson/pinctrl-meson-gxl.o
  20507	   1132	     48	  21687	   54b7	drivers/pinctrl/meson/pinctrl-meson.o
  12212	  12880	      0	  25092	   6204	drivers/pinctrl/meson/pinctrl-meson-s4.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  22114	    384	      0	  22498	   57e2	drivers/pinctrl/meson/pinctrl-amlogic-c3.o
  34510	    384	      0	  34894	   884e	drivers/pinctrl/meson/pinctrl-amlogic-t7.o
  24945	    440	      0	  25385	   6329	drivers/pinctrl/meson/pinctrl-meson8b.o
  29412	    440	      0	  29852	   749c	drivers/pinctrl/meson/pinctrl-meson8.o
   3070	    324	      0	   3394	    d42	drivers/pinctrl/meson/pinctrl-meson8-pmx.o
  18597	    384	      0	  18981	   4a25	drivers/pinctrl/meson/pinctrl-meson-a1.o
  23315	    496	      0	  23811	   5d03	drivers/pinctrl/meson/pinctrl-meson-axg.o
   2470	    120	      0	   2590	    a1e	drivers/pinctrl/meson/pinctrl-meson-axg-pmx.o
  29877	    504	      0	  30381	   76ad	drivers/pinctrl/meson/pinctrl-meson-g12a.o
  23496	    456	      0	  23952	   5d90	drivers/pinctrl/meson/pinctrl-meson-gxbb.o
  22224	    456	      0	  22680	   5898	drivers/pinctrl/meson/pinctrl-meson-gxl.o
  20507	   1132	     48	  21687	   54b7	drivers/pinctrl/meson/pinctrl-meson.o
  24692	    384	      0	  25076	   61f4	drivers/pinctrl/meson/pinctrl-meson-s4.o

Christophe JAILLET (3):
  pinctrl: meson: Constify struct meson_pmx_group and meson_pmx_func
  pinctrl: meson: Constify struct meson_bank
  pinctrl: meson: Constify struct meson_pmx_bank

 drivers/pinctrl/meson/pinctrl-amlogic-c3.c    |  8 +++---
 drivers/pinctrl/meson/pinctrl-amlogic-t7.c    |  8 +++---
 drivers/pinctrl/meson/pinctrl-meson-a1.c      |  8 +++---
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c | 12 ++++-----
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h |  2 +-
 drivers/pinctrl/meson/pinctrl-meson-axg.c     | 16 ++++++------
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    | 16 ++++++------
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c    | 12 ++++-----
 drivers/pinctrl/meson/pinctrl-meson-gxl.c     | 12 ++++-----
 drivers/pinctrl/meson/pinctrl-meson-s4.c      |  8 +++---
 drivers/pinctrl/meson/pinctrl-meson.c         | 25 ++++++++++---------
 drivers/pinctrl/meson/pinctrl-meson.h         |  6 ++---
 drivers/pinctrl/meson/pinctrl-meson8-pmx.c    |  6 ++---
 drivers/pinctrl/meson/pinctrl-meson8.c        | 12 ++++-----
 drivers/pinctrl/meson/pinctrl-meson8b.c       | 12 ++++-----
 15 files changed, 82 insertions(+), 81 deletions(-)

-- 
2.45.2


