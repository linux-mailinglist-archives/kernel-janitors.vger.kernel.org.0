Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 029369A3C0
	for <lists+kernel-janitors@lfdr.de>; Fri, 23 Aug 2019 01:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394407AbfHVXXX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 22 Aug 2019 19:23:23 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:50554 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394382AbfHVXXX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Aug 2019 19:23:23 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 6A0AD1539DF80;
        Thu, 22 Aug 2019 16:23:22 -0700 (PDT)
Date:   Thu, 22 Aug 2019 16:23:22 -0700 (PDT)
Message-Id: <20190822.162322.666892826002905972.davem@davemloft.net>
To:     Markus.Elfring@web.de
Cc:     linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
        petkan@nucleusys.com, swinslow@gmail.com, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] net: usb: Delete unnecessary checks before the macro
 call =?iso-2022-jp?B?GyRCIUgbKEJkZXZfa2ZyZWVfc2tiGyRCIUkbKEI=?=
From:   David Miller <davem@davemloft.net>
In-Reply-To: <425214be-355b-92c0-bc74-1d0ea899290f@web.de>
References: <425214be-355b-92c0-bc74-1d0ea899290f@web.de>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Thu, 22 Aug 2019 16:23:22 -0700 (PDT)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 21 Aug 2019 22:24:16 +0200

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 21 Aug 2019 22:16:02 +0200
> 
> The dev_kfree_skb() function performs also input parameter validation.
> Thus the test around the shown calls is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied.
