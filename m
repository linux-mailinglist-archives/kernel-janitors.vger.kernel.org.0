Return-Path: <kernel-janitors+bounces-1199-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B945982A07D
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jan 2024 19:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD0111C227BB
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jan 2024 18:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7884D5BB;
	Wed, 10 Jan 2024 18:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kac6Ecfx"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337134D580
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jan 2024 18:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e4d64a3fbso26902845e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Jan 2024 10:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704912784; x=1705517584; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p8Udsj305jfYXf+ANpLqSmYsA6MVtaE/P0L4mlkgDYI=;
        b=kac6EcfxexHE+TPOY8F6yMMroPMrx4DVbQlE3xgum2G07zKztN2trWbVeDrKdvatph
         3SxyVbGDcmn8lAZ1wFp1snw/E64/sCCxcQpr8s+q9VO4NZfC7Xssh1zFMjqaQEES2pXs
         P7v/xNqS/hqn+EjTM3oMZmhxUL+2lHd+19QdKql/ir3H94Vu2/nNbL/s0dg+Zg5i8YJP
         vqayqO4VhgCVd7LvTHObjXNYv5uuSiaIUFcTP0QpEixSKTNGO+ESqoZchGmf8yEWQT7l
         uDR1k+LEHE2dgp1eVxFgfFYk0ZxYqnBIMhzxEFHXijogsLPbfzvJXZxpgl+D5+Oqp+cu
         mXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704912784; x=1705517584;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p8Udsj305jfYXf+ANpLqSmYsA6MVtaE/P0L4mlkgDYI=;
        b=Aj1B+iwa17J4VgGvk41R6ase5Sq7vvOoqQAK4NVXULJ+10ii6DWFvwkP32hCONoB1e
         SIArTW7H40k1KglfxfLd/Zeg0yDASEPu2aBRLQOB6/a2CDW8Y1ILr+rH77HS25PDlPPy
         RFOjHgiFcgM/YahSPJTG6fgmrhtgPezr/Zn+flsZHPwWgQt3jGY2P9YnI8NKssglJ/lD
         wZuqWJLzGqCrY0Kxt3TVUov/3HwJla7PRonXsVow5tQ5Uu60f1n0Lr33URciY71elLhD
         EtB9abVIg4zlTjJ1alNSh/AWnUHXGq/l/xTVHbMlOWdu2l5To1CC5RwaXUdB+oudWH0z
         Pz/Q==
X-Gm-Message-State: AOJu0Yy7Ju6nKrUMGprznSZYphWoQZHCTR6xhei6TRbaeWipmYTp99uZ
	jJopNAdWyFFHjsBLrekF/MWWgNsXpRx4XEBwvW9XFB3fYsM=
X-Google-Smtp-Source: AGHT+IFMqicPz1t0QvAqV4wJDjMeK/H8oTRRuHT1ganju3XBJ11l6ngH9PTevRnk8K+l3J6EJRTxBg==
X-Received: by 2002:a7b:c8d8:0:b0:40e:555f:12d4 with SMTP id f24-20020a7bc8d8000000b0040e555f12d4mr806449wml.91.1704912784519;
        Wed, 10 Jan 2024 10:53:04 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id n13-20020a05600c500d00b0040e5a0515aesm1183372wmr.14.2024.01.10.10.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 10:53:04 -0800 (PST)
Date: Wed, 10 Jan 2024 21:53:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>, Henry Shi <henryshi2018@gmail.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86: silicom-platform: clean up a check
Message-ID: <0402e613-446a-40d1-b676-0422f6223aa8@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

"value" is either non-zero, or zero.  There isn't a third option.
Delete the unnecessary code.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/silicom-platform.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/silicom-platform.c b/drivers/platform/x86/silicom-platform.c
index 6ce43ccb3112..5cac698bf98d 100644
--- a/drivers/platform/x86/silicom-platform.c
+++ b/drivers/platform/x86/silicom-platform.c
@@ -258,10 +258,8 @@ static void silicom_gpio_set(struct gpio_chip *gc,
 
 	if (value)
 		silicom_mec_port_set(channel, 0);
-	else if (value == 0)
-		silicom_mec_port_set(channel, 1);
 	else
-		pr_err("Wrong argument value: %d\n", value);
+		silicom_mec_port_set(channel, 1);
 }
 
 static int silicom_gpio_direction_output(struct gpio_chip *gc,
-- 
2.43.0


