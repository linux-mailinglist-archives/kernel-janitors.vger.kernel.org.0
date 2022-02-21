Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7F64BE250
	for <lists+kernel-janitors@lfdr.de>; Mon, 21 Feb 2022 18:55:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355181AbiBUKm0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 21 Feb 2022 05:42:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355269AbiBUKkF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 21 Feb 2022 05:40:05 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C8CF3A
        for <kernel-janitors@vger.kernel.org>; Mon, 21 Feb 2022 02:02:03 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id bq11so6862944edb.2
        for <kernel-janitors@vger.kernel.org>; Mon, 21 Feb 2022 02:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kMIEQ6EmXrcKF9QOgwi4JP+rN/GpqbWH/lqcMa8liiA=;
        b=QQbUtc7TFLde+vu666fP1jpn3ZV0FX04icLIemzeQRGi911a0jMrdL8vJdmL3pepEi
         6okCY+lM3vY8PCpbLkL0CN1RQ4ccaCqElG9sY+NLCKb3+FcPSFZopQ52JY04uQApqnML
         Q4cY5EH3iUC6W+Su0VttBmEwgrjlKWAQYvTGBsWINSb5FBW79dNR5AY4+0ePzW4cOSBz
         Q0sUk5AIW65Wwz/1e5NuOnsKKgKEjkWiLU4zNXi8yPSJJtSQpBUtIyP/KtVR7SCVX7xF
         /nGHil8Eqxvg9T8QZOz9HbijZq4GNAT7JXWKEOQyr7dui6njbDWHiKdx9LVYzym+qEK1
         yy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kMIEQ6EmXrcKF9QOgwi4JP+rN/GpqbWH/lqcMa8liiA=;
        b=Nb6eybfDWRQKPWq5aAwCN8+7Rvv1PQYD2k36f/mgWMRlcYjCbMPBe7dPg5No4wUCSz
         R5JyBO18elpEWgrO9dU9hk3zxCDmmkMp0nmh93SrsmXpAM+ShfdMXItSMX1Y3yWwyFyE
         hKzrzEl2b2xg29/oPzCzrxGfuMM+GQrvHux6iAj0DurvkJDP8hejV5ayUje6zgSvNt6s
         +iCiyVrTMZ90O91+stzQPjhXrLBKLiRddwQisq1pIcd4UgORL+Uc75u4blajbLHabeUD
         7ZlEdSSxxNkYoS2OSiO+nX6MiNeizDrQN6jzV1gCo3ifdmqvfQmDhi243SuL69ay7JhU
         W4+w==
X-Gm-Message-State: AOAM532BCqw2o8C5uuE7LzeovxJgXSNZag97WEAAUxgINqUsIVW1vVzg
        Oqp6QhhH7mGZKLsYZg/+fQlgrMoIeahNbw==
X-Google-Smtp-Source: ABdhPJwoxhTQ66ov81uyxAEEkMdXe2eNB3Eu5awgfYyKsjlTo0UYbaWCPMaaN9gxOKo3lAv87zWjkw==
X-Received: by 2002:a50:f686:0:b0:410:e352:e61a with SMTP id d6-20020a50f686000000b00410e352e61amr19883345edn.23.1645437721836;
        Mon, 21 Feb 2022 02:02:01 -0800 (PST)
Received: from ?IPV6:2a02:768:2307:40d6::f9e? ([2a02:768:2307:40d6::f9e])
        by smtp.gmail.com with ESMTPSA id gs6sm702985ejb.17.2022.02.21.02.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 02:02:01 -0800 (PST)
Message-ID: <f874a9c7-8d8d-fecc-8fc9-51dcf37cf60b@monstr.eu>
Date:   Mon, 21 Feb 2022 11:02:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] iio: adc: xilinx-ams: Use devm_delayed_work_autocancel()
 to simplify code
Content-Language: en-US
To:     Jonathan Cameron <jic23@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <2626e6a057e40cd2271ef0e5f81d12e607bad5b4.1644776929.git.christophe.jaillet@wanadoo.fr>
 <20220220114552.53fedd33@jic23-huawei>
From:   Michal Simek <monstr@monstr.eu>
In-Reply-To: <20220220114552.53fedd33@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 2/20/22 12:45, Jonathan Cameron wrote:
> On Sun, 13 Feb 2022 19:29:05 +0100
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> 
>> Use devm_delayed_work_autocancel() instead of hand writing it. This is
>> less verbose and saves a few lines of code.
>>
>> devm_delayed_work_autocancel() uses devm_add_action() instead of
>> devm_add_action_or_reset(). This is fine, because if the underlying memory
>> allocation fails, no work has been scheduled yet. So there is nothing to
>> undo.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Looks good to me, but I'd ideally like some input from someone familiar with
> the driver.

Anand told me that the change is fine that's why here is my
Acked-by: Michal Simek <michal.simek@xilinx.com>

Jonathan: Anand decided to do change in his carrier that's why that emails won't 
go through. But I am still around if you need something xilinx/amd to test.

Thanks,
Michal
