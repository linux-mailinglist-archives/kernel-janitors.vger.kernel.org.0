Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34170122EBD
	for <lists+kernel-janitors@lfdr.de>; Tue, 17 Dec 2019 15:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728933AbfLQO34 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 17 Dec 2019 09:29:56 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:29551 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728896AbfLQO34 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 17 Dec 2019 09:29:56 -0500
X-Greylist: delayed 301 seconds by postgrey-1.27 at vger.kernel.org; Tue, 17 Dec 2019 09:29:55 EST
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576592995; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=WBhFl5nzOM6Q8mvhJZ6zzfsKG5cQ4BMQ+Dhoez/i1cU=;
 b=CKKIJJV1y2cze/j7LUFiDduR2dHdqq3vIJ2Dk5mUAeywtdl2UxLEaSDFPjkgfAd24eHf0oeb
 YN8AeTO3eF7BXhK/fhhkY005To5XQd18XV4wD0VHGUs65hBNp6sUILlgWJvZMFI5Wb8oCZl6
 fKXU8K6ZMtv3Zb23cOW2O2w3bG0=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df8e532.7efd6a8bbbc8-smtp-out-n03;
 Tue, 17 Dec 2019 14:24:50 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 74520C4479F; Tue, 17 Dec 2019 14:24:49 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 228B3C433CB;
        Tue, 17 Dec 2019 14:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 228B3C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ath10k: Fix some typo in some warning messages
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191204055235.11989-1-christophe.jaillet@wanadoo.fr>
References: <20191204055235.11989-1-christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        davem@davemloft.net, ath10k@lists.infradead.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
User-Agent: pwcli/0.0.0-git (https://github.com/kvalo/pwcli/) Python/2.7.12
Message-Id: <20191217142449.74520C4479F@smtp.codeaurora.org>
Date:   Tue, 17 Dec 2019 14:24:49 +0000 (UTC)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> Fix some typo:
>   s/to to/to/
>   s/even/event/
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

a67bcec3569f ath10k: Fix some typo in some warning messages

-- 
https://patchwork.kernel.org/patch/11272159/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
