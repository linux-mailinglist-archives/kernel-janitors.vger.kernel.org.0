Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC8B36341D
	for <lists+kernel-janitors@lfdr.de>; Sun, 18 Apr 2021 08:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234846AbhDRGgo (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 18 Apr 2021 02:36:44 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:38273 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbhDRGgo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 18 Apr 2021 02:36:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618727776; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=3JIVMHOahL7BQlBr4OBrtZYdE0AiOBGQfswRQ3QJbFA=;
 b=e97cqifjuhL5zmHsoNm+R0YLoPgtIRVzAoCJ7pwvhLrvw/1+AQrSqZIINEwc1IKW1lGVFybj
 9jN26D7QWUU/MY8azT9pnCv0WeGA/tDdgd6k3B6cheFTNwasyF6XBApfgEfvpZfy9qqMilyi
 1Fsae8DkbKRJVDnfo6sNBRgZO3E=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 607bd358853c0a2c4616d0cf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 18 Apr 2021 06:36:08
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 97C89C4323A; Sun, 18 Apr 2021 06:36:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        MISSING_DATE,MISSING_MID,SPF_FAIL autolearn=no autolearn_force=no
        version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 24DC9C433F1;
        Sun, 18 Apr 2021 06:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 24DC9C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] carl9170: remove get_tid_h
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <68efad7a597159e22771d37fc8b4a8a613866d60.1617399010.git.christophe.jaillet@wanadoo.fr>
References: <68efad7a597159e22771d37fc8b4a8a613866d60.1617399010.git.christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     chunkeey@googlemail.com, davem@davemloft.net, kuba@kernel.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210418063607.97C89C4323A@smtp.codeaurora.org>
Date:   Sun, 18 Apr 2021 06:36:07 +0000 (UTC)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> 'get_tid_h()' is the same as 'ieee80211_get_tid()'.
> So this function can be removed to save a few lines of code.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Acked-by: Christian Lamparter <chunkeey@gmail.com>

Patch applied to wireless-drivers-next.git, thanks.

cf366b154704 carl9170: remove get_tid_h

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/68efad7a597159e22771d37fc8b4a8a613866d60.1617399010.git.christophe.jaillet@wanadoo.fr/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

