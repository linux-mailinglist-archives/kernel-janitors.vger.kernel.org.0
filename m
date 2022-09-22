Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C10E05E60D7
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Sep 2022 13:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbiIVLWd (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 22 Sep 2022 07:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231310AbiIVLWb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Sep 2022 07:22:31 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B2AEE05D4
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Sep 2022 04:22:30 -0700 (PDT)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MYCSr2YVSzlWTn;
        Thu, 22 Sep 2022 19:18:20 +0800 (CST)
Received: from [10.174.178.41] (10.174.178.41) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 19:22:28 +0800
Message-ID: <1a6f854f-cf97-3f69-a897-cf92328de986@huawei.com>
Date:   Thu, 22 Sep 2022 19:22:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [cocci] [v2 1/2] coccinelle: locks: add missing_mutex_init.cocci
 script
To:     Markus Elfring <Markus.Elfring@web.de>,
        Julia Lawall <julia.lawall@inria.fr>
CC:     <cocci@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
        <kernel-janitors@vger.kernel.org>
References: <20220920025820.105924-1-yuancan@huawei.com>
 <0896e030-5060-08e7-d0de-c63d77c9ef27@web.de>
 <alpine.DEB.2.22.394.2209202211430.2740@hadrien>
 <92f6a7e6-cfbb-ee05-bbdd-dfa4c9abad4f@web.de>
From:   Yuan Can <yuancan@huawei.com>
In-Reply-To: <92f6a7e6-cfbb-ee05-bbdd-dfa4c9abad4f@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.41]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


在 2022/9/21 4:24, Markus Elfring 写道:
>>>> +@r3@
>>>> +identifier s, fld;
>>>> +position p != {r2.p};
>>> Why do you think that such a SmPL constraint would be required?
>>>
>>>
>>>> +@@
>>>> +
>>>> +struct s {
>>>> +  ...
>>>> +  struct mutex fld@p;
>>>> +  ...
>>>> +};
>>> Why would the source code search repetition matter here?
>> He is searching for a structure that is different from the ones matched previously.
> How many mutexes (or spin locks) should be initialised before further data
> processing can be safely performed with corresponding structures?

In my opinion, every mutexes and spin locks needs to be initialised 
before use.

Best regards,
Yuan Can

