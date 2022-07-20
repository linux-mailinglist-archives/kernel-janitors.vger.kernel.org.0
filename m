Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5688357B78D
	for <lists+kernel-janitors@lfdr.de>; Wed, 20 Jul 2022 15:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbiGTNcT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 20 Jul 2022 09:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbiGTNcS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 20 Jul 2022 09:32:18 -0400
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF75E6590
        for <kernel-janitors@vger.kernel.org>; Wed, 20 Jul 2022 06:32:17 -0700 (PDT)
Received: from [192.168.1.18] ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id E9o9ojg4KgXAiE9o9oZBCH; Wed, 20 Jul 2022 15:32:15 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Wed, 20 Jul 2022 15:32:15 +0200
X-ME-IP: 90.11.190.129
Message-ID: <a66632a1-9cde-1b3c-afa9-8f63bd4a9cf0@wanadoo.fr>
Date:   Wed, 20 Jul 2022 15:32:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/3] ocfs2: Remove a useless spinlock
Content-Language: en-US
To:     Joseph Qi <joseph.qi@linux.alibaba.com>
Cc:     David.Laight@ACULAB.COM, jlbec@evilplan.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        mark@fasheh.com, ocfs2-devel@oss.oracle.com
References: <bd6796635e58f9c47cf857573c3b9474a00ce26a.1658224839.git.christophe.jaillet@wanadoo.fr>
 <8ba7004d330cbe5f626539a8a3bff696d0c4285e.1658224839.git.christophe.jaillet@wanadoo.fr>
 <7b644e5d32d74d3d90dfc5b1786ae5b9@AcuMS.aculab.com>
 <29c3fbdd-7695-46c5-bb75-fe358c574ab3@wanadoo.fr>
 <07c924de-78bf-c993-ce73-635af71f4edd@linux.alibaba.com>
 <f313cb6f-de75-2447-eebc-5c240bc243a2@wanadoo.fr>
 <65e6bbcb-2c33-2e43-1826-a62387572310@linux.alibaba.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <65e6bbcb-2c33-2e43-1826-a62387572310@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 20/07/2022 à 11:48, Joseph Qi a écrit :
> 
> These code are introduced long time ago...
> Refer to commit b4df6ed8db0c "[PATCH] ocfs2: fix orphan recovery
> deadlock", I guess it plays a role 'barrier' and make sure test node map
> is executed prior than signal orphan recovery thread. In other words, to
> serialize evict inode and orphan recovery.
> 
> Thanks,
> Joseph
> 

Ok, so just leave it as-is.

Should I resend the serie without this patch, or can 1/3 and 3/3 be 
applied as-is?

CJ
