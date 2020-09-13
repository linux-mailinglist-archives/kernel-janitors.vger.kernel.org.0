Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88110267D15
	for <lists+kernel-janitors@lfdr.de>; Sun, 13 Sep 2020 03:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbgIMB06 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 12 Sep 2020 21:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbgIMB04 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 12 Sep 2020 21:26:56 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06944C061573;
        Sat, 12 Sep 2020 18:26:55 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 9ACC012905EDE;
        Sat, 12 Sep 2020 18:10:04 -0700 (PDT)
Date:   Sat, 12 Sep 2020 18:26:50 -0700 (PDT)
Message-Id: <20200912.182650.260627332372424414.davem@davemloft.net>
To:     christophe.jaillet@wanadoo.fr
Cc:     kuba@kernel.org, chessman@tux.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] tlan: switch from 'pci_' to 'dma_' API
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200912074359.334234-1-christophe.jaillet@wanadoo.fr>
References: <20200912074359.334234-1-christophe.jaillet@wanadoo.fr>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [2620:137:e000::1:9]); Sat, 12 Sep 2020 18:10:04 -0700 (PDT)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 12 Sep 2020 09:43:58 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'tlan_init()' GFP_KERNEL can be used because
> it is only called from a probe function or a module_init function and no
> lock is taken in the between.
> The call chain is:
>   tlan_probe                        (module_init function)
>     --> tlan_eisa_probe
> or
>   tlan_init_one                     (probe function)
> 
> then in both cases:
>     --> tlan_probe1
>       --> tlan_init
> 
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
