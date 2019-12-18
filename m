Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6CD12511E
	for <lists+kernel-janitors@lfdr.de>; Wed, 18 Dec 2019 19:58:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbfLRS6c (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 18 Dec 2019 13:58:32 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:13925 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727031AbfLRS6c (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 18 Dec 2019 13:58:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576695511; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=3C5mvevNz9A0VbgTQX/fgHixrc51/NX8lScWfWySnQ8=;
 b=rbo+c8WkGHWGz2h5mEbr2qRkiUggVQZEFT6vSQ3//I3ihaYZlhOFV9aU6eyTGjnH3UqHEjTU
 +tHiK0XS7k1/GQn33WaXIkGT04sZQMCg5fpO7o+tfWLIiHQCGM/QuMjJPZ1pzfiB8N2hGFaY
 vjVRTPcyn7q8WxRpAARIgA5yhyw=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfa76d7.7f01658e8df8-smtp-out-n02;
 Wed, 18 Dec 2019 18:58:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 613F4C447A0; Wed, 18 Dec 2019 18:58:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=2.0 tests=ALL_TRUSTED,MISSING_DATE,
        MISSING_MID,SPF_NONE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CD57BC433A2;
        Wed, 18 Dec 2019 18:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CD57BC433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] brcmfmac: Fix use after free in brcmf_sdio_readframes()
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191203095855.c4fradmsixgbq7mc@kili.mountain>
References: <20191203095855.c4fradmsixgbq7mc@kili.mountain>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Arend van Spriel <arend.vanspriel@broadcom.com>,
        Franky Lin <frankyl@broadcom.com>,
        Hante Meuleman <hante.meuleman@broadcom.com>,
        Chi-Hsien Lin <chi-hsien.lin@cypress.com>,
        Wright Feng <wright.feng@cypress.com>,
        Douglas Anderson <dianders@chromium.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Naveen Gupta <naveen.gupta@cypress.com>,
        linux-wireless@vger.kernel.org,
        brcm80211-dev-list.pdl@broadcom.com,
        brcm80211-dev-list@cypress.com, kernel-janitors@vger.kernel.org
User-Agent: pwcli/0.0.0-git (https://github.com/kvalo/pwcli/) Python/2.7.12
Message-Id: <20191218185830.613F4C447A0@smtp.codeaurora.org>
Date:   Wed, 18 Dec 2019 18:58:30 +0000 (UTC)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The brcmu_pkt_buf_free_skb() function frees "pkt" so it leads to a
> static checker warning:
> 
>     drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c:1974 brcmf_sdio_readframes()
>     error: dereferencing freed memory 'pkt'
> 
> It looks like there was supposed to be a continue after we free "pkt".
> 
> Fixes: 4754fceeb9a6 ("brcmfmac: streamline SDIO read frame routine")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Franky Lin <franky.lin@broadcom.com>

Patch applied to wireless-drivers-next.git, thanks.

216b44000ada brcmfmac: Fix use after free in brcmf_sdio_readframes()

-- 
https://patchwork.kernel.org/patch/11270885/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
