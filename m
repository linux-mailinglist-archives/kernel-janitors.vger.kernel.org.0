Return-Path: <kernel-janitors+bounces-375-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D367F4020
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Nov 2023 09:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9BB7281219
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Nov 2023 08:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1A2168C7;
	Wed, 22 Nov 2023 08:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lW99JIXN"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56AFF93;
	Wed, 22 Nov 2023 00:30:59 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5484ef5e3d2so7052078a12.3;
        Wed, 22 Nov 2023 00:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700641858; x=1701246658; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9Cxvv/xNdpglan51CFkm8Zx1o0cnxsHHNPItVu8HE8=;
        b=lW99JIXNNxmQKukkeLMX27uWojIlPBvXFrLN00e9jybu0reXN6diw36EZaPcEv+y9J
         tTGBXoWuveCHKQMNWU5HJk5ohEr0cykX2jIX5sFeM3DwKHJoBcCOrDPemdlJkOnrlfxC
         ORDDpGIWP/uIldNgmqyjRdN9ZM17NuKnqSrbIYf8JBQrK87RqZQgwTmuAKDlbECGz9D7
         m8GALo9JiwxwakwdqAfSMwqOlLjWthNsqGCaXKRiLS2tu8oZzuvOCI3LZKmvIfep5XAj
         zG/FXtLmwbKur/l3FaukLXBQRsmESHBFNJBUkdgM57DLU/797j1lzTjZkKNA1Yd/7Xqx
         eYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700641858; x=1701246658;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9Cxvv/xNdpglan51CFkm8Zx1o0cnxsHHNPItVu8HE8=;
        b=AwsG8ilBK22bLFikwvf1ajPbUCpSPoHnAyiQOWrYtVYeOXRKOBQbNycfstRRodzupo
         x0RPgHzXBAmphGqsWrCu9sYk8FJPPGN3S/9hs6Al567+bnPt9lTa+Ckg39pbeG83bXSL
         oGIsAYnPaUgI0Z/X3GcRDe2Z6ewYmlD1eUQjjCLPblt77MlbRrc2xrnKQ9WFjwEKRk9l
         FXxSFX5sES8hhCVe6OSqwpwcAXTgKBNlWRh/5GTHirMybKsikTM3KR7gO4kMIu2iUsLZ
         FNHUJldpDWxvE9/CfCogNxNJdZi1rrSMV8kYkHQnOyCfuyT0LHcZwlK3ioWR/gBcqubG
         oQAw==
X-Gm-Message-State: AOJu0Yxw+92AmDOxiAYgp3iUeC88p4Rq9wiYuaKbeTxf68X3NUNeigV9
	e7t1eW0dQeuYhEoercCQDII=
X-Google-Smtp-Source: AGHT+IFWoRYWE5A4j9ODEYXpZWSAF31+BLlh3D5L+QwX+ENESzyPy4VwZ7njPHBaL0AOnHziTVsatw==
X-Received: by 2002:aa7:d603:0:b0:548:636f:398 with SMTP id c3-20020aa7d603000000b00548636f0398mr1206085edr.27.1700641857596;
        Wed, 22 Nov 2023 00:30:57 -0800 (PST)
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:14bb:d13c:65e3:46bf])
        by smtp.gmail.com with ESMTPSA id a12-20020aa7d74c000000b0054918d34fb0sm1008148eds.95.2023.11.22.00.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 00:30:57 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Kalle Valo <kvalo@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	libertas-dev@lists.infradead.org,
	linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] wifi: libertas: fix config name in dependency for SDIO support
Date: Wed, 22 Nov 2023 09:30:47 +0100
Message-Id: <20231122083047.12774-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>

Commit 4b478bf6bdd8 ("wifi: libertas: drop 16-bit PCMCIA support") reworks
the dependencies for config LIBERTAS, and adds alternative dependencies for
USB, SDIO and SPI.

The config option SDIO however does not exist in the kernel tree. It was
probably intended to refer to the config option MMC, which represents
"MMC/SD/SDIO card support" and is used as dependency by various other
drivers that use SDIO.

Fix the dependency to the config option MMC for declaring the requirement
on provision of SDIO support.

Fixes: 4b478bf6bdd8 ("wifi: libertas: drop 16-bit PCMCIA support")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/net/wireless/marvell/libertas/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/libertas/Kconfig b/drivers/net/wireless/marvell/libertas/Kconfig
index 56156a021be3..36b234bc5be8 100644
--- a/drivers/net/wireless/marvell/libertas/Kconfig
+++ b/drivers/net/wireless/marvell/libertas/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config LIBERTAS
 	tristate "Marvell 8xxx Libertas WLAN driver support"
-	depends on USB || SDIO || SPI
+	depends on USB || MMC || SPI
 	depends on CFG80211
 	select LIB80211
 	select FW_LOADER
-- 
2.17.1


