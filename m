Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73BCF4A5C56
	for <lists+kernel-janitors@lfdr.de>; Tue,  1 Feb 2022 13:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238132AbiBAMcz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 1 Feb 2022 07:32:55 -0500
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]:58247 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236453AbiBAMcy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Feb 2022 07:32:54 -0500
Received: from [192.168.1.18] ([90.126.236.122])
        by smtp.orange.fr with ESMTPA
        id EsL6nNxOhIz5VEsL6nR6YE; Tue, 01 Feb 2022 13:32:53 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Tue, 01 Feb 2022 13:32:53 +0100
X-ME-IP: 90.126.236.122
Message-ID: <7c34009b-0d34-baa8-f4ff-68f2203422c5@wanadoo.fr>
Date:   Tue, 1 Feb 2022 13:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] powerpc/xive: Add some error handling code to
 'xive_spapr_init()'
Content-Language: en-US
To:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
        allison@lohutok.net, tglx@linutronix.de, clg@kaod.org,
        groug@kaod.org
Cc:     kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
References: <20190801110956.8517-1-christophe.jaillet@wanadoo.fr>
 <1ea13a2a-90fd-07d3-2031-19e81ea349b4@csgroup.eu>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <1ea13a2a-90fd-07d3-2031-19e81ea349b4@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 01/02/2022 à 12:31, Christophe Leroy a écrit :
> Hi,
> 
> Le 01/08/2019 à 13:09, Christophe JAILLET a écrit :
>> 'xive_irq_bitmap_add()' can return -ENOMEM.
>> In this case, we should free the memory already allocated and return
>> 'false' to the caller.
>>
>> Also add an error path which undoes the 'tima = ioremap(...)'
> 
> This old patch doesn't apply, if it is still relevant can you please 
> rebase ?
> 
> Thanks
> Christophe
> 

Hi, funny to see a 2 1/2 years old patch to pop-up like that :)
It still looks relevant to me.

V2 sent.
Still not compile tested.

CJ
