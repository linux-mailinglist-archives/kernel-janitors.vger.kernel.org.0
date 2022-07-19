Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4065792A6
	for <lists+kernel-janitors@lfdr.de>; Tue, 19 Jul 2022 07:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236843AbiGSFss (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 Jul 2022 01:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236807AbiGSFsr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Jul 2022 01:48:47 -0400
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr [80.12.242.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1050F2E6BF
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Jul 2022 22:48:46 -0700 (PDT)
Received: from [192.168.1.18] ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id Dg66oBzKQAZYmDg66oBFmI; Tue, 19 Jul 2022 07:48:43 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Tue, 19 Jul 2022 07:48:43 +0200
X-ME-IP: 90.11.190.129
Message-ID: <41a06588-d2ae-622f-0d39-77209aad060a@wanadoo.fr>
Date:   Tue, 19 Jul 2022 07:48:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] RDMA/qib: Use the bitmap API when applicable
Content-Language: en-US
To:     Leon Romanovsky <leon@kernel.org>
Cc:     Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Roland Dreier <rolandd@cisco.com>,
        Ralph Campbell <ralph.campbell@qlogic.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-rdma@vger.kernel.org
References: <33d8992586d382bec8b8efd83e4729fb7feaf89e.1656834106.git.christophe.jaillet@wanadoo.fr>
 <YtRPaSNV0UPn/nMk@unreal>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <YtRPaSNV0UPn/nMk@unreal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 17/07/2022 à 20:05, Leon Romanovsky a écrit :
> On Sun, Jul 03, 2022 at 09:42:48AM +0200, Christophe JAILLET wrote:
>> Using the bitmap API is less verbose than hand writing them.
>> It also improves the semantic.
>>
>> While at it, initialize the bitmaps. It can't hurt.
>>
>> Fixes: f931551bafe1 ("IB/qib: Add new qib driver for QLogic PCIe InfiniBand adapters")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/infiniband/hw/qib/qib_iba7322.c | 23 ++++++++---------------
>>   1 file changed, 8 insertions(+), 15 deletions(-)
>>
> 
> I removed the Fixes line as there is no bug in changed code, just update
> to use better in-kernel API.

NP for me.

I added the Fixes tag in case the apparently missing zeroing of the 
bitmaps was a potential issue. I've not looked enough at the code to 
make sure if it was needed or not.

CJ

> 
> Thanks, applied.
> 

