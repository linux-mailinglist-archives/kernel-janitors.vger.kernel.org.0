Return-Path: <kernel-janitors+bounces-6269-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 515049B63C1
	for <lists+kernel-janitors@lfdr.de>; Wed, 30 Oct 2024 14:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F255A1F2114F
	for <lists+kernel-janitors@lfdr.de>; Wed, 30 Oct 2024 13:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC74D1EB9E3;
	Wed, 30 Oct 2024 13:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="hwMwd1xA"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673EF1E9066
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Oct 2024 13:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730293792; cv=none; b=oCqhA9UwazVjdX6Kh6M76uQgBqk/K+yLr5AtVT6Uxr/TSOKCHsMoLvSL4o38ACqyK2ZguhP/1do7FCQXrzE3LM4c/ABnBhbzCWz84VYgi2Ml8PrmnCmFu5pFlURC0W+JDMIoK46DEd14gaiG/k+lmlDRXilB3chMaTkQqtRYmWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730293792; c=relaxed/simple;
	bh=E5OwLTPy54ufFGgeBpt5ox7GUyM51fdd+bAxUQchzFg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XnFgGNPxnSYFMMW7H+I9Q4CicW1ORO7Spsllsw1Qj/MNpof/CjgG+apCXtSll/k85gJAZH116oNEHh4GjFmvFv3Iu456dv4St8wJghhqnmzQhSUjDPK7dJKmLoITX8JmQOhNuuLmSu5cDiXGwEOD9SXjS7gdwOs11SHtNVDRZ1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=hwMwd1xA; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-8377fd760b0so247091339f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Oct 2024 06:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1730293788; x=1730898588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAS1y4kZ27f1rr18cg6s15oqwDD8HYKBoo6u8v38O4g=;
        b=hwMwd1xAdjjzsa2bcepYVHhaKoyG6zIXaC0BNxmuQX1BrBMYhPWZk19ohypDhvh6d3
         UGwW02p7ozyNSltuYAp2RVuu85PVPWiax5vrjs1opSRgisRwdk78haM5usLhXhQZQVrz
         1AzIIG+u7TAcCOLYR4ZdeeC7H+SR/O2tU6Lt556LvBVKZwrJSvS/X6fex6Y3GFb9MXpM
         EQb9b6vsOnuGlHW2Lzyp7i2OEvVUdbyEJpW63gq6T63AVaHrFr2hukCaKwnwS24UKGl3
         3W7n/CJZpbowROnIgg0asRJ4qfzzLQKuG85FTpd1WcVBtic+5R4tYQBoOQCT5b5xsjZW
         nJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730293788; x=1730898588;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LAS1y4kZ27f1rr18cg6s15oqwDD8HYKBoo6u8v38O4g=;
        b=B4pf/NfzuOE/gRRS2O+CaX8CjX03a5S9+YO3R7rZzwUz2quyRZpagHO1wHKzEqNdGx
         0CyGPVzd1H0U0FCsLX+tlmarVRiHSuOvJMnjbbtlRc9Q0N0dK1wNRFtZp1l5bACtJPAZ
         ++bXCz2dCrTkbfRN4NzMAu7L6kUvIzASIx7xygoaX3olTPXiIkNKxsf6zV+Nlbn03fM7
         JvWL4TcuaLEpG65RsCNIfNZpyg0qAN7xouBFsGbfYpL66ntOqsB08ha2F7UfxhhyCUuq
         gNi/+zSOpmLW1tBj5XaRQUuRahPpHZ6WCTiJ9AUd4vCTDnHFVAzi4F9lkKr/7G81iVwQ
         i/oA==
X-Forwarded-Encrypted: i=1; AJvYcCV/sbxiMwKf20oWMSeEBV0vZd/nxyOTeF3srOzBRnuptZwS4fRV1VTmW/r6X68iHnCI9qjFI/lSy30zt8+mDNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN3n4HV6B3BwVfi4kpQE29b9/Fma2lSZB7KSmNRhtHOFyRNB2P
	vMqxK4EoCR+E6YzQUJB/cPV54pjqksQ+MvBJfP9SmJdnCro5MmcXK20oztqv6hM=
X-Google-Smtp-Source: AGHT+IENNDyNNZGII1nL/NaaQ0kx9gLki/JevI1ijapsM9JD9CCx62rACXRjzrtMV0m6Zp+z0JciFA==
X-Received: by 2002:a05:6602:1656:b0:834:d7b6:4fea with SMTP id ca18e2360f4ac-83b1c3e9fcemr1284626039f.6.1730293788122;
        Wed, 30 Oct 2024 06:09:48 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc72751298sm2872855173.91.2024.10.30.06.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 06:09:47 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <70879312-810a-49ce-aba3-fdf7f902a477@stanley.mountain>
References: <70879312-810a-49ce-aba3-fdf7f902a477@stanley.mountain>
Subject: Re: [PATCH next] io_uring/rsrc: fix error code in
 io_clone_buffers()
Message-Id: <173029378724.7840.5463253318064416297.b4-ty@kernel.dk>
Date: Wed, 30 Oct 2024 07:09:47 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 30 Oct 2024 12:55:06 +0300, Dan Carpenter wrote:
> Return -ENOMEM if the allocation fails.  Don't return success.
> 
> 

Applied, thanks!

[1/1] io_uring/rsrc: fix error code in io_clone_buffers()
      commit: 0f576012ae2ff08009ce91e2294832e2b88aba06

Best regards,
-- 
Jens Axboe




