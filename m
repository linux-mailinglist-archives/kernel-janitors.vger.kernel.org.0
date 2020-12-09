Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 228652D3BEE
	for <lists+kernel-janitors@lfdr.de>; Wed,  9 Dec 2020 08:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbgLIHFV (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 9 Dec 2020 02:05:21 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:29478 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727475AbgLIHFU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Dec 2020 02:05:20 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607497497; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=2iq/ctXQQd1Mvr2GktNn9IWZajU/RujTPIBieoIu980=;
 b=rNdLZfEs33K9/bp9Wtx6Dl8H7sBwbq3uwUaxnYJpwGHYlZFiSYX95c7hrimHbY0aMYfRLpkU
 XLDGz7jpX940/g0j7ncbw293cO/tj/S0Sg1DHMMqkQyA7650UeqF+vxBXx5ChPkSYzUhvA/g
 CgSBqM/oPX9xGdn+xjTTPPFpRgY=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fd076f5d8cf5d213fec5f9e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 09 Dec 2020 07:04:21
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4F4C5C433ED; Wed,  9 Dec 2020 07:04:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        MISSING_DATE,MISSING_MID,SPF_FAIL,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 969AFC433C6;
        Wed,  9 Dec 2020 07:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 969AFC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ath11k: unlock on error path in
 ath11k_mac_op_add_interface()
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <X85sVGVP/0XvlrEJ@mwanda>
References: <X85sVGVP/0XvlrEJ@mwanda>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Ritesh Singh <ritesi@codeaurora.org>,
        Maharaja Kennadyrajan <mkenna@codeaurora.org>,
        ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        kernel-janitors@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20201209070420.4F4C5C433ED@smtp.codeaurora.org>
Date:   Wed,  9 Dec 2020 07:04:20 +0000 (UTC)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> These error paths need to drop the &ar->conf_mutex before returning.
> 
> Fixes: 690ace20ff79 ("ath11k: peer delete synchronization with firmware")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

59ec8e2fa5aa ath11k: unlock on error path in ath11k_mac_op_add_interface()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/X85sVGVP/0XvlrEJ@mwanda/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

