Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7D341EA2A8
	for <lists+kernel-janitors@lfdr.de>; Mon,  1 Jun 2020 13:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbgFALbn (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 1 Jun 2020 07:31:43 -0400
Received: from ciao.gmane.io ([159.69.161.202]:54270 "EHLO ciao.gmane.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725838AbgFALbn (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 1 Jun 2020 07:31:43 -0400
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glkj-kernel-janitors-2@m.gmane-mx.org>)
        id 1jfifM-000Puj-Ll
        for kernel-janitors@vger.kernel.org; Mon, 01 Jun 2020 13:31:40 +0200
X-Injected-Via-Gmane: http://gmane.org/
To:     kernel-janitors@vger.kernel.org
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()'
 which is unused and broken
Date:   Mon, 1 Jun 2020 13:31:23 +0200
Message-ID: <a2e34c9a-676f-d83f-f395-7428af038c16@wanadoo.fr>
References: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>
 <87h7vvb1s3.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
In-Reply-To: <87h7vvb1s3.fsf@belgarion.home>
Content-Language: en-US
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 01/06/2020 à 10:58, Robert Jarzmik a écrit :
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:
>
>> Commit 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for pinctrl registration")
>> has turned a 'pinctrl_register()' into 'devm_pinctrl_register()' in
>> 'pxa2xx_pinctrl_init()'.
>> However, the corresponding 'pinctrl_unregister()' call in
>> 'pxa2xx_pinctrl_exit()' has not been removed.
>>
>> This is not an issue, because 'pxa2xx_pinctrl_exit()' is unused.
>> Remove it now to avoid some wondering in the future and save a few LoC.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
>
> Would be even a better patch with a :
> Fixes: 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for pinctrl registration")

I was wondering it was was needed in this case.
The patch does not really fix anything, as the function is unused. Or it 
fixes things on a theoretical point of view.

CJ


> Cheers.
>
> --
> Robert
>


