Return-Path: <kernel-janitors+bounces-362-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF7A7F27FD
	for <lists+kernel-janitors@lfdr.de>; Tue, 21 Nov 2023 09:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE104B21A51
	for <lists+kernel-janitors@lfdr.de>; Tue, 21 Nov 2023 08:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DE52030B;
	Tue, 21 Nov 2023 08:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUJ5jZ9R"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0914798;
	Tue, 21 Nov 2023 00:50:29 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a02cc476581so11251666b.2;
        Tue, 21 Nov 2023 00:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700556627; x=1701161427; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gigJhbu1RBbfDnPRz/WOB2krMYU4CP9DB+n9YVBFJRE=;
        b=AUJ5jZ9Rgxoof2mjOnD48K/vSv1RQz6PWudxgUXT7WYysqIa51hTOQ9ML7BxODFllV
         EblwM/OJ1p1atsaO1qIlh4jspkxHwWZlxEUGJu9t6RLqsq7B7Mwf9kIYrWlypRh9Q9OO
         kSgEZpSbRnL/SwgXrhkQ0ydMhPxRfAziNkigSPMKs44eeBfWcaqtZo/w4IlNaG6TFPgS
         Sy+p5ByvGW/NRHHUoVw1POkvz3TgmEw1Fh69w7apJkoT6qnoYjYHWwY12I0EtxfkyLkc
         Lr9piSq8Mee5C+Uoaz4z/9+mHzwUPsZy1mkaQm0+L0miDKDz5bXS8tMYsAjH5ivNw31k
         o7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700556627; x=1701161427;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gigJhbu1RBbfDnPRz/WOB2krMYU4CP9DB+n9YVBFJRE=;
        b=C3NAmBSMqjDUSKSpxAUn52hLLVShf0CE8f/tzw25bByqlAlw20Fy1tBrj76VuoY631
         iZP1eKXHiDbv3Aw7rS0PyBv3v01zRfIxfU41523lh14bitMvLEQeNJS07u8hr/PbZxGW
         zNaBhwWcbVW6vA/1uuZTBGL8xAoz8P/WoLQw7mezXEBIscGpY7fmvOz4u32gQXAZPCLY
         7NwOgVQlWskgMUQji+bbL4xXnZhf7BmiukyEFWOEDfccWtvkTbAgqWxYPHWYBQL7gA4L
         OfeWexFPO636Fsik3oRDeFj+QUn9H9rqAykYiJjV3u/HFY5qox891AI5ejjroQ4nlz9f
         /tzQ==
X-Gm-Message-State: AOJu0Yxi3cHsngbDaImMhyT/1M4L1IslM/T6L8usZje5qI8lT6ZD/PQB
	A5cNUhgzmWT/RjpaYrYsiWQ=
X-Google-Smtp-Source: AGHT+IGaD3xVLwIY2ZR4mVGlw4BvvySHfRczvtSQsM/AjRWbOnYltlJpUede9LlM85LFL4vZ1Xs1DA==
X-Received: by 2002:a17:907:a705:b0:9da:f391:409a with SMTP id vw5-20020a170907a70500b009daf391409amr8694842ejc.26.1700556627191;
        Tue, 21 Nov 2023 00:50:27 -0800 (PST)
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:89e4:e081:c84d:56ab])
        by smtp.gmail.com with ESMTPSA id w17-20020a170906481100b009fc576e26e6sm2937452ejq.80.2023.11.21.00.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 00:50:26 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: add TI da8xx bus driver to TI DAVINCI MACHINE SUPPORT
Date: Tue, 21 Nov 2023 09:50:24 +0100
Message-Id: <20231121085024.15955-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>

While doing some code cleanup in drivers/bus/, I noticed that the file
drivers/bus/da8xx-mstpri.c has no maintainer.

Although the file has not been touched a lot lately, the git history tells
us that Bartosz Golaszewski is the main author. Further, the driver's
config depends on config ARCH_DAVINCI_DA8XX, and that is defined in
arch/arm/mach-davinci/, which is part of TI DAVINCI MACHINE SUPPORT with
Bartosz already being its maintainer.

Add drivers/bus/da8xx-mstpri.c to TI DAVINCI MACHINE SUPPORT.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e829dbac1e99..e9cbf6e353bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21707,6 +21707,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
 F:	Documentation/devicetree/bindings/i2c/i2c-davinci.txt
 F:	arch/arm/boot/dts/ti/davinci/
 F:	arch/arm/mach-davinci/
+F:	drivers/bus/da8xx-mstpri.c
 F:	drivers/i2c/busses/i2c-davinci.c
 
 TI DAVINCI SERIES CLOCK DRIVER
-- 
2.17.1


