Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D66B149B24
	for <lists+kernel-janitors@lfdr.de>; Sun, 26 Jan 2020 15:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729410AbgAZOhE (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 26 Jan 2020 09:37:04 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:17534 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729160AbgAZOhB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 26 Jan 2020 09:37:01 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580049421; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=zJwV6eNkcgEl1yzh+y9xcqBuONA0OkFvIa7sq8Zg2eo=;
 b=xegji/8CSWgmKau4M8hbYjo9CTnEMJlx2G02fUa10KR6AGYz8MOpToOuaTYP5IsMJ8XUGpUP
 vSiUvGCG/t7YJyyEmRTzirrsCTNqXdlfjadsabISQwXNehbmjBNmdsW07dTW6KWlto4NC0Vo
 9cBEX9pO6s+a5qF6WtNHlB4nxc8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2da404.7efcd60be378-smtp-out-n03;
 Sun, 26 Jan 2020 14:36:52 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7EE7AC4479C; Sun, 26 Jan 2020 14:36:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=2.0 tests=ALL_TRUSTED,MISSING_DATE,
        MISSING_MID,SPF_NONE autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F2A2C433CB;
        Sun, 26 Jan 2020 14:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5F2A2C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ar5523: fix spelling mistake "to" -> "too"
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200123001801.2831921-1-colin.king@canonical.com>
References: <20200123001801.2831921-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Pontus Fuchs <pontus.fuchs@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: pwcli/0.0.0-git (https://github.com/kvalo/pwcli/) Python/2.7.12
Message-Id: <20200126143651.7EE7AC4479C@smtp.codeaurora.org>
Date:   Sun, 26 Jan 2020 14:36:51 +0000 (UTC)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> There is a spelling mistake in a ar5523_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

d92e8fa8ce88 ar5523: fix spelling mistake "to" -> "too"

-- 
https://patchwork.kernel.org/patch/11346589/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
