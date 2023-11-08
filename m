Return-Path: <kernel-janitors+bounces-195-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EFA7E5CD7
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 Nov 2023 19:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5106DB20ECB
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 Nov 2023 18:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A5732C82;
	Wed,  8 Nov 2023 18:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tOaxwE5s"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CCD32C6A
	for <kernel-janitors@vger.kernel.org>; Wed,  8 Nov 2023 18:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA45C433C8;
	Wed,  8 Nov 2023 18:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699466813;
	bh=ZDpHDGVEFP+bE91rOEdXGu/bEAWDoVUCkXyc/7UOY6E=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=tOaxwE5s0EKWY7eKOUavVDZadTIn6hx3G+jt1RsSq/WBnNxnaFQN+QIiUDj/SG5WA
	 ifxo/x7WObLSoqpyTGmZgqB9M3deGJgN/UKWTypsK4msyMNIzLe+17UH77qvK2ZhpK
	 1duhzK2fYSbu1+pXtkHhBSyiek20YxFFVsmQcKVzsfNlZjrcmCjscRWzZuASAVnpOa
	 imef0Y48WgEoDVnWmydaMxpmObaMmMMTlMnGn2fxEGQoreyLLxfEnBYB32XfCZLPf4
	 RyAEVVBm62Srp6pYb0Wx198yxdno2J7D2XmXiEtDuxnpHSbAWyXRB4J0BEDyaLQvPM
	 REgmJ8bTMZT8A==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: plfxlc: check for allocation failure in
 plfxlc_usb_wreq_async()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <e8d4a19a-f251-4101-a89b-607345e938cb@moroto.mountain>
References: <e8d4a19a-f251-4101-a89b-607345e938cb@moroto.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Srinivasan Raju <srini.raju@purelifi.com>, linux-wireless@vger.kernel.org,
 kernel-janitors@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169946681070.2821494.11583175295083759020.kvalo@kernel.org>
Date: Wed,  8 Nov 2023 18:06:52 +0000 (UTC)

Dan Carpenter <dan.carpenter@linaro.org> wrote:

> Check for if the usb_alloc_urb() failed.
> 
> Fixes: 68d57a07bfe5 ("wireless: add plfxlc driver for pureLiFi X, XL, XC devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied to wireless-next.git, thanks.

40018a8fa9aa wifi: plfxlc: check for allocation failure in plfxlc_usb_wreq_async()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/e8d4a19a-f251-4101-a89b-607345e938cb@moroto.mountain/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


