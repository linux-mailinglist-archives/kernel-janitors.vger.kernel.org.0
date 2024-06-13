Return-Path: <kernel-janitors+bounces-3961-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 756E3906954
	for <lists+kernel-janitors@lfdr.de>; Thu, 13 Jun 2024 11:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 255C31F21B84
	for <lists+kernel-janitors@lfdr.de>; Thu, 13 Jun 2024 09:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBBCE140391;
	Thu, 13 Jun 2024 09:51:18 +0000 (UTC)
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA421304AA;
	Thu, 13 Jun 2024 09:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718272278; cv=none; b=MZtVXQfv3CQCtdfe9RMVbjsADyWkrLeJ+HfOCjMKWI8XR5tZetigx3sexTPNHJ4qezw3R8PY+TFwZSgcJ+eG4EBnFuBb8aIwGeg64sde9cxBoah5eROL2wZp2rbOjhPJzce5hgBySMEfef+wRHJL73L/wPFWn+njMn/e/K+yE58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718272278; c=relaxed/simple;
	bh=ZUzfF0hfBaUKfaRIQU9IYLr+jx67880NHthXpo7zsaI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hdTEQG3VRp+fykh7jf+ptSRa8/mgWH4SqYuDAIn6wKmRCD3wG0XGRib6KA7lO9foZRg8D1XSYEYo6ai64ihgd5s4wEgqUi551qmDG87uHZagZFZMTo+2FGZwpPoyWVhuUHtLEAZqOq7InWB0b2BFZNCkW9hZ8L3DNCPpU3YHfyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4529C2BBFC;
	Thu, 13 Jun 2024 09:51:16 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ARM64: reloc_test: add missing MODULE_DESCRIPTION() macro
Date: Thu, 13 Jun 2024 10:51:14 +0100
Message-Id: <171827226987.47248.1258227365182563585.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240612-md-arch-arm64-kernel-v1-1-1fafe8d11df3@quicinc.com>
References: <20240612-md-arch-arm64-kernel-v1-1-1fafe8d11df3@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 12 Jun 2024 13:34:56 -0700, Jeff Johnson wrote:
> With ARCH=arm64, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm64/kernel/arm64-reloc-test.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] ARM64: reloc_test: add missing MODULE_DESCRIPTION() macro
      https://git.kernel.org/arm64/c/2a805201f9bd

-- 
Catalin


