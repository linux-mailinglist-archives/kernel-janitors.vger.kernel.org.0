Return-Path: <kernel-janitors+bounces-4300-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADC491502B
	for <lists+kernel-janitors@lfdr.de>; Mon, 24 Jun 2024 16:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 315281F22DDC
	for <lists+kernel-janitors@lfdr.de>; Mon, 24 Jun 2024 14:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA34519B3C5;
	Mon, 24 Jun 2024 14:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="cBLkRpjB"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9A019AD67
	for <kernel-janitors@vger.kernel.org>; Mon, 24 Jun 2024 14:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240019; cv=none; b=Zgb9Q6x0jtbgMhDTMF0aRRi786/r3KbfwDoACuNGdckuK72sYOy0t+lLyJ7r8d2Pan5RcjAUo/G+3+YYWRlG2pVqnuqnaNS86ktaONkGXc7LeZcbF8aAR8vIE3xQNwQUYpGpGypVl9KkRxQFP4rHCYf536veDgJkVJXCN8O6mUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240019; c=relaxed/simple;
	bh=3+VEMirkt2JimbX+cgEpMZSYxqIZTmLUAGJ3tL7aqRc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GJ9DCmJyY7OROwryuWGWbeLAxSbtR1RlVg6vf0LFktsSCRn/yq4oB3U8qhyv7ZEsRsInAne4OW9lOWs/+61skbZZaH2n0bP5Or3WxnixrBE2rUswbqlwvlaSnaPDwMfUElWheJ1wenq5KmiAMdKfFePG9tCgjxCPHzLFzBnd288=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=cBLkRpjB; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7065f3de571so100776b3a.0
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jun 2024 07:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1719240016; x=1719844816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKy5X78Xc68Jjp/ITVwHyZUvV7q/2v9iXB0/cpHUtsM=;
        b=cBLkRpjBjzJL9pK8ybzUiu8pJDFuaFThvl+/HmObM3WA8AqDx6c9zUpwL4gZGDTROL
         N0oOpm8ufogeMajklFccJ20omMBY7flpr5mCufMo2hqRg2gtAt0+80Pe582S9Rv1liHv
         gYCNBLDjBfPtBPbkxQ89UdEAK2mTmxm/OBQXxRAHCLZp75RLKxJX/XvvXTA5LBpKMVJv
         MtNPvh+9N70oC+sPH57KEjCtzEyx1nKgwqaBcL6O0pJjhFdFCX2LTkNC6jUYiGYlnM7k
         +Z4TF7/6W+G12SW6jn1fAgBTxFBv/z2k4S/E5uSKIcjsRJdUjUlKIUo9Ho4a/XEIn/P8
         esug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719240016; x=1719844816;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKy5X78Xc68Jjp/ITVwHyZUvV7q/2v9iXB0/cpHUtsM=;
        b=th14pTx3xp6MRzKSpGhy4Vu5uOaU4SCHiUZYKzR1KbkEPv1KQb20Z1zuvC8lKMdGAd
         NGfbFZ3XShXkr5hcuN0tV2madW0ZNiXj7s3EqYT8hCDJA1g1l3VS5CDMNJRH+TenVGOu
         +Ot2DIAGujLMysXlKmDhlGvZZeHR/eezmlTJ1EXMMlI9ZTCGLQTqa/lrDMAzChLlfE01
         jHenj59FnRt+pf0LJuBlP2uGfeYdgzxuy0kxCynuW/NLb1HMX+n4eRq8i807aMM8Gyad
         7pR5wMiueu6gAf21M97HSZtuuNXL0o8A5CSaz9e3OUb7DMMnAqe+Zortr+RHzsV4l+Bl
         LnYg==
X-Forwarded-Encrypted: i=1; AJvYcCUWc21XukLr0jWrIjF20UqsYDkBzKWsgzVvi51f7ch83+NG3Z1xFmXvN+Ry52M5piJjyoUYF/UPZU5NLr4LrOtugVt2D+8IxG2mcOMnubOy
X-Gm-Message-State: AOJu0Ywj2PHHCCrSgz+V68+jKrg2c4nQ2RgejNddeZn8xZscFWmAOzMa
	D21Q0h31Go1gfsURai0RDTLDJwNNVza4BAyypmRUYssWUwAsx3sdXSS3ZBwKRCY=
X-Google-Smtp-Source: AGHT+IFMSPpdcpFf9R0ildYRClJVAwkyi4bsJ5OHhkX5J/qqK8Lr9fu97jELdRw9rLlQ6iA/jVH4rw==
X-Received: by 2002:a05:6a00:48:b0:705:d50c:2564 with SMTP id d2e1a72fcca58-70667e6fcd6mr6262026b3a.3.1719240015146;
        Mon, 24 Jun 2024 07:40:15 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706512fed18sm6278729b3a.181.2024.06.24.07.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 07:40:14 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240602-md-block-brd-v1-1-e71338e131b6@quicinc.com>
References: <20240602-md-block-brd-v1-1-e71338e131b6@quicinc.com>
Subject: Re: [PATCH] brd: add missing MODULE_DESCRIPTION() macro
Message-Id: <171924001423.306345.14142856232917408187.b4-ty@kernel.dk>
Date: Mon, 24 Jun 2024 08:40:14 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0


On Sun, 02 Jun 2024 16:46:25 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> modpost: missing MODULE_DESCRIPTION() in drivers/block/brd.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> 

Applied, thanks!

[1/1] brd: add missing MODULE_DESCRIPTION() macro
      commit: 876835b128976e2e9a7d18daab58b4cba7742787

Best regards,
-- 
Jens Axboe




