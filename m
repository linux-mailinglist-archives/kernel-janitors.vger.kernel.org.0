Return-Path: <kernel-janitors+bounces-5518-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ED397BF74
	for <lists+kernel-janitors@lfdr.de>; Wed, 18 Sep 2024 19:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 170111F21BCA
	for <lists+kernel-janitors@lfdr.de>; Wed, 18 Sep 2024 17:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6951C9DE6;
	Wed, 18 Sep 2024 17:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bORxtch+"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE37CA2D;
	Wed, 18 Sep 2024 17:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726679286; cv=none; b=D+MQajM74Kh1CJKeED9pP3DvytguzHFKmQqeI6oPF3A9NLsRsAH4xcQEAnBDTGJIOpWkRCXs3oqptSepezVob4a9Gg1UszAWPQZM6te0S2YsxUz8Bvpjprfl1TMXv7LKlS3lmDbjBl05WAmQ4gIDdTAYvCkpeQ+Xe/iblknWeiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726679286; c=relaxed/simple;
	bh=DPziPLKzDdbmRMPxT3R1WxheB5wFFJjSGfR2eBNoZEo=;
	h=Content-Type:MIME-Version:Subject:From:In-Reply-To:References:To:
	 Cc:Message-ID:Date; b=S3wQFhi8euehbhcnS612FZDwQa4HdeS4JjhDzmSXBhUhEanPK+7i3F8nFOyPZ8rr6Ah2JbOGDGmWhzdxXCxSsk314bIXz87ydj/k+rEDbF1LAUQxchoWH8C0VJpf0gPWpW+8c4Ehu80+6gKHvUp/HfLXY4KKEOAQ8rgHoUDMAvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bORxtch+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2971EC4CEC2;
	Wed, 18 Sep 2024 17:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726679285;
	bh=DPziPLKzDdbmRMPxT3R1WxheB5wFFJjSGfR2eBNoZEo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=bORxtch+rcHih8RJb0w/K3hG5sh1rx7+6efTEwoIT4sBOJNtvs5kP2HmWygpuPSDN
	 akLiEoiFaXCKivKqsgql/QkQw9KJWsh8vtsw0lYHpGjC7YZXlhzQ38+EI9kvZw0EMp
	 zq9/h4sKzIzunJ8Bu2VtI2sx5XVOOhcBDAJBf6Eu9tdVaHWxRabOM1VJ3XwQKt9xo5
	 bdR3QyuJ0jxuL6AfjPn9P+B9HNAxqNpGjcURCY3uREXetGRhQESz6DIMlT9kIblyMN
	 PiPLeWMfhCOSBJnbuRo3uICWHxLes/YvbJlzIofdLacvAkuh/P18KIHyVCCxbnKN+a
	 GMGonaoqFeeiQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath6kl: fix typos
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240913094818.14456-1-algonell@gmail.com>
References: <20240913094818.14456-1-algonell@gmail.com>
To: Andrew Kreimer <algonell@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Andrew Kreimer <algonell@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172667928257.4089263.8301674737892934391.kvalo@kernel.org>
Date: Wed, 18 Sep 2024 17:08:03 +0000 (UTC)

Andrew Kreimer <algonell@gmail.com> wrote:

> Fix typos in comments.
> 
> Reported-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Changed the title to:

wifi: ath6kl: fix typos in struct wmi_rssi_threshold_params_cmd and wmi_snr_threshold_params_cmd comments

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240913094818.14456-1-algonell@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


