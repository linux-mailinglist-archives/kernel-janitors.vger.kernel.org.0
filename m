Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F13D515ACD1
	for <lists+kernel-janitors@lfdr.de>; Wed, 12 Feb 2020 17:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbgBLQId (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 12 Feb 2020 11:08:33 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:63395 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727111AbgBLQId (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 Feb 2020 11:08:33 -0500
X-Greylist: delayed 312 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Feb 2020 11:08:31 EST
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581523712; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=C6l9Cr80nZ5gkO/MxE7gy+ir7uQMQ4f7SqzlmFppX78=;
 b=lpg4sMuVT4DvHtG1tF9nd/3fsZQCgM2PFnCQULBevCIpWUqFeobJUWWobHYYAW8mB/pkfD5y
 Ikj8X243yhNvggVzONbWnb2ER212Cjx/X9loEzgy0V68hJVjb2dBsCs0d9LM5Qb5JvdhWfBy
 oOgnqCba6OhY1o2Z5XGeusy1u0E=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4421c6.7fed242d5ed8-smtp-out-n01;
 Wed, 12 Feb 2020 16:03:18 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A59BEC4479C; Wed, 12 Feb 2020 16:03:18 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5FABBC43383;
        Wed, 12 Feb 2020 16:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5FABBC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH net-next] rtw88: use kfree_skb() instead of kfree()
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200203024801.177044-1-weiyongjun1@huawei.com>
References: <20200203024801.177044-1-weiyongjun1@huawei.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Yan-Hsuan Chuang <yhchuang@realtek.com>,
        Chin-Yen Lee <timlee@realtek.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        <linux-wireless@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
User-Agent: pwcli/0.0.0-git (https://github.com/kvalo/pwcli/) Python/2.7.12
Message-Id: <20200212160318.A59BEC4479C@smtp.codeaurora.org>
Date:   Wed, 12 Feb 2020 16:03:18 +0000 (UTC)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Use kfree_skb() instead of kfree() to free sk_buff.
> 
> Fixes: b6c12908a33e ("rtw88: Add wowlan net-detect support")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Dan already submitted identical patch:
https://patchwork.kernel.org/patch/11356627/

Patch set to Superseded.

-- 
https://patchwork.kernel.org/patch/11361999/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
