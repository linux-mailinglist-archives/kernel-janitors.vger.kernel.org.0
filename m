Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC20249152
	for <lists+kernel-janitors@lfdr.de>; Wed, 19 Aug 2020 01:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgHRXCs (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 18 Aug 2020 19:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgHRXCr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Aug 2020 19:02:47 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B209C061389;
        Tue, 18 Aug 2020 16:02:47 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id D7100127E56FA;
        Tue, 18 Aug 2020 15:46:00 -0700 (PDT)
Date:   Tue, 18 Aug 2020 16:02:46 -0700 (PDT)
Message-Id: <20200818.160246.1027858919793094945.davem@davemloft.net>
To:     colin.king@canonical.com
Cc:     UNGLinuxDriver@microchip.com, vladimir.oltean@nxp.com,
        claudiu.manoil@nxp.com, alexandre.belloni@bootlin.com,
        andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
        kuba@kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: mscc: ocelot: remove duplicate "the the" phrase
 in Kconfig text
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200817224042.5826-1-colin.king@canonical.com>
References: <20200817224042.5826-1-colin.king@canonical.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Tue, 18 Aug 2020 15:46:01 -0700 (PDT)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 17 Aug 2020 23:40:42 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The Kconfig help text contains the phrase "the the" in the help
> text. Fix this.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
