Return-Path: <kernel-janitors+bounces-5096-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9C295B0C1
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Aug 2024 10:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9F471F21CC6
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Aug 2024 08:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D2317C20E;
	Thu, 22 Aug 2024 08:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fucd5aE+"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9B215855A;
	Thu, 22 Aug 2024 08:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724316109; cv=none; b=Q2GMb9+2wiqd9uMzIP+me8CMLmeJhZvwS5aUfpAphPHbdFZ4wjrtRsy/zX0QRnXFjCvhAUafzPDMfDypj0WyncFXWGqAJ5CuePiId93aoAWtd2UBrF+pwRrwrkj+MgM276usi1+U7/A6GyXKPMydOwjJAckc/opaYbkpRS9aAtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724316109; c=relaxed/simple;
	bh=xFzOdzJN39N76WVAyxTbnW6oFSCY9ft8H8of/4mE5Vo=;
	h=Content-Type:MIME-Version:Subject:From:In-Reply-To:References:To:
	 Cc:Message-ID:Date; b=rrrrPlST/V4FobriProIpqYqi9pfFWErMJt5kB4UhAIhRMagpm1Nko+MRp3YwNjnrVT3eekj2XeT/r3SgWhJjGDTd1kSmwUaVrYiy/XBq7bUu8f5Jk023Q/r67cT+u5O/eqWy6ZUiWBG9q+h1un/yAZEXz1LtxudZUfu79dFmC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fucd5aE+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58322C4AF0C;
	Thu, 22 Aug 2024 08:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724316108;
	bh=xFzOdzJN39N76WVAyxTbnW6oFSCY9ft8H8of/4mE5Vo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=fucd5aE+vz/qzWOpx6pBqfnwKjStrFYkVl0tLHpD/42meBVXsnxAySz8xhghJ54e4
	 Ul0I0JMQH+5BiSCft4e2XZWuQHD4CLLUN5UtKRygnXDJlGKAj/ZzmNze/DcpJ9UIhT
	 o+W2sfRh+NEiK5cXVoImRQahGCcyD9bKvNY4Pg6G7iaexRojlaDb3oAilTZn7CPpg+
	 jRrtkKhW+49FxJcUoxS0eY7Ymi0Y3QyGsOJwjiXBUxlgrcBBDOmb0892oSg7Vbi5Se
	 XI8bDC9s1m/0SJGm9j5/kHUgwEkiwpw6vxuBlBYv7GYvMsKzAmuyLHYP0MX4hnJK+v
	 OlTwcUSbRlZXQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: mwifiex: Fix uninitialized variable in
 mwifiex_cfg80211_authenticate()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <d7d043b2-95d5-4e1d-b340-5d7330053ac6@stanley.mountain>
References: <d7d043b2-95d5-4e1d-b340-5d7330053ac6@stanley.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: David Lin <yu-hao.lin@nxp.com>, Brian Norris <briannorris@chromium.org>,
 Francesco Dolcini <francesco@dolcini.it>,
 Johannes Berg <johannes.berg@intel.com>,
 Aloka Dixit <quic_alokad@quicinc.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Rafael Beims <rafael.beims@toradex.com>, Ruan Jinjie <ruanjinjie@huawei.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172431610439.2217900.17742585529305793068.kvalo@kernel.org>
Date: Thu, 22 Aug 2024 08:41:46 +0000 (UTC)

Dan Carpenter <dan.carpenter@linaro.org> wrote:

> Smatch complains that:
> 
>     drivers/net/wireless/marvell/mwifiex/cfg80211.c:4408 mwifiex_cfg80211_authenticate()
>     error: uninitialized symbol 'varptr'.
> 
> It's a check for NULL, but "varptr" is either non-NULL or uninitialized.
> Initialize it to NULL.
> 
> Fixes: 36995892c271 ("wifi: mwifiex: add host mlme for client mode")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Acked-by: Brian Norris <briannorris@chromium.org>

Patch applied to wireless-next.git, thanks.

c9f4c1ec6972 wifi: mwifiex: Fix uninitialized variable in mwifiex_cfg80211_authenticate()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/d7d043b2-95d5-4e1d-b340-5d7330053ac6@stanley.mountain/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


