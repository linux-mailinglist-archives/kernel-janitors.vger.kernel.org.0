Return-Path: <kernel-janitors+bounces-198-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0508C7E7A05
	for <lists+kernel-janitors@lfdr.de>; Fri, 10 Nov 2023 09:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 359A11C20CFC
	for <lists+kernel-janitors@lfdr.de>; Fri, 10 Nov 2023 08:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F473CA44;
	Fri, 10 Nov 2023 08:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0lL4BMs"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699F8D27B
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Nov 2023 08:19:20 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C8693D9;
	Fri, 10 Nov 2023 00:19:18 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9d10f94f70bso291067766b.3;
        Fri, 10 Nov 2023 00:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699604357; x=1700209157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qx1Z0ES+LIHr7AN7W9XAr27O+pEgi0rCLwQKZbW2VIQ=;
        b=a0lL4BMsBhIKNoAGMLLej8uIHbOHEnN8o+014vYLCVzJkvgew+gzm8FH2urIcq2f5R
         yWQRGHqrhS01UJQ7n3kzhKEhMuTIgKu2iM+sIZequRIbTH7ulTFxQgJqlLeqStUZMttu
         ISkPfvus4pGolDa8XhyIZydmNrVJmFdMNaAMgFhB6C3yw0HU/NxA90dSUsLizwzh7L3C
         TYBER44JGxIlb2Lnen/Po3WS9VtPj6xX3230/lPWsByLhsKEjRRVXbHY7zRCvmW8SeW6
         LspqcxKnd7UYIA6wQwwUfoUMDKH59XZaeHs6gxmmKKVOVQiNhZL6Vj4t4erKteM3ZX+n
         8MCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699604357; x=1700209157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qx1Z0ES+LIHr7AN7W9XAr27O+pEgi0rCLwQKZbW2VIQ=;
        b=Xn0MS25C8leqO8bV/PyRg60wd3Lnq3YOwxQsActZJKYFa8apY0lMdCbGHAsj/1C/Ju
         Xo1oDbhye7y+yLXJWeYonyLZIugOElO633p5356yD+lakwrO1Sqn8ZvyugSGCzHyvnv+
         nsjF1EkuYBo33qJXa7K2lkId8bxA3L80Nem8c476WiWoRnjRTDOC1LeekoqawJPYKBLu
         MNmcgQ7lPRwdGWfj7EpacHyOHw44YSmJV7QkdVAbo8rgtbXCnIEy8D1cOCAwbkzVb5fn
         AEp9003myK28xwNRvP6b7oM0nW2eNlpKVdsO89tK2FzQKKU56ArtHO/9SGdmvewplTjf
         wi8w==
X-Gm-Message-State: AOJu0Yw8CnH9mo3wCKQ9VbEKkPhZlYu4Udb+m/VPJYbbalquvCHLjIx7
	avrlGtCoqSNnS7GTiT2zPHA=
X-Google-Smtp-Source: AGHT+IGAAojuFpdOwjAGUkWo1zK324czv9t6UG3MKsHY77tFbWHfp7zadrvwIayeBw7sAOGQZ38Enw==
X-Received: by 2002:a17:907:7f1e:b0:9d5:ecf9:e6a0 with SMTP id qf30-20020a1709077f1e00b009d5ecf9e6a0mr5013918ejc.0.1699604356581;
        Fri, 10 Nov 2023 00:19:16 -0800 (PST)
Received: from localhost (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f4-20020a170906048400b00988e953a586sm3579473eja.61.2023.11.10.00.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 00:19:16 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 1/2] pwm: samsung: Fix a bit test in pwm_samsung_resume()
Date: Fri, 10 Nov 2023 09:19:11 +0100
Message-ID: <169960433795.472342.2881020171032605853.b4-ty@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <e031db45-add0-4da7-97fa-dee95ee936ad@moroto.mountain>
References: <e031db45-add0-4da7-97fa-dee95ee936ad@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 25 Oct 2023 14:57:34 +0300, Dan Carpenter wrote:
> The PWMF_REQUESTED enum is supposed to be used with test_bit() and not
> used as in a bitwise AND.  In this specific code the flag will never be
> set so the function is effectively a no-op.
> 
> 

Applied, thanks!

[1/2] pwm: samsung: Fix a bit test in pwm_samsung_resume()
      commit: 7d3c568084f8be53f7f59802d625fa69bc7f8d07
[2/2] pwm: Fix double shift bug
      commit: 830743dcf301141b4723ae38cf7d7fca566b9c75

Best regards,
-- 
Thierry Reding <thierry.reding@gmail.com>

