Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA86570C3D
	for <lists+kernel-janitors@lfdr.de>; Tue, 23 Jul 2019 00:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731713AbfGVWA3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 22 Jul 2019 18:00:29 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:39988 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726553AbfGVWA3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 Jul 2019 18:00:29 -0400
Received: from [192.168.1.41] ([92.140.204.221])
        by mwinf5d78 with ME
        id fy0S200024n7eLC03y0SST; Tue, 23 Jul 2019 00:00:26 +0200
X-ME-Helo: [192.168.1.41]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 23 Jul 2019 00:00:26 +0200
X-ME-IP: 92.140.204.221
Subject: Re: [PATCH][next] clk: Si5341/Si5340: remove redundant assignment to
 n_den
To:     Stephen Boyd <sboyd@kernel.org>,
        Colin King <colin.king@canonical.com>,
        linux-clk@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Newsgroups: gmane.linux.kernel,gmane.linux.kernel.clk,gmane.linux.kernel.janitors
References: <20190701165020.19840-1-colin.king@canonical.com>
 <20190722212414.6EF8D21900@mail.kernel.org>
 <d1cd2b10-8fd4-f224-3bcd-5b938f72d249@wanadoo.fr>
 <20190722215314.9F4F121951@mail.kernel.org>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <a92ca50d-b33e-8779-294c-301535d0f0d5@wanadoo.fr>
Date:   Tue, 23 Jul 2019 00:00:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190722215314.9F4F121951@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 22/07/2019 à 23:53, Stephen Boyd a écrit :
> Quoting Christophe JAILLET (2019-07-22 14:43:32)
>> Le 22/07/2019 à 23:24, Stephen Boyd a écrit :
>>> Please Cc authors of drivers so they can ack/review.
>>>
>>> Adding Mike to take a look.
>>>
>>> Quoting Colin King (2019-07-01 09:50:20)
>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>
>>>> The variable n_den is initialized however that value is never read
>>>> as n_den is re-assigned a little later in the two paths of a
>>>> following if-statement.  Remove the redundant assignment.
>>>>
>>>> Addresses-Coverity: ("Unused value")
>>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>>> ---
>>>>    drivers/clk/clk-si5341.c | 1 -
>>>>    1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
>>>> index 72424eb7e5f8..6e780c2a9e6b 100644
>>>> --- a/drivers/clk/clk-si5341.c
>>>> +++ b/drivers/clk/clk-si5341.c
>>>> @@ -547,7 +547,6 @@ static int si5341_synth_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>>>>           bool is_integer;
>>>>    
>>>>           n_num = synth->data->freq_vco;
>>>> -       n_den = rate;
>>>>    
>>>>           /* see if there's an integer solution */
>>>>           r = do_div(n_num, rate);
>> Hi,
>>
>> I got the same advise from some else no later than yesterday (i.e. email
>> the author...)
>> Maybe 'get_maintainer.pl' could be improved to search for it and propose
>> the mail automatically?
>>
>> just my 2c.
>>
> Use --git option of get_maintainer.pl?
>
>
I don't use it explicitly, but the suggestions I get include some git 
history, so I guess that it is on by default.

I was thinking at parsing files to see if MODULE_AUTHOR includes an email.

CJ


