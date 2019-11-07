Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF9DF2716
	for <lists+kernel-janitors@lfdr.de>; Thu,  7 Nov 2019 06:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbfKGFZH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 7 Nov 2019 00:25:07 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:33798 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfKGFZH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 Nov 2019 00:25:07 -0500
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id D54F615110082;
        Wed,  6 Nov 2019 21:25:06 -0800 (PST)
Date:   Wed, 06 Nov 2019 21:25:06 -0800 (PST)
Message-Id: <20191106.212506.946721274328639751.davem@davemloft.net>
To:     weiyongjun1@huawei.com
Cc:     radhey.shyam.pandey@xilinx.com, michal.simek@xilinx.com,
        linux@armlinux.org.uk, hancock@sedsystems.ca,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net: axienet: Fix error return code in
 axienet_probe()
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20191106.212441.931590542340055489.davem@davemloft.net>
References: <20191106155449.107672-1-weiyongjun1@huawei.com>
        <20191106.212441.931590542340055489.davem@davemloft.net>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 06 Nov 2019 21:25:07 -0800 (PST)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: David Miller <davem@davemloft.net>
Date: Wed, 06 Nov 2019 21:24:41 -0800 (PST)

> From: Wei Yongjun <weiyongjun1@huawei.com>
> Date: Wed, 6 Nov 2019 15:54:49 +0000
> 
>> In the DMA memory resource get failed case, the error is not
>> set and 0 will be returned. Fix it by reove redundant check
>> since devm_ioremap_resource() will handle it.
>> 
>> Fixes: 28ef9ebdb64c ("net: axienet: make use of axistream-connected attribute optional")
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Fixed with the commit message typo fixed.

I meant "Applied with the commit message typo fixed." :-)
