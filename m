Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2AC618AB4
	for <lists+kernel-janitors@lfdr.de>; Thu,  3 Nov 2022 22:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbiKCVhx (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 3 Nov 2022 17:37:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231683AbiKCVhg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Nov 2022 17:37:36 -0400
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A476220D1
        for <kernel-janitors@vger.kernel.org>; Thu,  3 Nov 2022 14:37:22 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id qhtno6Kk4KOP1qhtooADZI; Thu, 03 Nov 2022 22:37:20 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 03 Nov 2022 22:37:20 +0100
X-ME-IP: 86.243.100.34
Message-ID: <a0a59528-6af4-adb2-e4e2-cb4cbe15e986@wanadoo.fr>
Date:   Thu, 3 Nov 2022 22:37:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 12/30] input: Use kstrtobool() instead of strtobool()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-input@vger.kernel.org
References: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
 <4311e9cb62687449f4175e2b062abcd77aada059.1667336095.git.christophe.jaillet@wanadoo.fr>
 <Y2Qowvjn+7jT767t@google.com>
Content-Language: fr, en-GB
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <Y2Qowvjn+7jT767t@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 03/11/2022 à 21:46, Dmitry Torokhov a écrit :
> On Tue, Nov 01, 2022 at 10:14:00PM +0100, Christophe JAILLET wrote:
>> strtobool() is the same as kstrtobool().
>> However, the latter is more used within the kernel.
>>
>> In order to remove strtobool() and slightly simplify kstrtox.h, switch to
>> the other function name.
>>
>> While at it, include the corresponding header file (<linux/kstrtox.h>)
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Please feel free to merge with the rest of the series. Or let me know if
> you want me to pick just this one through my tree.
> 
> Thanks.
> 

Hi,

the patch can go through your tree.
There is no plan to merge the whole serie at once, and some other 
maintainers have asked for some patches to be re-sent as individual patches.

CJ
