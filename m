Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85015BF568
	for <lists+kernel-janitors@lfdr.de>; Thu, 26 Sep 2019 17:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbfIZPBY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 26 Sep 2019 11:01:24 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:36318 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbfIZPBY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Sep 2019 11:01:24 -0400
Received: from mail-pl1-f200.google.com ([209.85.214.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <connor.kuehl@canonical.com>)
        id 1iDVGk-0007Px-Df
        for kernel-janitors@vger.kernel.org; Thu, 26 Sep 2019 15:01:22 +0000
Received: by mail-pl1-f200.google.com with SMTP id c14so1657132plo.12
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Sep 2019 08:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xtkPkpjPrpLQmsDNk7AeQ5yhyxjhIB2F104oGv/w96M=;
        b=fIHs1QvMmqMqZ4BgnYZVj9WXUq1IDei0QMztMA80Q05lRJT8iRjPIlKTslH/aGMwmT
         sxn2VTbNQKtEfQ9AaX2ORkTx4xzWTI0wuxwBSSr3BoSem3jr49toFPHsEiQG7a8QmQfq
         WkG8rdRlcGRzwAG9B1rMSlExXEY7Ya533o8YOkwBm6hJ6u3D+h454GtwKUgBAWTaInVw
         8tT+PcSG8KUlLxtHX0W5TXYkU2hGyTZlIa4KmIhDEAnb3Ajr+Ji735/a98dAgwOgIFmT
         rD6RQPy18iCyn62pNNll5M31asXUt3gibi8/4yxSdQEp8HhZcxYAyXBTg4xgn5YMI8oQ
         jeog==
X-Gm-Message-State: APjAAAWwVbqByK6cn3zLpYxE8oLG1ed6ti/jQVqiVlW7nMZr0RDiexpX
        uhIgfsLDCkRM8A8FN+qW2vJx0EBptO2+D6L9ZnvsBqJMDHSNzy/gs0rZqfNTHzf5NbcGUIol63b
        EAOz76FTROv+QNRqC8oLAdYLxNaHaLIfV+zEwuveA9c4uBw==
X-Received: by 2002:a63:cf0a:: with SMTP id j10mr3759962pgg.388.1569510080736;
        Thu, 26 Sep 2019 08:01:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy+KG/m+nUPYl05tzsMpdfhCOOO+3WkdwpahkeH8luyF61fGMjp2KK5Rg8NNxKKg+mI1gcMgw==
X-Received: by 2002:a63:cf0a:: with SMTP id j10mr3759931pgg.388.1569510080411;
        Thu, 26 Sep 2019 08:01:20 -0700 (PDT)
Received: from [192.168.0.179] (c-24-20-45-88.hsd1.or.comcast.net. [24.20.45.88])
        by smtp.gmail.com with ESMTPSA id q3sm2650205pgj.54.2019.09.26.08.01.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 08:01:19 -0700 (PDT)
Subject: Re: [PATCH] staging: rtl8188eu: fix possible null dereference
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        gregkh@linuxfoundation.org, straube.linux@gmail.com,
        devel@driverdev.osuosl.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20190925213215.25082-1-connor.kuehl@canonical.com>
 <b725820f-525c-519b-4474-476abf004985@lwfinger.net>
From:   Connor Kuehl <connor.kuehl@canonical.com>
Message-ID: <2f07d7cb-23a1-f5c0-af9f-1c3e19a7082c@canonical.com>
Date:   Thu, 26 Sep 2019 08:01:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b725820f-525c-519b-4474-476abf004985@lwfinger.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 9/25/19 5:05 PM, Larry Finger wrote:
> This change is a good one, but why not get the same fix at line 779?

Ah yes! Thanks for pointing that out. I missed that. I will send a V2 
shortly.

Thank you,

Connor

> 
> Larry
> 

