Return-Path: <kernel-janitors+bounces-293-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D5C7EC0E6
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 Nov 2023 11:44:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F7B31C2093A
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 Nov 2023 10:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEECC14F76;
	Wed, 15 Nov 2023 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpY7ScT5"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8AA14F60
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Nov 2023 10:44:40 +0000 (UTC)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF574109;
	Wed, 15 Nov 2023 02:44:38 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5441305cbd1so10148114a12.2;
        Wed, 15 Nov 2023 02:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700045077; x=1700649877; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbzuiJQ2vBegQA7voMECslTs5KDNKkKwd7ZxQs3+i5k=;
        b=RpY7ScT5lHA50+KIeOZf2uZXViIB/K4IDLSTkLT5Fw/9jhUVnf8LgakdmgT8NoHOBV
         YpSZEOfwyHXnDeCzU4VxThbNz9AQ1dM4NqMPYSrryTCyARq9h/Nvnet4LRb0bWpo8PSz
         cI6YHPDMyl5pLuyz14tPSZXw5qA5CO5RIT0V761mUaHIQSO2ZS9KhjupBExpq8NPXqux
         1T2YGIDgJIPqKFCh16xCBjR2D8m0klT6MaXL9mmTFKjOKUfGoOoc1zNDk5HBebSgcMzi
         HKyYVH3C7iNyVFWo8g3RBM0VzBAEzQqKjZTYc9hqt/Wicd8A7VJ0GZ3PW2GM1JBx13SY
         dv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700045077; x=1700649877;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbzuiJQ2vBegQA7voMECslTs5KDNKkKwd7ZxQs3+i5k=;
        b=K9DvB7urmw4nEnh1xiE2KAUFSbbaZcw6StwsUd9NiLDCOmGTBroHXJ9nrVR5U+jzEw
         ppJiq1J+bykD3TLojeEydF3TMDhjGt8s7yT2FsqagaQ5mp4By1B/BD2k8r/lEFyaj/Hb
         hkKWLQ/Bb8/TbK21ZteDL5PnBY9kaFJW3GpEC75BSeFRMkLVErHXTDuI12dHbWX4Ifkz
         JViRnqs6RW0oA833RUZzDAf9KF8qFCyuF33fH6oscPM6IPPzA0UmfBva5hgzj6tT/PtM
         kOf5c0QqpD1yGzdaQ02I3Lc6C9CLYF/zu5BLo4bgGHfH3YoIqIvI1kpIMUIPIX04Em1c
         prRQ==
X-Gm-Message-State: AOJu0Yz/9/TFM/kfT1n2HbwU3lX3+eDAvNQZh9seU7WwUZFw1J+VqIsw
	sbg1UJ5m9R50EszfJhqteoo=
X-Google-Smtp-Source: AGHT+IGoKYeYQ6VqydJ9DHVBCeRFwf/5TrkJAz59XZJNk/mqUrOM6/C5VjmJA5IM2b4Q5cpJvDiByA==
X-Received: by 2002:a05:6402:1052:b0:543:535f:cc74 with SMTP id e18-20020a056402105200b00543535fcc74mr8252049edu.3.1700045077059;
        Wed, 15 Nov 2023 02:44:37 -0800 (PST)
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:999:a30e:2872:ffae])
        by smtp.gmail.com with ESMTPSA id l18-20020a50d6d2000000b00542db304680sm6470010edj.63.2023.11.15.02.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 02:44:36 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: add omap bus drivers to OMAP2+ SUPPORT
Date: Wed, 15 Nov 2023 11:44:34 +0100
Message-Id: <20231115104434.25796-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>

While doing some code cleanup in drivers/bus/, I noticed that the files
drivers/bus/omap*.[ch] have no maintainer.

As far as I see from the git history, important changes to those files went
through Tony Lindgren. Further, the inclusion of those drivers depend on
the config ARCH_OMAP2PLUS being enabled. This suggests these drivers are
part of the section OMAP2+ SUPPORT.

Add the omap bus drivers to OMAP2+ SUPPORT.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 973568cae9e5..e829dbac1e99 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15850,6 +15850,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git
 F:	Documentation/devicetree/bindings/arm/ti/omap.yaml
 F:	arch/arm/configs/omap2plus_defconfig
 F:	arch/arm/mach-omap2/
+F:	drivers/bus/omap*.[ch]
 F:	drivers/bus/ti-sysc.c
 F:	drivers/gpio/gpio-tps65219.c
 F:	drivers/i2c/busses/i2c-omap.c
-- 
2.17.1


