Return-Path: <kernel-janitors+bounces-654-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA5480CE8F
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 Dec 2023 15:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58ACE281BC4
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 Dec 2023 14:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB275495D2;
	Mon, 11 Dec 2023 14:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="0+AhFQH1"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 597F19F;
	Mon, 11 Dec 2023 06:42:36 -0800 (PST)
Received: from 8bytes.org (p4ffe1e67.dip0.t-ipconnect.de [79.254.30.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 5ED261A367B;
	Mon, 11 Dec 2023 15:42:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1702305755;
	bh=wKD1DsQaiTgywzlVHLaJwdfwwxmFpo+Zt21eDIlz2CI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0+AhFQH1wPogqKg67e1JEaiJg745C9js2v9TdhpvbOkZXYxEBm79UkKR52gD7YDXf
	 1td4YdH0NLUoESa1Iq2c9r9SNFfDJI1ie5bu7/bxwdFR/xkjnZrr2ogsmX8T/t9wpW
	 NWzn3t6edKbTjoLetjerEy6Z6MP5wheSH4QuG1bVJWmags8+LYpHM7f+TVy7t6dBIu
	 9Sey2qUVC3jy0gg0tHWh60Htv5UfvCu1CXCreAfiwlxPl068PHv8HVJkMg+o8QpzR5
	 CBuHMlsQjApEFC9ejcrjZuooP24zMeNa6A+3xtNL5BtyTXA7Aw16QrOYFl1dQJQOIB
	 niDT8zIVptMnw==
Date: Mon, 11 Dec 2023 15:42:34 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] iommu/apple-dart: Fix spelling mistake "grups" ->
 "groups"
Message-ID: <ZXcf2nB9enlctvTF@8bytes.org>
References: <20231209231240.4056082-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231209231240.4056082-1-colin.i.king@gmail.com>

On Sat, Dec 09, 2023 at 11:12:40PM +0000, Colin Ian King wrote:
> There is a spelling mistake in a dev_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/iommu/apple-dart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.


