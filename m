Return-Path: <kernel-janitors+bounces-5853-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F4C991181
	for <lists+kernel-janitors@lfdr.de>; Fri,  4 Oct 2024 23:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9798C284CF4
	for <lists+kernel-janitors@lfdr.de>; Fri,  4 Oct 2024 21:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27BF1B4F09;
	Fri,  4 Oct 2024 21:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WUlDdGX6"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2EC143C7E
	for <kernel-janitors@vger.kernel.org>; Fri,  4 Oct 2024 21:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728077897; cv=none; b=YZGyMS0zweubbvz0QY+j/fxnV69k0wcqJ6Hczl3Ws7TDfxqteLlVGPCMQrK1pj90PhaFzzu0LuZlFlrMcWZSKL8zcu7rNCDF4JQSYJobqiR8Nis5Eq6X45HJf5LQk+/o1b9q9liEx/zFpnoWqzSyy7DknD3/bW0BGxpxrj8gs8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728077897; c=relaxed/simple;
	bh=xL6oYs7txqJE5TKT/Uno4YPofgUAfebhf5IadXGF0yc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=av8CTjW2QpsXtCYzvnkcdKTY9OhwkJ8YJYn59n330Ffsn4CJsCnHNQUdAQ/3hDEdjmFSVHd4o8Rkc7jVMIUM/UnM4w+udPtnNdfDyS+nVfOmGgQ5yLttosFuhpGAT8CF4PT/Rn3baS9PPKoFT5op9UpgJBaLgEM4TagcmviDD1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WUlDdGX6; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71dae4fc4c9so2244388b3a.0
        for <kernel-janitors@vger.kernel.org>; Fri, 04 Oct 2024 14:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728077895; x=1728682695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gYgjsDPjP7HrNwnpk8YBK3/LqbS1xGGqsLZX+Agvmc=;
        b=WUlDdGX6+XcJE/mP5jK/wmuYy024E6vuUU9wzY30uH/94+FtS5lxNwkfRXGjbnue+4
         Kfwak8DMVu4dOOdqItc/6WfiQmgzZpKFSDPck3n5/4EmUaylGNyAnSNmidwIL6SCihXW
         B/7OPjiBdRj6kiiDbDjE4viJ1tSR+wHvkZRPTok8DAUyuHY7mYrloCEGnx0TUn0P7Kfr
         NtYZ0FGCodfTmxwyM2bIsIIJoyZtNcrxBxjqmvJabvmq/+lD5Zg4w9dAq1itAiexWDV0
         ExeEdI7D4VLLUjAguTQlhs1M0E9303mSGAzH9KlPvKDhDLUjPNwuTQXVzKUo8n0q+cpE
         DQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728077895; x=1728682695;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gYgjsDPjP7HrNwnpk8YBK3/LqbS1xGGqsLZX+Agvmc=;
        b=H+JuhWVHTAESspPgcHkvunDUnm4/V7klDJW+NpaIV1icbv4Qf5XfH3qWtKUYnFzJIG
         dF3uZ/WMa6M1nAQ4PmQP+8L+CikfTsfYZgxzNdJaDMSGpV+r32kJ1gL0OynEEUeEPOKx
         2zTJgaTbLYEMTvcLqnsw4T44rdtdNHPzPmChGFPavQE6OZ3Tjiaxfw69XkR/gY4U4NKE
         TT4h4oz16pEFjwYkHJlipl9XwphZ/IrwOh/GaUxFi8r4Mdlf1dR2C08Qw4X1QM1Bp41W
         NhBm3J73j3g9erF06Xsl6gVCFbT12Q7hrFIrfR5l/pBx3nPpNIET6B2B2PJBaAXdMbR+
         wahg==
X-Forwarded-Encrypted: i=1; AJvYcCVGNqbnDjKRUSLInePJR0UuX962A9CDYVOr7L5flUgH9j8U2aQFCKOE/3RLORuOjytfrByiOYTAVEfa9G5Gjuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVWc3qkgPSxv1o1XqSsCmXoKf+ywPws+Jk+GHmJ2B5y9VkyHvw
	t7/h31xP4V3WoJw3Bt2B2XKbJYoxWKRAO/0463FRtYRUzrfauKwjhevuoJA42NM=
X-Google-Smtp-Source: AGHT+IH3L/srL/M09LlQZunlLjeQulGlZd5i2/4jd/ZSLaq2ZBDuaJvJcMPXaGd40sqB8zTBbVklhA==
X-Received: by 2002:a05:6a00:1ad3:b0:717:839c:6822 with SMTP id d2e1a72fcca58-71de245154dmr6642242b3a.17.1728077895176;
        Fri, 04 Oct 2024 14:38:15 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d46312sm327900b3a.121.2024.10.04.14.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 14:38:14 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
 "Rafael J . Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Andrew Kreimer <algonell@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 Matthew Wilcox <willy@infradead.org>
In-Reply-To: <20240913093713.12376-1-algonell@gmail.com>
References: <20240913093713.12376-1-algonell@gmail.com>
Subject: Re: [PATCH] thermal/ti-soc-thermal: Fix typos
Message-Id: <172807789446.805985.12207310389436873259.b4-ty@baylibre.com>
Date: Fri, 04 Oct 2024 14:38:14 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cb14d


On Fri, 13 Sep 2024 12:37:05 +0300, Andrew Kreimer wrote:
> Fix typos in comments.
> 
> 

Applied, thanks!

[1/1] thermal/ti-soc-thermal: Fix typos
      commit: d8ee46b226ace0110f82233ba4c06ff1742ae443

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


