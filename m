Return-Path: <kernel-janitors+bounces-8870-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18369B1DB19
	for <lists+kernel-janitors@lfdr.de>; Thu,  7 Aug 2025 17:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C180C18C319D
	for <lists+kernel-janitors@lfdr.de>; Thu,  7 Aug 2025 15:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8012F26B767;
	Thu,  7 Aug 2025 15:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VK9ocNyl"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6A1265298
	for <kernel-janitors@vger.kernel.org>; Thu,  7 Aug 2025 15:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754582107; cv=none; b=FelPXB6xdRhAjih9fJTSh0O/FLk5b1D8gn85huaLLEu8LNAWgJZZh7tD8I34liPMTcVUSTLUhRmY264jLpWwQm+vYNk8Am2v7bae9v94ndAz+CGZlAVwWy/0uxMq8T2xP/pc8cL49+e1ajqAljiWrDWHZ6WJZChTJ3PaZGagfpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754582107; c=relaxed/simple;
	bh=SQqxK/HCej6ZDpPKgE3mF20MElkN0tQ4FKvSHtMcEcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s4bOXUMQoIuUlatX2OR6ziSei+0zkp9nAVNMeULtk/rzGbEt0UK6sWrgDVV8li0HgGlKKe6f/NifuNk9zmr+lZKjTn4Fi9/UqRTC8RxysNTs6KfFc08pLC9fH6QJLIZuUUj9vNEG8AZWvZdPSI+uKiLiaxj9FHEznHjb5+Nx53k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VK9ocNyl; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b78d13bf10so1161431f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Aug 2025 08:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754582104; x=1755186904; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VxONtqpEzsy4ybhTdJqv60dbpH7hpRv1LR4+l1PPyfE=;
        b=VK9ocNylvoLr9S9lNJgu38/c0uAQXlbA1LxjW+qSghoeFw5XPtLFKvn28nISMj8OjJ
         HWYXwAdK0mhBgLuLb2/NC2+/A8+/9hfd14ALmHefQJLTjUrocAOKnrnSBJD/98r7PzVg
         4BEwf7emMvMCaTRt9/QUHEaAMHWeU31nSRWarBknfmKDu/fMHMaVroJdMl+HZsgleTbb
         deXq1PVAzb0U7Aow2MdMSy2rnzGc3imL8hzrf1uztzkRxkDqCGppaJfyOzTvmReBYZE+
         Hz0803TfF/05q+JC0h+eZIF+NNT4lSlgQGgh9IL2CjutG5i457Q17zcP69hSMWnHXx71
         DUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754582104; x=1755186904;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxONtqpEzsy4ybhTdJqv60dbpH7hpRv1LR4+l1PPyfE=;
        b=tyFHXidcwlHjFW5tQb1nMGsiFhIJy671Xeze28MiOfpkezwGLQVlt/s2NpbpzA2JwN
         jK2VfJuyLCcT48wQOlcUOQGodhPNP1N5lWCQ19j4ErauqVDPT3TevlrcsFePjfZds6E4
         0ctql/JOV6qktkYDaoMzKg9wiTlwjM0zz287pETkx16TQPV5KWf9M1sJEFk/N1az7iaj
         /XI5GOwUh529ODBZzelksXlLRNakuP57XbFVp03zcaLBC3Kv9crWrT51etYFfqAjJfme
         cVyzu7vb08XUjKkCmi1dKHt/AIpTT00Wnvt3MfrmqBP8Oxg7E8a4cHEyu9yls74Yw8ca
         AATA==
X-Forwarded-Encrypted: i=1; AJvYcCUkywCej0uSCbrVZKgOMcYjCgHb3gZXIVcalan8F3g+Rc85wEcQGWd10xqzfz01I/NfS9jvJkU1XgzATensEyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxwiMQJqdf1NrFQZsL7LAWnqjWOD6x0D9xa8eEgaX9DpUtMbRW
	uxhLCa8HwVBvdw7Ii6DJA5iy+o2Le3s9JrXkygvs1ugRHQ7XHNFFn63IwmnGVuqdUhw=
X-Gm-Gg: ASbGncuhLl4EcBox4FEr49NmVm4qDmYPF1DDMjRhmaj2rGyu0m/c8GQTq5zvotHbZpC
	E/yWcOxSB3XvH20Q/0veC1qgErvs7pdn0qS0CqX6JcPri/DgolGgAUdo0uEUAWbGCG2PyjTDAYG
	r6kTgaOggxm9nV4b40ft3dP0jFVPLgyX6TifB6hNTewCwuQmITq6YJ1j+EwcG9rWjjRdzXf1/7F
	viPDlZN9ziqoooT17S3VjPhvnbod8SBncWOZv0lRclcXUGwgvKuwMyZck0iW1uNfEntORUG8NT9
	y8nIoWVepWa3cpP+zo6ooDgF0i0bLpWvLAzon4lt+1b59qpTlmUF186nowZxic4iS/NEMK68tGf
	t1NtPsddp4Y0JyUQQpxh7qUbFjdw=
X-Google-Smtp-Source: AGHT+IFSsIoqsVrOVwk5VqvA/2SIH6BZKHjU96VbI5Tfhan7NUjhqokIhx4f7tecjAIif5yQbhliEw==
X-Received: by 2002:a05:6000:25c5:b0:3b8:d22d:a8ad with SMTP id ffacd0b85a97d-3b8f415a367mr7225532f8f.3.1754582104349;
        Thu, 07 Aug 2025 08:55:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458bbf91b69sm124250855e9.3.2025.08.07.08.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 08:55:03 -0700 (PDT)
Date: Thu, 7 Aug 2025 18:55:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Mosberger-Tang <davidm@egauge.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Stein <alexander.stein@mailbox.org>,
	Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: host: max3421-hcd: Fix error pointer dereference in
 probe cleanup
Message-ID: <aJTMVAPtRe5H6jug@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The kthread_run() function returns error pointers so the
max3421_hcd->spi_thread pointer can be either error pointers or NULL.
Check for both before dereferencing it.

Fixes: 05dfa5c9bc37 ("usb: host: max3421-hcd: fix "spi_rd8" uses dynamic stack allocation warning")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/host/max3421-hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index dcf31a592f5d..4b5f03f683f7 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1916,7 +1916,7 @@ max3421_probe(struct spi_device *spi)
 	if (hcd) {
 		kfree(max3421_hcd->tx);
 		kfree(max3421_hcd->rx);
-		if (max3421_hcd->spi_thread)
+		if (!IS_ERR_OR_NULL(max3421_hcd->spi_thread))
 			kthread_stop(max3421_hcd->spi_thread);
 		usb_put_hcd(hcd);
 	}
-- 
2.47.2


