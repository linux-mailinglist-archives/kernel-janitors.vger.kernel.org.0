Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 100691BBA00
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Apr 2020 11:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgD1JiU (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 28 Apr 2020 05:38:20 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:22615 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727042AbgD1JiL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 28 Apr 2020 05:38:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588066691; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=xLR8i4SqwknxFn8hmp8K1ZcwLGAGpiGUyaPHIHkT/jU=; b=NPJYJNAzpYfxH04K+TEv4EMMO5iqoCIUJwgABpsby9WhNFtSbFXGVyMRYbYYxj4Bwne3wRuZ
 CpJwGKlg5fzjYzfceN36WaTNwZ14FOmBC1o/z5yMwFRMxTt71PevcqVk/8IV3xI1aHTwVSaZ
 XuGtqvEM4NPThjgNhrTcy9eU3vQ=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea7f96f.7fa92c8d5730-smtp-out-n02;
 Tue, 28 Apr 2020 09:37:51 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8035EC433F2; Tue, 28 Apr 2020 09:37:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 85CC3C433D2;
        Tue, 28 Apr 2020 09:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 85CC3C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Wen Gong <wgong@codeaurora.org>, linux-wireless@vger.kernel.org,
        kernel-janitors@vger.kernel.org, ath10k@lists.infradead.org
Subject: Re: [PATCH net-next] ath10k: fix possible memory leak in ath10k_bmi_lz_data_large()
References: <20200427104348.13570-1-weiyongjun1@huawei.com>
Date:   Tue, 28 Apr 2020 12:37:47 +0300
In-Reply-To: <20200427104348.13570-1-weiyongjun1@huawei.com> (Wei Yongjun's
        message of "Mon, 27 Apr 2020 10:43:48 +0000")
Message-ID: <87ftcoeys4.fsf@kamboji.qca.qualcomm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> writes:

> 'cmd' is malloced in ath10k_bmi_lz_data_large() and should be freed
> before leaving from the error handling cases, otherwise it will cause
> memory leak.
>
> Fixes: d58f466a5dee ("ath10k: add large size for BMI download data for SDIO")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/net/wireless/ath/ath10k/bmi.c | 1 +
>  1 file changed, 1 insertion(+)

Please don't add "net-next" to wireless-driver patches (ath10k, ath11k
etc), because we use different trees. You can add "-next" or
"wireless-driver-next" if you want, but even that is not necessary as I
apply patches to -next by default.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
