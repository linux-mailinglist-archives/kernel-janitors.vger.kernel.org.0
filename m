Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D03DA1F3FD9
	for <lists+kernel-janitors@lfdr.de>; Tue,  9 Jun 2020 17:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730947AbgFIPvB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 9 Jun 2020 11:51:01 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:33910 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728888AbgFIPvA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 9 Jun 2020 11:51:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591717859; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=L2RvbGPsA2kvMC3pVbmeJgOrqYdiDNvCRMHV2qaWaZg=;
 b=Gdg57ztfhlzhqTJ7d+VThBqTA2H0RKBFCqDsErbw/oBA2X+PWWelWSYAzK01iCsAhjzWi7FL
 tArdZfkgp7P5eTlj6oXf2BLR8DBYnJSoC2bFGI1Vd0KXI2GcFKCkU9KA5IIB2VyRhDjcbmob
 VtHBRCcBGyXFW1utOk5qOaLty3o=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5edfafd4fe1db4db899d611f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Jun 2020 15:50:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 63AD0C433A0; Tue,  9 Jun 2020 15:50:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: gubbaven)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D666DC433CA;
        Tue,  9 Jun 2020 15:50:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 09 Jun 2020 21:20:43 +0530
From:   gubbaven@codeaurora.org
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        hemantg@codeaurora.org, Johan Hedberg <johan.hedberg@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rocky Liao <rjliao@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Claire Chang <tientzu@chromium.org>, yshavit@google.com,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: hci_qca: Fix double free during SSR timeout
In-Reply-To: <d3444be6-28e6-bef5-08cf-6038620f65c6@web.de>
References: <d3444be6-28e6-bef5-08cf-6038620f65c6@web.de>
Message-ID: <51c4dfe5daf8497bd99a013458d93b92@codeaurora.org>
X-Sender: gubbaven@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Markus,

Sure we will update in next patch set.

Regards,
Lakshmi Narayna.
On 2020-06-04 23:54, Markus Elfring wrote:
>> Due to race conditions between qca_hw_error and qca_controller_memdump
>> during SSR timeout,the same pointer is freed twice.
> 
> This is an unfortunate software situation.
> 
> 
>> Which results to double free error.
> 
> How do you think about to omit this sentence from the change 
> description?
> 
> 
>> Now a lock is acquired while SSR state moved to timeout.
> 
> I suggest to convert this information into an imperative wording.
> 
> Would you like to add the tag “Fixes” to the commit message?
> 
> Regards,
> Markus
