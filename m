Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A06F2DE039
	for <lists+kernel-janitors@lfdr.de>; Fri, 18 Dec 2020 10:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388445AbgLRJGF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 18 Dec 2020 04:06:05 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:21390 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728210AbgLRJGE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Dec 2020 04:06:04 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608282341; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=304oeBEk5IMygH+RNgPG4a2gkewr5DJojRDmwpcCV+M=;
 b=AGj/2eRk05I2hWF/9mY9K971+PzUaNUaiYCRfH5e/eATGUon6mYrKDZ+gC7gKBZHOBRC1gjv
 tqledmO6wy8FydhWNF5pWS1DZWIlYJ5jm+55/E/qjYUxd4wCziUNivdlhozGHumwT1HJ/rQl
 HPIjT4w2kecoaj1Em9LRcv3OF8o=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fdc70d8253011a4b89c1d12 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 09:05:28
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A859DC43461; Fri, 18 Dec 2020 09:05:27 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 343AAC433C6;
        Fri, 18 Dec 2020 09:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 343AAC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ath11k: dp: clean up a variable name
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <X9s7QAHDM2OTIo3a@mwanda>
References: <X9s7QAHDM2OTIo3a@mwanda>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        kernel-janitors@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20201218090527.A859DC43461@smtp.codeaurora.org>
Date:   Fri, 18 Dec 2020 09:05:27 +0000 (UTC)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The "&ar->ab->base_lock" and "&ab->base_lock" locks are the same lock
> but it's nicer to use the same name consistently everywhere.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

abdcd4cbec42 ath11k: dp: clean up a variable name

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/X9s7QAHDM2OTIo3a@mwanda/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

