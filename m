Return-Path: <kernel-janitors+bounces-2403-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF9C898241
	for <lists+kernel-janitors@lfdr.de>; Thu,  4 Apr 2024 09:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B4821F282D7
	for <lists+kernel-janitors@lfdr.de>; Thu,  4 Apr 2024 07:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A425D72F;
	Thu,  4 Apr 2024 07:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zJikKwsA"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BE75A4E0
	for <kernel-janitors@vger.kernel.org>; Thu,  4 Apr 2024 07:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712215904; cv=none; b=JuMW7LJD+0EDel2L0d37nF5PIozNYi9tIWZnBd1wrRlrjgnXUcfgbEAomEFwryidwn+Yb6W9kliBkDDO+H7COxqWje2+E7DO0Z4jrDIDdIbS2PXQomTY35BvTSybjPeFqur1fiFZNvLLuF2783VfbCf6MHukMK9TdQbP77OQBd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712215904; c=relaxed/simple;
	bh=zVyGWF1iveaM9nRdNRBaWoSVHzX2upsrKArTedHzmbM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AvzHZFluFjxhcOxoCC5eXbVtLe5TN0mF74+yXqR+wzjpFeR7I5xBdmKXr5UdS6uaCekfkpiWvLy+6u13mUxSD/kgPrr6dF96WDj9u6iktLzA0K9HyEGuoarHV2/DxunKbwBWn0SnAjiwB3yBSa3X969OLu0J00DAjnAV7yeq2IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zJikKwsA; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d700beb60bso10078641fa.1
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Apr 2024 00:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712215901; x=1712820701; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vu3+4crI0+2uxroxmdzmWagiwHkz9rJOougDEXvD4hk=;
        b=zJikKwsAcweayZ9Lc7v6y4hljX7aC8cNMkOoGzJbKLQfpYNalPAFeRJ/s3uPD8ap1m
         NW+Fm1aHeIUYbnaKU7Uk6VX4OnmPxX4Y3yltC1mXsprtRewDwD5QHxW/shgmIOLi+k0a
         VqvNLcuxFWmydH4ZuCR2PTNb8lqprqESr3azMSru3ls0obEoPmQnD68MHPRqFgaY4FEM
         4KUL304MaPVAR6OM7wlQX71hA9+cHAbdN8o79B9DKQrBG8mZoZptW0po1ek2W0i5bd1A
         jJyn7PJh7O8AgYStNRHBdHcKuFSsGmXBox+ek5SLLgEfJ/FjrO2Q5OVzsgV2EZx0tWgb
         kZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712215901; x=1712820701;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vu3+4crI0+2uxroxmdzmWagiwHkz9rJOougDEXvD4hk=;
        b=BgZ7hAi0GQtt2VWVJil9pkwF3PHHoE2ZCPl7SeaZ2zEl1B6Y5LAuGpEcStyHt6ggC1
         p/qkrG36seLxENIDDFJqJjPIYkw4MhxhEnX85FsNg4EOwFTakS6JbyakUzH/Tk2mVOkm
         yaVZ7LERiA03BWlsop9qK5LGiUdXFuUg1BrENciO0y+79dqJXwd+VK/gBbt6Rfy1ZMRG
         ApiiTZh4BcSIRpwQqPaBwnAcVranNdCrQZQtsdAcQwoTzQq+cG8Ou4F8WW7wNaNHKDT/
         TDVWtXsUtfugsXLtg/eKA0CFS2jvdMyxJ+SYZqHHA2DeAa3BC/8AwY1U0gN4E5rTct3p
         AX3A==
X-Forwarded-Encrypted: i=1; AJvYcCWI8yeloPxXb48BycUf6M81qwM001OCpwGBVzgF6RKsOLMhDqdyq4WnofE0geCsCDWdNlUQThqB2ODMw7CXQmSBc8n7yu/XSw0uH5VcItX/
X-Gm-Message-State: AOJu0Yz7O+oBnnVBZ/KZWCoL9qRe0fzyOj7KNEYSNWovzHHuEQfYmPb3
	tHQ+NhBtdRaXpmGRvjIKjAu0LwzfnL0UOWhaY5B6ZmzIJXtUnG5jB1QEC6NkBlY=
X-Google-Smtp-Source: AGHT+IGiE75e3sow3qx8AU7LvCSgmcUGI1nvrGeSu7KhuHffLa4dHJlju06ThA2DLfKY1Ea1b1TWvA==
X-Received: by 2002:a2e:b04c:0:b0:2d8:41c5:ad64 with SMTP id d12-20020a2eb04c000000b002d841c5ad64mr1540458ljl.13.1712215900612;
        Thu, 04 Apr 2024 00:31:40 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u14-20020a170906780e00b00a46c8dbd5e4sm8625495ejm.7.2024.04.04.00.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 00:31:40 -0700 (PDT)
Date: Thu, 4 Apr 2024 10:31:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dumitru Ceclan <mitrutzceclan@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Michael Walle <michael@walle.cc>, Andy Shevchenko <andy@kernel.org>,
	Nuno Sa <nuno.sa@analog.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] iio: adc: ad7173: Fix ! vs ~ typo in ad7173_sel_clk()
Message-ID: <5401c681-c4aa-4fab-8c8c-8f0a379e2687@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This was obviously supposed to be a bitwise negate instead of logical.

Fixes: 76a1e6a42802 ("iio: adc: ad7173: add AD7173 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/iio/adc/ad7173.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ad7173.c b/drivers/iio/adc/ad7173.c
index 4ff6ce46b02c..b1d6ea17ced3 100644
--- a/drivers/iio/adc/ad7173.c
+++ b/drivers/iio/adc/ad7173.c
@@ -835,7 +835,7 @@ static unsigned long ad7173_sel_clk(struct ad7173_state *st,
 {
 	int ret;
 
-	st->adc_mode &= !AD7173_ADC_MODE_CLOCKSEL_MASK;
+	st->adc_mode &= ~AD7173_ADC_MODE_CLOCKSEL_MASK;
 	st->adc_mode |= FIELD_PREP(AD7173_ADC_MODE_CLOCKSEL_MASK, clk_sel);
 	ret = ad_sd_write_reg(&st->sd, AD7173_REG_ADC_MODE, 0x2, st->adc_mode);
 
-- 
2.43.0


