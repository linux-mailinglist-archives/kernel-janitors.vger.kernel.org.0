Return-Path: <kernel-janitors+bounces-366-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4A57F290A
	for <lists+kernel-janitors@lfdr.de>; Tue, 21 Nov 2023 10:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AED841C20ED2
	for <lists+kernel-janitors@lfdr.de>; Tue, 21 Nov 2023 09:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0668A3C063;
	Tue, 21 Nov 2023 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMspfEeN"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6772C91;
	Tue, 21 Nov 2023 01:34:20 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9c773ac9b15so715943466b.2;
        Tue, 21 Nov 2023 01:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700559259; x=1701164059; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNDI2tml0lnfUfgl7iZp/hJjRfB/d2dUmguN0xm4g4k=;
        b=hMspfEeN/DVLRGmW7Gs1WfhLkGGUJwuAEw4MRGE1TNdIPKZ9n8JidpMJt6SBvEo2nF
         k7aQcb0CGz/KJiPiUDu17u+4VMlSh4uQOqnYDs+MHRLq6twmLUMuKhETtPPMYMLHMwh0
         i0n2/C7L04xhL/Sm4rAJ0kBjpajdRvuBzR6O/12fuCmnhRrxMFk6XFBMJnYX4h0q5O+T
         lsnr3Auz61fCyQFU9hTIzVfM0R6ldgJ84XnDha5SnCfTxuiACB8JEBXSn51yvBPnBYaD
         +RG/HPzxoTNYgJqF2L9n2jG/mJSyHT1yJb59wf/W4QZcLriiKMAcpjm2v2D1RU6zCpgd
         qmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700559259; x=1701164059;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNDI2tml0lnfUfgl7iZp/hJjRfB/d2dUmguN0xm4g4k=;
        b=clAW9xz4PI52Tss2z8yCvNNRvZEdnqPkufZr6IPOsA5OfU5JHKNpNBibH9vQAyw625
         jqgEZl7aTg8zJ0vBfMCjVSwDCR6mNgqV5HPR3rXlBw3RQdF/GQNtV9LLlgI9s7Cgh5Zt
         rUCiXCuRA6+UJ4tT9JhI7VI9cRuRfHwgT9tyDlmO/YrU3m15Rok8ZDfo7jmm4VrAL7DR
         rzuiLSApkCI++cgJw+7Zcw8/byjXar18OTAexd7+I/CFgEQifrYu8rv6ewQ/p7clv0O+
         p7xGOl95YEGHeNewfP4lGo5sLftXhFdx8j6C8COxfq5IKLX/fJDRwGXSe2mf/pu+cf+x
         fsvg==
X-Gm-Message-State: AOJu0YxkFjmAU1oxu4wWyEdUl7VmksG2OxYBc+r5YNVqjsbzUBuUec6k
	qgjEIJJYG4yUFlzPwD9RqShyELp7alw=
X-Google-Smtp-Source: AGHT+IEFB5OUsjOJrmMa/0Y56ISYqrbaXLzsECal4MX9XEzf50ZPv0uhgGrqYMaw3fb+jXOjC+wnKA==
X-Received: by 2002:a17:907:c018:b0:9bd:bbc1:1c5f with SMTP id ss24-20020a170907c01800b009bdbbc11c5fmr7988318ejc.35.1700559258692;
        Tue, 21 Nov 2023 01:34:18 -0800 (PST)
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:89e4:e081:c84d:56ab])
        by smtp.gmail.com with ESMTPSA id h19-20020a170906585300b00982a92a849asm5009098ejs.91.2023.11.21.01.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 01:34:18 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: add Marvell MBus driver to Marvell EBU SoCs support
Date: Tue, 21 Nov 2023 10:34:14 +0100
Message-Id: <20231121093414.11926-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>

While doing some code cleanup in drivers/bus/, I noticed that the file
drivers/bus/mvebu-mbus.c has no maintainer.

Although the file has not been touched a lot lately, the git history tells
us that Gregory Clement and Andrew Lunn integrated patches specific to
this driver code. Further, the driver's config depends on config
PLAT_ORION, and the code for this platform is defined in
arch/arm/plat-orion/, which is part of ARM/Marvell Dove/MV78xx0/Orion SOC
support with Gregory and Andrew already being its maintainer.

Add drivers/bus/mvebu-mbus.c to ARM/Marvell Dove/MV78xx0/Orion SOC support.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e9cbf6e353bd..9613c9c3cc97 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2317,6 +2317,7 @@ F:	arch/arm/mach-dove/
 F:	arch/arm/mach-mv78xx0/
 F:	arch/arm/mach-orion5x/
 F:	arch/arm/plat-orion/
+F:	drivers/bus/mvebu-mbus.c
 F:	drivers/soc/dove/
 
 ARM/Marvell Kirkwood and Armada 370, 375, 38x, 39x, XP, 3700, 7K/8K, CN9130 SOC support
-- 
2.17.1


