Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81CE41C9FEE
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 May 2020 03:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbgEHBIA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 7 May 2020 21:08:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726638AbgEHBIA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 May 2020 21:08:00 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FF55C05BD43;
        Thu,  7 May 2020 18:08:00 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 4D9B9119376D4;
        Thu,  7 May 2020 18:07:59 -0700 (PDT)
Date:   Thu, 07 May 2020 18:07:58 -0700 (PDT)
Message-Id: <20200507.180758.1608657964463079833.davem@davemloft.net>
To:     colin.king@canonical.com
Cc:     andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, linux@rempel-privat.de,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] net: phy: fix less than zero comparison with
 unsigned variable val
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200507143430.50507-1-colin.king@canonical.com>
References: <20200507143430.50507-1-colin.king@canonical.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Thu, 07 May 2020 18:07:59 -0700 (PDT)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  7 May 2020 15:34:30 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The unsigned variable val is being checked for an error by checking
> if it is less than zero. This can never occur because val is unsigned.
> Fix this by making val a plain int.
> 
> Addresses-Coverity: ("Unsigned compared against zero")
> Fixes: bdbdac7649fa ("ethtool: provide UAPI for PHY master/slave configuration.")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks Colin.
