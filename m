Return-Path: <kernel-janitors+bounces-5009-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C0294E6FC
	for <lists+kernel-janitors@lfdr.de>; Mon, 12 Aug 2024 08:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A8181C21C7E
	for <lists+kernel-janitors@lfdr.de>; Mon, 12 Aug 2024 06:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20DD15DBB7;
	Mon, 12 Aug 2024 06:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QBuT0OHR"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE171537D0
	for <kernel-janitors@vger.kernel.org>; Mon, 12 Aug 2024 06:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723445000; cv=none; b=VyEi2IE5F+hNgqejJpFeR/52gjM5/5bRfbd05vzLVdsAA6sLKRYnIlhSz3xzerjIkLLCifA6BVUEsnfKE1bPcI7AqMqRc4EzAS78QBXipOXu1T0CYAg8G6R58qpxht4jGzR8Cwm380Gt0wfTSSNMLBV9g3qopo9j586jxiOaK5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723445000; c=relaxed/simple;
	bh=y2rTkK36HSBOLJ32CSLLN6vZXBG8wpeB/uPQHcQRFws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A/K9/rjn4hTFUbY1bGjD9Il4rcQ3kJKZo5Qpi7HdK74H3CuMkniPQx4E6n87Rtvg8yWukNQnhKteqHE8XfwBA3HIl4cyVnCabQU2ansLFbnCBOjBznNrXUiFS+FxLTxKaWQKC1zNUnSWNe5r/TG0fUGBmQwe0vB4P4JVLXmINg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QBuT0OHR; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a7b2dbd81e3so493147366b.1
        for <kernel-janitors@vger.kernel.org>; Sun, 11 Aug 2024 23:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723444995; x=1724049795; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lbk1v6Dq8H0stWDfbtbWzC1hgrGf/GYDIFM0FXly8S0=;
        b=QBuT0OHRlUxlwGKjEp+lmA9GZDvHNh+4r+RbW/w/K1Ky/93dXfNSEpCjz+bx9KVCtm
         7qq0SPhP0QZZfnxkZHF8fGxrMoz+wwqRl5C0ekYIp7sHh9q6m0dohp7SVC0nvLfdGSJg
         7vrhT8RGxK1E7VhTRUL9LbK2u3+RGZTY/uTji3lcsaKHtv02IphhS2ninZLhMB9FH5nl
         Wjd83uoGnWvcOQjvBdCraszk47KLSLpSN5GXLKYfENsVd3yDVC50S+Sx3erIt+RD3h2l
         nsGhemR9nUX0NFDcH/3WOc6DVCIoMi0755rD5guvDBfDblscodW806p5z7PCmrmc3Pbw
         bNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723444995; x=1724049795;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lbk1v6Dq8H0stWDfbtbWzC1hgrGf/GYDIFM0FXly8S0=;
        b=WR8M8QSe8i74DmML7+jCOemE3MAlBIwOQ/v6+I8s6Wz7rL9TKngE9wMM7+qdJOquFd
         mFTNwB3FG2XFh/oKdNCEBxSynt9gUJnZQIgyoxnMACILlpAK92uE42CDN9BSp92Pfb6g
         W4jEJZH0QFq6lyhEbtrrnOmoqYnbe58KBSdSr603xxoF3VRjC/IgmMrvtpda9he+ZAJ+
         /OgRHGFU5uR28j5ynTniqvH7R8mv2ZFy7vWLTtBdTv+FSmRSAwnmSSTHCCjF9IAAAWu4
         UxrVE27XFETrbQM1mZOX0l7Bv8EWgWA4l+8d+ZY7huId5n9CrQ19h6GHi7gsmekYtUCD
         U+bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWQdgGo9NDqizJG3uz7sIre3cg+xuq7dEvNcbQ6bpgJCTlMOpGPTavYzhNNpunnpIDQSdUcoaVBe/Bz+aedfpGiEj03oz+BGB462Tku0xm
X-Gm-Message-State: AOJu0YwXpqosr8oaryls+vvXU80Wd+eH11Fzjuk+ahPRyMvwdaVOy1k3
	Q8UMl9JXfmwZGsl5OPT3jPLtjCA7HRTdvJO0I1SkFnQSFw/wV4ohT/BPlyYuSMo=
X-Google-Smtp-Source: AGHT+IHdlRAn61sJCLGJXEbG9EdnA7ugHPcm4jgWJ7ruc9zVraAFTLGMOKHsOinX3VlxmZmUEw8fYg==
X-Received: by 2002:a17:907:ea5:b0:a7a:929f:c0c2 with SMTP id a640c23a62f3a-a80aa65ce8fmr633287066b.51.1723444995569;
        Sun, 11 Aug 2024 23:43:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb24246fsm202385566b.203.2024.08.11.23.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 23:43:15 -0700 (PDT)
Date: Mon, 12 Aug 2024 09:43:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] pwm: lp3943: Fix signedness bug in lp3943_pwm_parse_dt()
Message-ID: <5e74df19-4469-4a10-8b87-e918769a2f9f@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "num_outputs" variable needs to be signed for the error checking for
of_property_count_u32_elems() to work correctly.  If the property is not
present then we're supposed to continue, but in the current code we will
try to allocate negative bytes, which will fail and it returns -ENOMEM.

Fixes: d6a56f3bb650 ("pwm: lp3943: Use of_property_count_u32_elems() to get property length")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pwm/pwm-lp3943.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-lp3943.c b/drivers/pwm/pwm-lp3943.c
index f0e94c9e5956..803ecd6435cc 100644
--- a/drivers/pwm/pwm-lp3943.c
+++ b/drivers/pwm/pwm-lp3943.c
@@ -219,7 +219,7 @@ static int lp3943_pwm_parse_dt(struct device *dev,
 	struct lp3943_pwm_map *pwm_map;
 	enum lp3943_pwm_output *output;
 	int i, err, count = 0;
-	u32 num_outputs;
+	int num_outputs;
 
 	if (!node)
 		return -EINVAL;
-- 
2.43.0


