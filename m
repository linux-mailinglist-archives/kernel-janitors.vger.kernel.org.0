Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF6201BB9D3
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Apr 2020 11:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgD1J2Q (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 28 Apr 2020 05:28:16 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:36775 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726932AbgD1J2Q (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 28 Apr 2020 05:28:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588066095; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=P4VZX3ZX9bjFPFi5wqqFiuPyQ1zJ6+2LvNTJNZrdILk=;
 b=a5t3KdbKVW01amAhhg+LtkEEUSVD+Fc0W2CwPpdsN1VmpeZ2TajG4CeFXukKu/vHGD62a3xn
 +enOlG4db3hMgMO4ECYtG9cp11f/sQqeAdZQl0NyBVB7gJ29zRt7sfwoZa4I4nO2hyuPmi8k
 iSwlNoMIUvGvf+4bexIndP4HNBg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea7f721.7f3ee3d93308-smtp-out-n03;
 Tue, 28 Apr 2020 09:28:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 224E1C433F2; Tue, 28 Apr 2020 09:28:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=2.0 tests=ALL_TRUSTED,MISSING_DATE,
        MISSING_MID,SPF_NONE autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3CEA2C433D2;
        Tue, 28 Apr 2020 09:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3CEA2C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH net-next] ath11k: remove redundant dev_err call in
 ath11k_ahb_probe()
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200427104403.14598-1-weiyongjun1@huawei.com>
References: <20200427104403.14598-1-weiyongjun1@huawei.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Wei Yongjun <weiyongjun1@huawei.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
User-Agent: pwcli/0.0.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20200428092801.224E1C433F2@smtp.codeaurora.org>
Date:   Tue, 28 Apr 2020 09:28:01 +0000 (UTC)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

I don't see harm having two error messages and having an error message
within ath11k makes it easier to find the exact location, so I'm
dropping this.

-- 
https://patchwork.kernel.org/patch/11511845/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
