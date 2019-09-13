Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8495B1DC1
	for <lists+kernel-janitors@lfdr.de>; Fri, 13 Sep 2019 14:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730096AbfIMMdW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 13 Sep 2019 08:33:22 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:34423 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbfIMMdW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Sep 2019 08:33:22 -0400
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id ACC306000B;
        Fri, 13 Sep 2019 12:33:14 +0000 (UTC)
Date:   Fri, 13 Sep 2019 14:33:13 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Richard Weinberger <richard@nod.at>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: fix spelling mistake "gravepagess" ->
 "gravepages"
Message-ID: <20190913143313.43d17e86@xps13>
In-Reply-To: <20190913092243.7399-1-colin.king@canonical.com>
References: <20190913092243.7399-1-colin.king@canonical.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Colin,

Colin King <colin.king@canonical.com> wrote on Fri, 13 Sep 2019
10:22:43 +0100:

> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a NS_ERR error message. Fix it.

A Fixes tag would be great!

> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/nand/raw/nandsim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
> index 9a70754a61ef..76c31d1dea31 100644
> --- a/drivers/mtd/nand/raw/nandsim.c
> +++ b/drivers/mtd/nand/raw/nandsim.c
> @@ -910,7 +910,7 @@ static int parse_gravepages(void)
>  		zero_ok = (*g == '0' ? 1 : 0);
>  		page_no = simple_strtoul(g, &g, 0);
>  		if (!zero_ok && !page_no) {
> -			NS_ERR("invalid gravepagess.\n");
> +			NS_ERR("invalid gravepages.\n");
>  			return -EINVAL;
>  		}
>  		max_reads = 3;


Thanks,
Miquèl
