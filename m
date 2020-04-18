Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 199AD1AF501
	for <lists+kernel-janitors@lfdr.de>; Sat, 18 Apr 2020 22:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgDRUzJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 18 Apr 2020 16:55:09 -0400
Received: from ciao.gmane.io ([159.69.161.202]:32974 "EHLO ciao.gmane.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726014AbgDRUzJ (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 18 Apr 2020 16:55:09 -0400
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glkj-kernel-janitors-2@m.gmane-mx.org>)
        id 1jPuUV-000DRE-DM
        for kernel-janitors@vger.kernel.org; Sat, 18 Apr 2020 22:55:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To:     kernel-janitors@vger.kernel.org
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] m68k/PCI: Fix a memory leak in an error handling path
Date:   Sat, 18 Apr 2020 22:55:00 +0200
Message-ID: <ea3d9b35-4409-fb86-8855-0ddb73989829@wanadoo.fr>
References: <2e00c1f1-8faa-5045-ddf5-2bf943f714f2@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Cc:     linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <2e00c1f1-8faa-5045-ddf5-2bf943f714f2@web.de>
Content-Language: en-US
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 18/04/2020 à 22:00, Markus Elfring a écrit :
>> If 'ioremap' fails, we must free 'bridge', as done in other error handling
>> path bellow.
> I suggest to improve this change description.

I suggest you stop proposing over and over useless comments.
Please just ignore my proposals as I do for your boring, never 
constructing, replies.


> * Please avoid a typo.
>
> * Is an imperative wording preferred?
>
* is Melissa still around?

> …
>> +++ b/arch/m68k/coldfire/pci.c
>> @@ -216,8 +216,10 @@ static int __init mcf_pci_init(void)
> …
>
> I propose to move the pci_free_host_bridge() call for the desired

I propose to let patch submitter and maintainer decide about it.
I don't need your point of view. I guess that maintainers don't either.

No need to waste time trying to engage any discussion with me.
This is the first and very last exchange we will ever have.

Best regards,
CJ


> exception handling to the end of this function implementation.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=c0d73a868d9b411bd2d0c8e5ff9d98bfa8563cb1#n450
>
> Regards,
> Markus
>


