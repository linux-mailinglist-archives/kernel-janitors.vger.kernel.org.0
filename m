Return-Path: <kernel-janitors+bounces-6682-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D129ED342
	for <lists+kernel-janitors@lfdr.de>; Wed, 11 Dec 2024 18:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 048F31674E8
	for <lists+kernel-janitors@lfdr.de>; Wed, 11 Dec 2024 17:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4734D1DE4E7;
	Wed, 11 Dec 2024 17:20:48 +0000 (UTC)
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45261DE4FF;
	Wed, 11 Dec 2024 17:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733937647; cv=none; b=DwSYX0iqMZ5ipkA3t0oSbL8ZtaF2WpdwztNTwTv6F46+c9wNaZ7ceUF962eyJIgwZfyax0p9NAI24W9BiSxoDtROn4CjPKRChZ0LEMiPT8C56wBkqq4d3dYLRR5VtMHK2R82Fb6DmStJg1AGozKXnyFzA/qbnzdnDm5L9hPN770=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733937647; c=relaxed/simple;
	bh=24LHVsPPGzRM7HsZ0yR/+9TkDvB1RkUeOujKaY5kCpI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L+uN3pHg/w6azWw9vn3APfhp2LAw4dFWsDaSIEES64zgyyryxC41aHMyoQ0WBflnSu+8z8pguctZ9QfP7tRYBz03cfuR1qhYHIZUU1xcl7t9KCxAC8wU5h90SaxbjUOMvg784vvd/qkY0M3NR9ieopZ3Wb8rd5epraGUTUCTzpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40664C4CEDD;
	Wed, 11 Dec 2024 17:20:47 +0000 (UTC)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Sriram R <quic_srirrama@quicinc.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Rameshkumar Sundaram <quic_ramess@quicinc.com>, 
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <755becb1-819b-484d-8fac-9a2db53ced1b@stanley.mountain>
References: <755becb1-819b-484d-8fac-9a2db53ced1b@stanley.mountain>
Subject: Re: [PATCH next] wifi: ath12k: Off by one in
 ath12k_wmi_process_csa_switch_count_event()
Message-Id: <173393764722.2156603.16648228152971339085.b4-ty@oss.qualcomm.com>
Date: Wed, 11 Dec 2024 09:20:47 -0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0


On Fri, 06 Dec 2024 15:52:29 +0300, Dan Carpenter wrote:
> The ahvif->vif->link_conf[] array has IEEE80211_MLD_MAX_NUM_LINKS elements
> so this should be >= instead of > to avoid an out of bounds access.
> 
> 

Applied, thanks!

[1/1] wifi: ath12k: Off by one in ath12k_wmi_process_csa_switch_count_event()
      commit: 58fa8109fa8dae2947567e8f56dbd55ad81bc35c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


