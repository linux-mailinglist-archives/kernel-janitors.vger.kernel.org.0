Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 730B5246461
	for <lists+kernel-janitors@lfdr.de>; Mon, 17 Aug 2020 12:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgHQKWi (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 17 Aug 2020 06:22:38 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:20041 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728027AbgHQKWd (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 Aug 2020 06:22:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597659752; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=UHi/ozRmVDf+5fekjlpSZStl+2B7AhNxn2mgkOsi3Ew=;
 b=S5jt0WzqXseUsqQqQoO679PGQ3PPfg/UJOvOpSecCF01X6NDaih7GmuGJb+A/JiUeJbyKl5Y
 Ys01EMYhktNF+KGD6FbKBqnRxIrL8q06NYOX1990CrkIIdBWiLlVF462O71CVt+oW7SiUBFV
 ctbFewDGtaS4n+On5XB/97V38zk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f3a5a5ecbcd42bdeee529d3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 10:22:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 66AFAC433C6; Mon, 17 Aug 2020 10:22:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=2.0 tests=ALL_TRUSTED,MISSING_DATE,
        MISSING_MID,SPF_NONE autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B5A54C433C6;
        Mon, 17 Aug 2020 10:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B5A54C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ath6kl: prevent potential array overflow in
 ath6kl_add_new_sta()
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200813141315.GB457408@mwanda>
References: <20200813141315.GB457408@mwanda>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Jouni Malinen <jouni@qca.qualcomm.com>,
        linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20200817102221.66AFAC433C6@smtp.codeaurora.org>
Date:   Mon, 17 Aug 2020 10:22:21 +0000 (UTC)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The value for "aid" comes from skb->data so Smatch marks it as
> untrusted.  If it's invalid then it can result in an out of bounds array
> access in ath6kl_add_new_sta().
> 
> Fixes: 572e27c00c9d ("ath6kl: Fix AP mode connect event parsing and TIM updates")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

54f9ab7b8709 ath6kl: prevent potential array overflow in ath6kl_add_new_sta()

-- 
https://patchwork.kernel.org/patch/11712551/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

