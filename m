Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DFF222A461
	for <lists+kernel-janitors@lfdr.de>; Thu, 23 Jul 2020 03:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387675AbgGWBKp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 22 Jul 2020 21:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387510AbgGWBKp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 22 Jul 2020 21:10:45 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB64C0619DC;
        Wed, 22 Jul 2020 18:10:45 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 6A4A1126B5365;
        Wed, 22 Jul 2020 17:53:59 -0700 (PDT)
Date:   Wed, 22 Jul 2020 18:10:43 -0700 (PDT)
Message-Id: <20200722.181043.1052337587227758653.davem@davemloft.net>
To:     colin.king@canonical.com
Cc:     snelson@pensando.io, drivers@pensando.io, kuba@kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ionic: fix memory leak of object 'lid'
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200722174003.962374-1-colin.king@canonical.com>
References: <20200722174003.962374-1-colin.king@canonical.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 22 Jul 2020 17:53:59 -0700 (PDT)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed, 22 Jul 2020 18:40:03 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when netdev fails to allocate the error return path
> fails to free the allocated object 'lid'.  Fix this by setting
> err to the return error code and jumping to a new label that
> performs the kfree of lid before returning.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: 4b03b27349c0 ("ionic: get MTU from lif identity")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
