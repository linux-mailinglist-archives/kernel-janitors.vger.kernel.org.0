Return-Path: <kernel-janitors+bounces-4564-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7B592CAFD
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jul 2024 08:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5ED5D1C22B97
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jul 2024 06:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711868248C;
	Wed, 10 Jul 2024 06:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="AZ8BtWbo"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372A182485
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jul 2024 06:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720592633; cv=none; b=Kekv+5jObHvuYRzUzOegva/P7pjB1Zxj0DBufllS/4e23uYQ2TY/s3qWcCahrOWKmtqmPti/vWJSVGH+vYXLdPf2/A0BfKXUAGcxab9+hsuI8icvi2TQKY39bWPMAbWh4xaqZ0UKS9iAf7p4lM++Ubo+eND8zwYIDxGktlgzgtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720592633; c=relaxed/simple;
	bh=j8dOxBZMaGOlj2gCb0Yz8EZvenfR4+cvBPCj3Pk2Aug=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YMztftZ/INA3MrELpGh1Pqoge+7I7KRP8a9q9nE2Whm5FficDf4EK6b2fxcIDdluGvClEpuPUDhW1s23C5y9/s+JUgVC8WrywWyIBukgdVzgdAOPbSejU0tsDw/O/aLSOLeE5TELIwlwYZP8/hcZ7omU0OVFQ5eO1l/0ikam/8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=AZ8BtWbo; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52e98c72d2bso665013e87.0
        for <kernel-janitors@vger.kernel.org>; Tue, 09 Jul 2024 23:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1720592630; x=1721197430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyEbkxUhf1OL34tRfdHA5sjbNSzS8FcJ8Wv+GgVMTv0=;
        b=AZ8BtWbo2hPa9SOtWBGzyAq3TWIbXcVYWHRosK8G8qyIu5tTDk4dziEDFWZAW6z5yo
         LhQXWMs7OstMdvutO8Au0z9QyHB+JacgFQP0snrJ/PMq83gWrurhWdUP5uZOKv+ughaO
         N+X4uO6rswBZ5GbfwabkomgesOKwiu6YG+NulUnLCqRrQP0bNoxvtpye83qBDiuAVt7g
         H8AFzbg+m+w/OLG7uXOKJuBbjMm7+58B2DKRQamosSE3YINcAzOtmEEJeY2uW+oMnc3v
         c9e2t8BH2sJ/7zPpOU3ouEbUJACnUybOTj6mb/ptqHoCBKJkQl21JRYdykMbiEt4/SsO
         P8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720592630; x=1721197430;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DyEbkxUhf1OL34tRfdHA5sjbNSzS8FcJ8Wv+GgVMTv0=;
        b=XLi+iyR648R8e8LGxsMsW2oiD6yFFHXHJr5U7B9wQgdrcN+yy9vn+6S9BOChqjvNdm
         ZWu4CCI7V0rvma51EmiOW9vazAUc4pX3tiiiAt42MmdAJW9aEsFSm+NBYHo0U0IVgTL/
         DZ1PK/o22EE7UoLYhbZydiZMCNSmvw7j5O5ID3V1ROHhfnnPEqYLcy8w5X/14MtQMZ5+
         d075EKYzDOsEFnDLXSma4Hiurik5gypwKgCaBYogdQV0kOv7rGR3QPG35Teym3kPEAU9
         lgNcMKQC/r8y4E/d3COPOSS58QCXQKWbrXOdqUq9q/yalLEzVT1SGRHcAcMX+kjxQCfT
         DGsA==
X-Forwarded-Encrypted: i=1; AJvYcCXOvhHNwnSKkaaZylXg+jpTPAml+OTn1lGM7qempxXJdBCc6406dgXZhQTAyd4jq7yq6R9kffWZZSQ6T66pjmutV87Uc0EGqOXX3oSFdmqC
X-Gm-Message-State: AOJu0Yy4WQipfK827GJNWG3cIqdw0MjSTVF1RVNJzzmsxT4Q34XgHfpx
	mPdoq5dd3hFbSzTy+Dqplyxkzz50rQJgWpvJhDyv9xZZVJLD0auUSvawHxWFVTBnWkYyjr+z1J/
	5npiIJQL8
X-Google-Smtp-Source: AGHT+IEXGqAihoGl004qdQlwBxA6Rt/DV2FQX7zk3TrpdOgzJ5PjKo4004D8Rwsp5cS/KPMfMLkCSA==
X-Received: by 2002:a05:6512:ac6:b0:52c:9ae0:bef3 with SMTP id 2adb3069b0e04-52eb99ff48fmr3541505e87.5.1720592630496;
        Tue, 09 Jul 2024 23:23:50 -0700 (PDT)
Received: from [127.0.0.1] (87-52-80-167-dynamic.dk.customer.tdc.net. [87.52.80.167])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52eb90670b6sm463892e87.197.2024.07.09.23.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 23:23:48 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240602-md-block-loop-v1-1-b9b7e2603e72@quicinc.com>
References: <20240602-md-block-loop-v1-1-b9b7e2603e72@quicinc.com>
Subject: Re: [PATCH] loop: add missing MODULE_DESCRIPTION() macro
Message-Id: <172059262868.380385.13736822552839999900.b4-ty@kernel.dk>
Date: Wed, 10 Jul 2024 00:23:48 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0


On Sun, 02 Jun 2024 17:15:09 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/loop.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> 

Applied, thanks!

[1/1] loop: add missing MODULE_DESCRIPTION() macro
      commit: 7d4425d2c9db957f0040c255ba29db61b993b4db

Best regards,
-- 
Jens Axboe




