Return-Path: <kernel-janitors+bounces-308-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1E17EE77F
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 Nov 2023 20:28:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9F47280F69
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 Nov 2023 19:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501BB45972;
	Thu, 16 Nov 2023 19:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9AA3067B;
	Thu, 16 Nov 2023 19:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D571BC433C7;
	Thu, 16 Nov 2023 19:27:55 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id AF8EF10613A1; Thu, 16 Nov 2023 20:27:49 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: sre@kernel.org, nathan@kernel.org, ndesaulniers@google.com, 
 trix@redhat.com, Su Hui <suhui@nfschina.com>
Cc: r-rivera-matos@ti.com, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20231116041822.1378758-1-suhui@nfschina.com>
References: <20231116041822.1378758-1-suhui@nfschina.com>
Subject: Re: [PATCH] power: supply: bq256xx: fix some problem in
 bq256xx_hw_init
Message-Id: <170016286968.830118.5959829920078266260.b4-ty@collabora.com>
Date: Thu, 16 Nov 2023 20:27:49 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Thu, 16 Nov 2023 12:18:23 +0800, Su Hui wrote:
> smatch complains that there is a buffer overflow and clang complains
> 'ret' is never read.
> 
> Smatch error:
> drivers/power/supply/bq256xx_charger.c:1578 bq256xx_hw_init() error:
> buffer overflow 'bq256xx_watchdog_time' 4 <= 4
> 
> [...]

Applied, thanks!

[1/1] power: supply: bq256xx: fix some problem in bq256xx_hw_init
      commit: b55d073e6501dc6077edaa945a6dad8ac5c8bbab

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


