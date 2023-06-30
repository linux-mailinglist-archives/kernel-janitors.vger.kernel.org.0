Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 426AD7439AC
	for <lists+kernel-janitors@lfdr.de>; Fri, 30 Jun 2023 12:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232644AbjF3Kg6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 30 Jun 2023 06:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbjF3KgK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 30 Jun 2023 06:36:10 -0400
X-Greylist: delayed 391 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 30 Jun 2023 03:35:23 PDT
Received: from forward502b.mail.yandex.net (forward502b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d502])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C60DA3C3F
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Jun 2023 03:35:23 -0700 (PDT)
Received: from mail-nwsmtp-smtp-production-main-92.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-92.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:34a8:0:640:678e:0])
        by forward502b.mail.yandex.net (Yandex) with ESMTP id AD0FC5F0F0;
        Fri, 30 Jun 2023 13:28:45 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-92.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id hSLc4A9Dea60-KRGSjfwc;
        Fri, 30 Jun 2023 13:28:44 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1688120924;
        bh=mKcNiCcE2TVDaK3CeIz7rDYPv5SJDm0fl+R9OpQ+0yI=;
        h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
        b=LV1mldrME5l2bjq6nX2LndWZVEyEyndTQB3NJsglqAdLRsG4wAA5pNTAZEvXodDeg
         y2W7YM3NAMq7TK66OZARoy1SSpj2lrk3rTCKT4u1J3HgetlDjU13PbkT6KOejMfKgV
         wXWJnI0p8IAB3G36dki23ZHKKtUoE3VnbRdNFZrg=
Authentication-Results: mail-nwsmtp-smtp-production-main-92.myt.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <546e78d0-633c-aed7-202e-54dddc7aaa7b@yandex.ru>
Date:   Fri, 30 Jun 2023 13:28:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] SUNRPC: clean up integer overflow check
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Trond Myklebust <trond.myklebust@hammerspace.com>
References: <2390fdc8-13fa-4456-ab67-44f0744db412@moroto.mountain>
From:   Dmitry Antipov <dmantipov@yandex.ru>
In-Reply-To: <2390fdc8-13fa-4456-ab67-44f0744db412@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 6/30/23 12:46, Dan Carpenter wrote:

> Use size_mul() to prevent the integer overflow.  It silences the warning
> and it's cleaner as well.

I'm OK with this. But I still don't understand why the original
warning was a compiler (actually two compilers we've tried) bug.

Dmitry
