Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 531F51A38F6
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 Apr 2020 19:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgDIReT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 9 Apr 2020 13:34:19 -0400
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]:17877 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbgDIReT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 Apr 2020 13:34:19 -0400
Received: from [192.168.42.210] ([93.22.150.119])
        by mwinf5d45 with ME
        id QhaD2200X2aoYT903haGET; Thu, 09 Apr 2020 19:34:17 +0200
X-ME-Helo: [192.168.42.210]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 09 Apr 2020 19:34:17 +0200
X-ME-IP: 93.22.150.119
Subject: Re: [PATCH] checkpatch: check for missing \n at the end of logging
 message
To:     Joe Perches <joe@perches.com>, apw@canonical.com,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Newsgroups: gmane.linux.kernel,gmane.linux.kernel.janitors
References: <20200407204908.10420-1-christophe.jaillet@wanadoo.fr>
 <8617a6b94c0644bce1fd4ca77309d67a612e6300.camel@perches.com>
 <4b7e1cf3-6fa7-60af-a1d3-2457339dbe8a@wanadoo.fr>
 <efb5a518fdc47f0120b94a7e8a95d275c0f4ad43.camel@perches.com>
 <60c732a1-aa4e-afab-d223-894a67713003@wanadoo.fr>
 <bcdfa5ae68b8cb7d9324a89aedf452f6209b570c.camel@perches.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <05379b22-6755-368b-8127-8827fa020189@wanadoo.fr>
Date:   Thu, 9 Apr 2020 19:34:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <bcdfa5ae68b8cb7d9324a89aedf452f6209b570c.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 09/04/2020 à 17:29, Joe Perches a écrit :
> On Thu, 2020-04-09 at 09:24 +0200, Christophe JAILLET wrote:
>> I think that, at least printk(), WARN() and co, and panic() should also
>> be handled the same way.
> Maybe.
>
>> A few files (5 according to my grep) also have something like:
>>      #define pr_fmt(fmt) "bcache: %s()" fmt "\n", __func__
>> and then sometimes a mix of pr_xxx() with either trailing \n or not.
> Didn't know about those.
>
>> Maybe those should be handled manually to be consistent and avoid a "\n"
>> in pr_fmt which is not widely used in other files
> More likely the pr_fmt should have the \n removed and added
> to the uses.
Yes agreed.
> $ git grep -P 'define\s+pr_fmt.*\\n'
> drivers/clocksource/timer-davinci.c:#define pr_fmt(fmt) "%s: " fmt "\n", __func__
https://marc.info/?l=linux-kernel&m=158642435216181&w=4 (which has been 
acked)

> lib/math/prime_numbers.c:#define pr_fmt(fmt) "prime numbers: " fmt "\n"
> lib/test_hash.c:#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt "\n"
Patches proposed.
> lib/percpu-refcount.c:#define pr_fmt(fmt) "%s: " fmt "\n", __func__
In this file, there are some WARN_ON.
Are these log functions also influenced by pr_fmt?
> drivers/md/bcache/bcache.h:#define pr_fmt(fmt) "bcache: %s() " fmt "\n", __func__
> drivers/md/bcache/bset.c:#define pr_fmt(fmt) "bcache: %s() " fmt "\n", __func__
> tools/usb/usbip/libsrc/usbip_common.h:#define pr_fmt(fmt)       "%s: %s: " fmt "\n", PROGNAME

Tricky because all files that include it have to be checked.
I won't touch these ones.

CJ

