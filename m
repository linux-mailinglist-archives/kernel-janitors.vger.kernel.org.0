Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99C963A80E0
	for <lists+kernel-janitors@lfdr.de>; Tue, 15 Jun 2021 15:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbhFONmc (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 15 Jun 2021 09:42:32 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:56274 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbhFONmJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Jun 2021 09:42:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623764405; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=vEqpCBelT4IUf0JN1mGrJD39mXW1ad8pQdp6OTcpw8U=;
 b=cuEnMC3gs8od0CNkws/B0uTSdOr4pE/9OxqyUlAZY+NWgB7apllHnQadd/zZKTuzxrHp9h3W
 dwtvcYIB8k5UKi+yEsn9iUnuYdNBTD1ZTgDmaCplqeIfr3T61SPUGJVBeUWrsssYn2BfdHSK
 vk8OdofPHA4TgENE1+FTS8ipFvM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60c8ada3b6ccaab753293ce8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 13:39:47
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6C78CC43460; Tue, 15 Jun 2021 13:39:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        MISSING_DATE,MISSING_MID,SPF_FAIL autolearn=no autolearn_force=no
        version=3.4.0
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C5012C4338A;
        Tue, 15 Jun 2021 13:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C5012C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] rtlwifi: rtl8723ae: remove redundant initialization of
 variable rtstatus
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210513122410.59204-1-colin.king@canonical.com>
References: <20210513122410.59204-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Ping-Ke Shih <pkshih@realtek.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210615133947.6C78CC43460@smtp.codeaurora.org>
Date:   Tue, 15 Jun 2021 13:39:47 +0000 (UTC)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable rtstatus is being initialized with a value that is never
> read, it is being updated later on. The assignment is redundant and
> can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

03a1b938cf39 rtlwifi: rtl8723ae: remove redundant initialization of variable rtstatus

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210513122410.59204-1-colin.king@canonical.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

