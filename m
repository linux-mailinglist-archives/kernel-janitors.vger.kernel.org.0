Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC331C472B
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 May 2020 21:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgEDTl0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 4 May 2020 15:41:26 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:24118 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbgEDTl0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 4 May 2020 15:41:26 -0400
Received: from [192.168.42.210] ([93.23.15.109])
        by mwinf5d38 with ME
        id ajhM2200G2MArYl03jhMqw; Mon, 04 May 2020 21:41:22 +0200
X-ME-Helo: [192.168.42.210]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 04 May 2020 21:41:22 +0200
X-ME-IP: 93.23.15.109
Subject: Re: question about lists
To:     Julia Lawall <julia.lawall@inria.fr>,
        kernel-janitors@vger.kernel.org
References: <alpine.DEB.2.21.2005032308500.2533@hadrien>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <07ecfa7c-897b-5bea-e84b-f0626f019842@wanadoo.fr>
Date:   Mon, 4 May 2020 21:41:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2005032308500.2533@hadrien>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 03/05/2020 à 23:10, Julia Lawall a écrit :
> Hello,
>
> I was wondering what is the point of code like the following:
>
>          INIT_LIST_HEAD(&bb->list);
>          list_add(&bb->list, &s->workload->shadow_bb);
>
> As far as I can see, list_add will initialize both fields of the list_head
> structure without looking at their values, so why is the INIT_LIST_HEAD
> needed?
>
> thanks,
> julia
>
Hi,

I agree with you. I don't see the need of 'INIT_LIST_HEAD' here.

The only reasons I could see are:
    - initializing an "object" looks a safe thing to do before using it, 
even if useless.
    - in your example, before commit f52c380a48f52, it was allocated 
with kmalloc, so it was maybe to avoid a really unlikely 
'__list_add_valid' failure. Now that it is kzalloc'ed, this can not 
happen anymore.

Just my 2c.

CJ

