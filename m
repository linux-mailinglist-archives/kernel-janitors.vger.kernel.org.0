Return-Path: <kernel-janitors+bounces-163-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EE97E1D95
	for <lists+kernel-janitors@lfdr.de>; Mon,  6 Nov 2023 10:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADBFB281489
	for <lists+kernel-janitors@lfdr.de>; Mon,  6 Nov 2023 09:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F73171B4;
	Mon,  6 Nov 2023 09:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHcUx1uk"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F59171A4;
	Mon,  6 Nov 2023 09:54:05 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53CF5B6;
	Mon,  6 Nov 2023 01:54:03 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9d267605ceeso620158166b.2;
        Mon, 06 Nov 2023 01:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699264442; x=1699869242; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otIX8+idMS2A1yjtMOT40Sxj9HPBhYuyJPN9t9t9cSU=;
        b=EHcUx1ukOxbDPHnTrT//Ek7SZ/fyDELBgRjzV41dFnXLrmpgcbf0p5ZuJGixtQ+gwt
         jvXh4dpkB1FROOUo3JSP5Y7KKl7h5P520nnyrKp5dLqUtIxa1KbLvBH2NwXaM6WysXtU
         qB8k+w499eDbMCVHiMNM+NknZGCJg2A/39nWYBAI/mIhSA88EVoEOtPanevZmaFH7ELi
         6t4Sx5Y4BqMg5pV0NS4AuCTEL1D0Tbaeo5/FEN6zx6nOGyNXFA6ZevSH2WcSqih9n7FM
         cXQDGYhCbpSvI8WAuueTk0TQt8FKU8LGMsBGq3prhPMXZeA92i+DbhMifYDQ9R6scAXi
         aTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699264442; x=1699869242;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otIX8+idMS2A1yjtMOT40Sxj9HPBhYuyJPN9t9t9cSU=;
        b=cEs2h+kREJcgEZodifaTVXUwcWp8pXwnSbd57YNK2SOIJ3PrUzOpxnH3A8p2nJSqNy
         NOuWWhg3jJTVDcoK9mkGg1ydyVO2pft0lL30paWfREUf3Qp7Kyoe0qNIrqCI5ACIHd1q
         KmSklb8RfJ+j7eWVxN0q/V/m17CMwkVdWqpgbx3f58NFVMqNpU7tJufCoIHxAvBFPAZX
         ASqn1eMgu+8nHIZAXgeOWaV7i8hli8WsJBYcXJCTM+P9HMYXWtFtc6mag+Xj4yuwzZ5L
         Ucae6tIZyucYr/aiCmiRc9v4KadbYYbGyjM1Kwz1wIgeSndz5DSWGbZw0D7b07EQErZd
         epfQ==
X-Gm-Message-State: AOJu0YwMbdmRYLNS+8GIUPjSTLGvLz/RfwRNrSafnjFZOeAC+8N0hg1I
	VSIujTFFPxsfKJPMqsbfzWU=
X-Google-Smtp-Source: AGHT+IEa/iGSQXVfW4lCHwK5pPS3XxlZeD5ZwgxpdBfFYaqagOnnjZDZjh8ZU9LX+MWw6I95hlcrpQ==
X-Received: by 2002:a17:907:72d6:b0:9b8:e670:657b with SMTP id du22-20020a17090772d600b009b8e670657bmr12498126ejc.64.1699264441587;
        Mon, 06 Nov 2023 01:54:01 -0800 (PST)
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:c1b6:41cb:bf88:2048])
        by smtp.gmail.com with ESMTPSA id h26-20020a1709063c1a00b009b97aa5a3aesm3895568ejg.34.2023.11.06.01.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 01:54:01 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Nik Bune <n2h9z4@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: rectify entry for DIALOG SEMICONDUCTOR DRIVERS
Date: Mon,  6 Nov 2023 10:53:49 +0100
Message-Id: <20231106095349.9564-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>

Commit bd888a4377ae ("dt-bindings: watchdog: da9062-wdt: convert txt to
yaml") converts da9062-wdt.txt to dlg,da9062-watchdog.yaml, but misses to
adjust its reference in MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Repair this file pattern in DIALOG SEMICONDUCTOR DRIVERS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0410322b740a..bd9077b1fd41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6123,7 +6123,7 @@ F:	Documentation/devicetree/bindings/regulator/dlg,da9*.yaml
 F:	Documentation/devicetree/bindings/regulator/dlg,slg51000.yaml
 F:	Documentation/devicetree/bindings/sound/da[79]*.txt
 F:	Documentation/devicetree/bindings/thermal/da90??-thermal.txt
-F:	Documentation/devicetree/bindings/watchdog/da90??-wdt.txt
+F:	Documentation/devicetree/bindings/watchdog/dlg,da90??-watchdog.yaml
 F:	Documentation/hwmon/da90??.rst
 F:	drivers/gpio/gpio-da90??.c
 F:	drivers/hwmon/da90??-hwmon.c
-- 
2.17.1


