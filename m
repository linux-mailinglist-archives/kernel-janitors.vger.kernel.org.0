Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 184DEBDD53
	for <lists+kernel-janitors@lfdr.de>; Wed, 25 Sep 2019 13:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732122AbfIYLnS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 25 Sep 2019 07:43:18 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:34678 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729986AbfIYLnS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Sep 2019 07:43:18 -0400
Received: from localhost (unknown [65.39.69.237])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 9A808154EC89A;
        Wed, 25 Sep 2019 04:43:16 -0700 (PDT)
Date:   Wed, 25 Sep 2019 13:43:14 +0200 (CEST)
Message-Id: <20190925.134314.794543116027582950.davem@davemloft.net>
To:     christophe.jaillet@wanadoo.fr
Cc:     khc@pm.waw.pl, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hdlc: Simplify code in 'pvc_xmit()'
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190921061738.25326-1-christophe.jaillet@wanadoo.fr>
References: <20190921061738.25326-1-christophe.jaillet@wanadoo.fr>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 25 Sep 2019 04:43:17 -0700 (PDT)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 21 Sep 2019 08:17:38 +0200

> Use __skb_pad instead of rewriting it, this saves some LoC.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.

Please test this code and resubmit for net-next, thank you.
