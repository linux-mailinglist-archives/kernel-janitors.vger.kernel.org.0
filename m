Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDA4C1CEE32
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 May 2020 09:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729165AbgELHez (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 12 May 2020 03:34:55 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:28824 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729163AbgELHez (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 May 2020 03:34:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589268894; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=uqreqFmqsjqbHk0EXaMabJybIFqktm3ASZf5d/h+Psc=;
 b=kWC0ExrblsXvb+UZaRrq6q3kuMfe9mXmdZuOSZj7kIIbeFAnN9/bsdy8R0Hni/9BMMcjK2Ib
 RoJtmQDpklZ3MkwTb0Y/S8dtakaXYGR+tp4uAlIbpb8BeaRz2Nw8sdvE+xUlZgbHz0mObeBN
 cT5Yn1ztw7VoR4qiNIsBDvCJgoA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eba519e.7f297e894308-smtp-out-n04;
 Tue, 12 May 2020 07:34:54 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 82903C4478F; Tue, 12 May 2020 07:34:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=2.0 tests=ALL_TRUSTED,MISSING_DATE,
        MISSING_MID,SPF_NONE autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D271BC433BA;
        Tue, 12 May 2020 07:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D271BC433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH next] ath11k: convert to
 devm_platform_get_and_ioremap_resource
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200508075323.81128-1-weiyongjun1@huawei.com>
References: <20200508075323.81128-1-weiyongjun1@huawei.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Wei Yongjun <weiyongjun1@huawei.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20200512073453.82903C4478F@smtp.codeaurora.org>
Date:   Tue, 12 May 2020 07:34:53 +0000 (UTC)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Use the helper function that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c8ffcd122760 ath11k: convert to devm_platform_get_and_ioremap_resource

-- 
https://patchwork.kernel.org/patch/11535829/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
