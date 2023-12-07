Return-Path: <kernel-janitors+bounces-604-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E9B808CBF
	for <lists+kernel-janitors@lfdr.de>; Thu,  7 Dec 2023 16:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D57831F21227
	for <lists+kernel-janitors@lfdr.de>; Thu,  7 Dec 2023 15:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4352146523;
	Thu,  7 Dec 2023 15:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vRi9EvAl"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A144186A;
	Thu,  7 Dec 2023 15:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F340C433C9;
	Thu,  7 Dec 2023 15:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701964516;
	bh=RezsXkf9hYQwmGQ/9NyUkwIQPcZ/vB0PRe+slSqTby4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vRi9EvAlGAkipSYeoJsU8Z/HTcr3SWZbzoCW2YHmBs9c6i82Et+jQg3jJ7HEa7rZd
	 3tUa4qNIA6WR6oTRQR83NCkAGmDYb5cvCnVi4U/XqqyS5KDw0bBhhIUKm4ZAEfReEQ
	 SQiCJI0SpC2drPTxJidCnLw1IySGBbE+y+c40QD18M4QPxxFJgrFtcDYKqM6aq/XTb
	 mkE6u7PCueBgjuHjaV7BpE81tkSWaIhKnyvXTHgKE0x5+bRZqXjxXP6fjSJG6QZMLv
	 muNX5tFwYmlDM1Y8NNhpMHJQpSn1/2pPozfGi8/ENmnVqZ5QP2KCFfHk8RUGwFbrhW
	 EoXngyQktORNQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
 deller@gmx.de, nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com, 
 Su Hui <suhui@nfschina.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20231130051155.1235972-1-suhui@nfschina.com>
References: <20231130051155.1235972-1-suhui@nfschina.com>
Subject: Re: (subset) [PATCH] backlight: ili922x: add an error code check
 in ili922x_write
Message-Id: <170196451303.113624.6951927696205742670.b4-ty@kernel.org>
Date: Thu, 07 Dec 2023 15:55:13 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Thu, 30 Nov 2023 13:11:56 +0800, Su Hui wrote:
> Clang static analyzer complains that value stored to 'ret' is never read.
> Return the error code when spi_sync() failed.
> 
> 

Applied, thanks!

[1/1] backlight: ili922x: add an error code check in ili922x_write
      commit: 769ff5283f0d7edc819743f183d51af077411107

--
Lee Jones [李琼斯]


