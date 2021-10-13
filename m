Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5688A42B705
	for <lists+kernel-janitors@lfdr.de>; Wed, 13 Oct 2021 08:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237900AbhJMGY6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 13 Oct 2021 02:24:58 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:44863 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhJMGY5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 13 Oct 2021 02:24:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634106175; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=AhXYz1Ss+Q8rkEhE3NsNaZvgoGqRaJkpgTQWVFfUO3s=;
 b=RcT1WLmV/pmvvSI+qcExNjEumThmEUxrKSHq09VZq56MWKqq2Y+sEpn4lXl6G/XGMgGTpy/H
 LjEeWJpaKGQ9EEgxAbAvuzqF8JF0Q/6MqsPHw8KiYBg1eVvu96c3rMCpYXWhOoItdG8qOIR6
 dBzKAdrPCvTN3dTWaVB2EIuEvys=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 61667b2b22fe3a98e52006be (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Oct 2021 06:22:35
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3C689C43635; Wed, 13 Oct 2021 06:22:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        MISSING_DATE,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9CEB0C4338F;
        Wed, 13 Oct 2021 06:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9CEB0C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wireless: Remove redundant 'flush_workqueue()' calls
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0855d51423578ad019c0264dad3fe47a2e8af9c7.1633849511.git.christophe.jaillet@wanadoo.fr>
References: <0855d51423578ad019c0264dad3fe47a2e8af9c7.1633849511.git.christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     davem@davemloft.net, kuba@kernel.org, stf_xl@wp.pl,
        luciano.coelho@intel.com, amitkarwar@gmail.com,
        ganapathi017@gmail.com, sharvari.harisangam@nxp.com,
        huxinming820@gmail.com, ajay.kathat@microchip.com,
        claudiu.beznea@microchip.com, imitsyanko@quantenna.com,
        geomatsi@gmail.com, pkshih@realtek.com, jussi.kivilinna@iki.fi,
        pizza@shaftnet.org, netdev@vger.kernel.org,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163410614672.12983.17840128488800374930.kvalo@codeaurora.org>
Date:   Wed, 13 Oct 2021 06:22:34 +0000 (UTC)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
> 
> Remove the redundant 'flush_workqueue()' calls.
> 
> This was generated with coccinelle:
> 
> @@
> expression E;
> @@
> - 	flush_workqueue(E);
> 	destroy_workqueue(E);
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied to wireless-drivers-next.git, thanks.

ff1cc2fa3055 wireless: Remove redundant 'flush_workqueue()' calls

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/0855d51423578ad019c0264dad3fe47a2e8af9c7.1633849511.git.christophe.jaillet@wanadoo.fr/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

