Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 779581A817C
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Apr 2020 17:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440330AbgDNPJW (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Apr 2020 11:09:22 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:35881 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2436906AbgDNPJT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Apr 2020 11:09:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586876958; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=OS+STgIODNgZTcpBgh6hwEBupTearScuPMfVu+byNqk=;
 b=kQbsNOapyiCkYbanQbs3XsSkdm/cQhWB7nE4ByXuJhsgMB+QLhXZ5fmqIMLaF7HdccKjHWk1
 Rt00XKnk+ZYvUwA5iNjBLWm2oSxGzgtONs4UHLfZo/TZKsc/yv3Nsfq5MDaXu9r1UQbedREc
 V//3rj/R3Hi4IHJl3m4tvrhcBmA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e95d21d.7fe913496d88-smtp-out-n01;
 Tue, 14 Apr 2020 15:09:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1E73AC433CB; Tue, 14 Apr 2020 15:09:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=2.0 tests=ALL_TRUSTED,MISSING_DATE,
        MISSING_MID,SPF_NONE autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9A766C433BA;
        Tue, 14 Apr 2020 15:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9A766C433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] qtnfmac: Simplify code in _attach functions
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200407193233.9439-1-christophe.jaillet@wanadoo.fr>
References: <20200407193233.9439-1-christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     imitsyanko@quantenna.com, avinashp@quantenna.com,
        smatyukevich@quantenna.com, davem@davemloft.net,
        huangfq.daxian@gmail.com, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
User-Agent: pwcli/0.0.0-git (https://github.com/kvalo/pwcli/) Python/2.7.12
Message-Id: <20200414150917.1E73AC433CB@smtp.codeaurora.org>
Date:   Tue, 14 Apr 2020 15:09:17 +0000 (UTC)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> There is no need to re-implement 'netdev_alloc_skb_ip_align()' here.
> Keep the code simple.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>

Patch applied to wireless-drivers-next.git, thanks.

c960e2b384ef qtnfmac: Simplify code in _attach functions

-- 
https://patchwork.kernel.org/patch/11478939/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
