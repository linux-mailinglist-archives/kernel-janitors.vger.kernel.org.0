Return-Path: <kernel-janitors+bounces-478-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D68217FBAB2
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Nov 2023 14:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1376E1C215C1
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Nov 2023 13:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E994854FA3;
	Tue, 28 Nov 2023 13:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7j6DxAA"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1927C57873
	for <kernel-janitors@vger.kernel.org>; Tue, 28 Nov 2023 13:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28271C433C8;
	Tue, 28 Nov 2023 13:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701176452;
	bh=iQY4bJQiN3c6pMqgOKt7BcxpAUaqyamtlGBhvbZfDco=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=F7j6DxAAvfbSz1ShjmsAJbPvKAhHvGylm9giBbGWCDU/Xnbk/BH0+rlZmOfel/UQ7
	 zHLA3nw1PmaOckhJnAiw5+q06b4TonZU76jkmts2JEQVCE+cboKi/F8cXnY5sH3Oe1
	 znEWErND0IH7bv9nzn1Yg3EzdHPvFLH9KyXx2xEY3mZXZMUeEdZRuzAW3WzvGKdlUQ
	 /HsMVUW3BIKIFDWCuiP7UGPN0tIZJlzH045j1VhpK6BZfJBp4D5WxfbSrsvXAgaD6L
	 nR46WYDOTy0pVx4oZpVdduR4XsIcxnobfKabOLwTPpdDCp4qQu1B/gh+xAsNmE0bgG
	 T4vW7ldjP7rjQ==
From: Maxime Ripard <mripard@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>, 
 Donald Robson <donald.robson@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231124163917.300685-1-colin.i.king@gmail.com>
References: <20231124163917.300685-1-colin.i.king@gmail.com>
Subject: Re: (subset) [PATCH][next] drm/imagination: Fix a couple of
 spelling mistakes in literal strings
Message-Id: <170117645007.2825698.11061509087464086760.b4-ty@kernel.org>
Date: Tue, 28 Nov 2023 14:00:50 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Fri, 24 Nov 2023 16:39:17 +0000, Colin Ian King wrote:
> There are a couple of spelling mistakes in literal strings in the
> stid_fmts array. Fix these.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime


