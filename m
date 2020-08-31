Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDFC257BFC
	for <lists+kernel-janitors@lfdr.de>; Mon, 31 Aug 2020 17:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgHaPQp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 31 Aug 2020 11:16:45 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:26419 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728258AbgHaPQj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 31 Aug 2020 11:16:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598886999; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=mcYwOPoHsqbCCCjLpl0E7kw4ZX/qJP7Ln8FXX5Nsc5Q=;
 b=XByMTxY+Xh/6FoUUrYkCGW3aB2rz+N+F9QUhSLOiaDNgDd6RJo0gRnRW5EqkNVtVzM2nyB0T
 g2SwrghVNKE+I0RAM3iPx0ezjaWaQ+LJj4Ss4i2E/F7GsGzCreNg53iiUA/hB45EmMiz+KnQ
 8qXRlZvCr2SD7dKPZJAq+8Jm9k0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f4d1446ba408b30cedadca8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 31 Aug 2020 15:16:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B7279C43391; Mon, 31 Aug 2020 15:16:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=2.0 tests=ALL_TRUSTED,MISSING_DATE,
        MISSING_MID,SPF_NONE autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 937CAC433C6;
        Mon, 31 Aug 2020 15:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 937CAC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH][next] ath11k: fix spelling mistake "moniter" -> "monitor"
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200819074729.48591-1-colin.king@canonical.com>
References: <20200819074729.48591-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20200831151621.B7279C43391@smtp.codeaurora.org>
Date:   Mon, 31 Aug 2020 15:16:21 +0000 (UTC)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> There is a spelling mistake in an ath11k_warn warning message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

bd5dd7aaa4c0 ath11k: fix spelling mistake "moniter" -> "monitor"

-- 
https://patchwork.kernel.org/patch/11723197/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

