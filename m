Return-Path: <kernel-janitors+bounces-6840-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F87A0C3B3
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Jan 2025 22:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9E9518881E5
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Jan 2025 21:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E091D5150;
	Mon, 13 Jan 2025 21:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dmXGaN4L"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA411D514F;
	Mon, 13 Jan 2025 21:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803736; cv=none; b=okjsWrSgJUUSfK/pS6EGwF5L2aWldj+vBLbYlfrawG/JwBO5EvwnGwnvraSdncU9GEnpkIq1hkScrpTqPj8aqytYTcK6myHrFMoHpD5SOb03uQ1y4cG7sQ9MJl/n2vLhqXIwuKv3xwqg+JNR33YfN6ViWSpXu4whOVo6Y0p85Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803736; c=relaxed/simple;
	bh=wvYCwdmhi6v20z1X8h3v5hPFut3iOa+e32YyPME9dLE=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=c0rGGx8YsvL6D0mvISK2YSq4UwLwOI9vbZaI3bGDJ6Lb7rK+C/zJ13qC5FjRP/88+O/G7Y80dfaBIix/NKaLEbfYoNaHQNJPiZkGBlH+G9ElPja4GOIgvO8LsZbLtq3yY652/ayMQadwRaO+/FC8A+BViraVX7/mIaqIhaStlWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dmXGaN4L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CF4C4CED6;
	Mon, 13 Jan 2025 21:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736803735;
	bh=wvYCwdmhi6v20z1X8h3v5hPFut3iOa+e32YyPME9dLE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dmXGaN4Lsyk5NsCwSqoUe455SsX6PZc7DEgqJ3O5B6bT5gQZ9rnirWLMaRJDWEjG9
	 IKsWTi9gMlRqv7sH0x7Mq+NRLewPAiXkpxCFG4f+Ebtia88TJt8eZuI78o0ZBTWFks
	 AEYJOF0Sgx4Mjo4xxeWckIl3NdUnfI1SyWNJ6Wob8JmfZl9zfkjdeC7UtypiGkL8aX
	 flnG3N+/UhmueM8tbIa8GaxGsKe55CqmaNtpONiVudwuevmKA/iqElPEPQLNDgzawI
	 9NucGT3zpe0iAOFk1vi8aD/QKSlYu/sw7JLd/3bgaFMfktgMyyn5x55vi/HL3nzvry
	 nT/XhNyCUm17Q==
Message-ID: <44f787b88b3804126ff58a1f97df874a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240912134707.590224-1-colin.i.king@gmail.com>
References: <20240912134707.590224-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] clk: lmk04832: make read-only const arrays static
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
To: Colin Ian King <colin.i.king@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Date: Mon, 13 Jan 2025 13:28:53 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Colin Ian King (2024-09-12 06:47:07)
> Don't populate the read-only const arrays pll2_p and dclk_div_adj
> on the stack at run time, instead make them static.
>=20
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Applied to clk-next

