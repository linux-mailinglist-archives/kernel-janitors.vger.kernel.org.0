Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A620391349
	for <lists+kernel-janitors@lfdr.de>; Wed, 26 May 2021 11:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233601AbhEZJEm (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 26 May 2021 05:04:42 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:36845 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233165AbhEZJEe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 May 2021 05:04:34 -0400
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5516B60014;
        Wed, 26 May 2021 09:03:00 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Michael Walle <michael@walle.cc>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: core: Potential NULL dereference in mtd_otp_size()
Date:   Wed, 26 May 2021 11:02:59 +0200
Message-Id: <20210526090259.180775-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <YJ6Iw3iNvGycAWV6@mwanda>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c3c8c051df3ee5042dd91593593a8b0e008f4c85'
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 2021-05-14 at 14:27:15 UTC, Dan Carpenter wrote:
> If kmalloc() fails then it could lead to a NULL dereference.  Check and
> return -ENOMEM on error.
> 
> Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Michael Walle <michael@walle.cc>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
