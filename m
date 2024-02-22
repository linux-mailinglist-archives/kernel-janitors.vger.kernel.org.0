Return-Path: <kernel-janitors+bounces-1847-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB1485F0FF
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Feb 2024 06:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3632AB23E29
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Feb 2024 05:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420C7FC16;
	Thu, 22 Feb 2024 05:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHs3P6oU"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAD16FBE;
	Thu, 22 Feb 2024 05:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708580175; cv=none; b=mIagZEdbz5Oa5qS4YZl7gs7/Uo3+Us1y3CxZs0c0v+mW9C6yzkCOzjr8fLuU+zfz4nKFAx073Ev4JNUfhYOSdhVB47upHljWA71DvQXK+fv/Bc4NypRfD9uYzwD86PaJUN9sgyfcKrloLj5uyhkqGmfww6g382NWujDuo09fNqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708580175; c=relaxed/simple;
	bh=ZKuX5+xYAEWUs36SnlYmDzgNCCJN5ePNHibRbrCTwas=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Ai5BID6OWMG+WAiPjWf9B87ca3nlsPjDcXNd2Tq70KoInW9qTbKBTdUns2fkb0qCqSB6IjGYH3XIvMeZQ+1Rls5q4OQg0gPczZ3VoVFPKm8w6++aQK8J4IA3x5zM8Q9TbnTtSv0tHBsO+HhAkkvT7P+OTICzXHZwVp3tZ01lpA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHs3P6oU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1724EC433F1;
	Thu, 22 Feb 2024 05:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708580175;
	bh=ZKuX5+xYAEWUs36SnlYmDzgNCCJN5ePNHibRbrCTwas=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jHs3P6oUk+p4XiiM7mMECNwtjM1DSz1rASSdYy3vsJKO7hDlvDtxjn7o10qCELTsc
	 wAAKzn7KWLtvBDvJ5rSW8+CCwlWdJYO1o8X6rkiRWUxh8MsWd55i4zKhQHnZTHXQrF
	 WxtRPDsZnpUlNbbDiFnqUb7TxzLI9FSydAzyNBKDnmy/SlimfIWSBF6RboO9wuei5P
	 dVKPMhwFkxR3C9zrhvMqp1yPpVlaF7pUZv815lnLgx3C1aN6zlrpnAtkj6PjgAQ873
	 TJjFHZW1N4am6Ly0bOSEW7ePGV6C8nDJsNbPIs11SnanFXsIwPbppWpZ3FHu6Ghh6b
	 wYHVHCRxR3UsQ==
Message-ID: <f2e3fa8683ccb3880fd1852598f0f3df.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240216140132.2108665-1-colin.i.king@gmail.com>
References: <20240216140132.2108665-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] clk: cdce925: Remove redundant assignment to variable 'rate'
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
To: Colin Ian King <colin.i.king@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Date: Wed, 21 Feb 2024 21:36:12 -0800
User-Agent: alot/0.10

Quoting Colin Ian King (2024-02-16 06:01:32)
> The variable 'rate' being assigned a value that is never read, the
> assignment is redundant and can be removed.
>=20
> Cleans up clang scan build warning:
> drivers/clk/clk-cdce925.c:104:3: warning: Value stored to 'rate' is
> never read [deadcode.DeadStores]
>=20
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Applied to clk-next

