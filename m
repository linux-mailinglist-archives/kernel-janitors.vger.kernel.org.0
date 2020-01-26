Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 937EA149BE5
	for <lists+kernel-janitors@lfdr.de>; Sun, 26 Jan 2020 17:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgAZQhl (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 26 Jan 2020 11:37:41 -0500
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:40427 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgAZQhl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 26 Jan 2020 11:37:41 -0500
Received: from [192.168.42.210] ([93.22.150.172])
        by mwinf5d59 with ME
        id v4dd2100H3jRAMH034deJN; Sun, 26 Jan 2020 17:37:39 +0100
X-ME-Helo: [192.168.42.210]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 26 Jan 2020 17:37:39 +0100
X-ME-IP: 93.22.150.172
X-Mozilla-News-Host: news://news.gmane.org:119
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [RFC] Simplify flush_workqueue/destroy_workqueue pattern
To:     Kernel Janitors <kernel-janitors@vger.kernel.org>,
        David Miller <davem@davemloft.net>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Julia Lawall <Julia.Lawall@lip6.fr>
Message-ID: <c610718c-4e98-749b-13a8-c23f57988383@wanadoo.fr>
Date:   Sun, 26 Jan 2020 17:37:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

According to description of 'destroy_workqueue()':
    "Safely destroy a workqueue. All work currently pending will be done 
first"

Looking deeper at the code, it turns out that the call chain is:
        destroy_workqueue
    --> drain_workqueue
    --> flush_workqueue

So, calling explicitly 'flush_workqueue()' before 'destroy_workqueue()' 
looks redundant.

Using following coccinelle script spots ~90 occurrences, in ~80 files, 
which can be simplified.

 >>>>>>>>>>>>>>>
@r@
expression e;
@@
-    flush_workqueue(e);
      destroy_workqueue(e);
 >>>>>>>>>>>>>>>

This is way to much for me because my patch submission process is mainly 
manual.

If you agree with my analysis, think that removing these redundant calls 
is useful and have a much more automated patch submission process than 
me (or just have time :), please feel free to submit patches.

Best regards,
CJ


