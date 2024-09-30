Return-Path: <kernel-janitors+bounces-5674-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D3998A032
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Sep 2024 13:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4611F1C2101D
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Sep 2024 11:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF5318E047;
	Mon, 30 Sep 2024 11:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="ac0e0Z8p"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6750D18D65A;
	Mon, 30 Sep 2024 11:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727695300; cv=none; b=apN51XI5vattk3Fs/JVkJhkPPZRhDg/KMWK9C0t9Sd7r2vLt808X1iZ8MfNpdkSCX5wmoNMfVxqdo57JftvqaSSJZdvh2ac9jqynqa1h+bsvvWEWGitLmpJQuZGAO4oopzC0JakgRnhoO6N5Zn9XXh3G5o/DKP1AEahp6AdIwzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727695300; c=relaxed/simple;
	bh=yrwXYMhNcdpSvv9Au1vvqU3dn3MtTXLa+ROuULXHz/0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n5i3DxOxxJQ5fjYUeiVWcVtj3QAEwm4O8FRzIUNSlHgBSlF46pUdLbIrBxHw2TGcSyeLYeJ3m8TQS9Tyffy3nkCxXL19RALXc6rla4dJGu4GuPLO8c23N8OpDqq0N0bkGQWwimJJblddNkIMLnz1CLE0RD+uLGvCmtV9ytfypts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=ac0e0Z8p; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T9KoJ12hg9BEKb6CRiiTClNpEW1d9Vc9BR62bgsKbdc=;
  b=ac0e0Z8pC5VMsa3ntLCETtuHIlY4x2DK57ebtAWYZnbavwrmBqIfHCN0
   U6p264mXYmAY1Ev5jScmuSLfztg1UEQcAgA1per4+Un1PQL8pEM73u0oP
   xPN1I3Aem7Nb4QEzsEAANkwXvp8aMWsD1/6OHYevLa/ZJFAo10RCYixy4
   I=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,165,1725314400"; 
   d="scan'208";a="185956869"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 13:21:26 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Paul Walmsley <paul@pwsan.com>
Cc: kernel-janitors@vger.kernel.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/35] ARM: OMAP2/3: PRM: Reorganize kerneldoc parameter names
Date: Mon, 30 Sep 2024 13:20:47 +0200
Message-Id: <20240930112121.95324-2-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorganize kerneldoc parameter names to match the parameter
order in the function header.

Problems identified using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 arch/arm/mach-omap2/prm2xxx_3xxx.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-omap2/prm2xxx_3xxx.c b/arch/arm/mach-omap2/prm2xxx_3xxx.c
index d983efac6f4f..d3a912886709 100644
--- a/arch/arm/mach-omap2/prm2xxx_3xxx.c
+++ b/arch/arm/mach-omap2/prm2xxx_3xxx.c
@@ -62,7 +62,6 @@ int omap2_prm_assert_hardreset(u8 shift, u8 part, s16 prm_mod, u16 offset)
 
 /**
  * omap2_prm_deassert_hardreset - deassert a submodule hardreset line and wait
- * @prm_mod: PRM submodule base (e.g. CORE_MOD)
  * @rst_shift: register bit shift corresponding to the reset line to deassert
  * @st_shift: register bit shift for the status of the deasserted submodule
  * @part: PRM partition, not used for OMAP2


