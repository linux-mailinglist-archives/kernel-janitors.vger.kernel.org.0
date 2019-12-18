Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8455C125124
	for <lists+kernel-janitors@lfdr.de>; Wed, 18 Dec 2019 19:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbfLRS7P (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 18 Dec 2019 13:59:15 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:13925 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726998AbfLRS7P (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 18 Dec 2019 13:59:15 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576695554; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=lorpf9l1c2tGe+jlnio4H5ySEJQwDFjOW0cpc5mQx78=;
 b=rciycJgtJ89wVpJsJNZccpCBnJ28u9mMEhvVd4oMRcJ0Wh5jjer3/AplQk201gax7R7RQeje
 jBv+lOUk6mqi9hEsoZNguX9FA/had3mp3YjgQW4Z4GYu5VxcMrTUACwQ2u1Gyey2IPzrs3xO
 M2OS6+GPWe83n2nNHgM89CSIT4k=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfa76fd.7ff8ec5c7260-smtp-out-n03;
 Wed, 18 Dec 2019 18:59:09 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 49115C4479C; Wed, 18 Dec 2019 18:59:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=2.0 tests=ALL_TRUSTED,MISSING_DATE,
        MISSING_MID,SPF_NONE autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E83FCC433CB;
        Wed, 18 Dec 2019 18:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E83FCC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] rt2x00usb: Fix a warning message in
 'rt2x00usb_watchdog_tx_dma()'
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191204054355.11729-1-christophe.jaillet@wanadoo.fr>
References: <20191204054355.11729-1-christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     sgruszka@redhat.com, helmut.schaa@googlemail.com,
        davem@davemloft.net, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
User-Agent: pwcli/0.0.0-git (https://github.com/kvalo/pwcli/) Python/2.7.12
Message-Id: <20191218185908.49115C4479C@smtp.codeaurora.org>
Date:   Wed, 18 Dec 2019 18:59:08 +0000 (UTC)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> 'forced' is duplicated in the message, axe one of them.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied to wireless-drivers-next.git, thanks.

ffc7b2826a3c rt2x00usb: Fix a warning message in 'rt2x00usb_watchdog_tx_dma()'

-- 
https://patchwork.kernel.org/patch/11272155/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
