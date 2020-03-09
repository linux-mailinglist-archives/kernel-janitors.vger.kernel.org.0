Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8529D17E220
	for <lists+kernel-janitors@lfdr.de>; Mon,  9 Mar 2020 15:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgCIODq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 9 Mar 2020 10:03:46 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:57629 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgCIODq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 9 Mar 2020 10:03:46 -0400
X-Originating-IP: 90.89.41.158
Received: from localhost.localdomain (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 921251C000C;
        Mon,  9 Mar 2020 14:03:41 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Alexey Korolev <akorolev@infradead.org>
Cc:     Kate Stewart <kstewart@linuxfoundation.org>,
        David Woodhouse <David.Woodhouse@intel.com>,
        Richard Weinberger <richard@nod.at>,
        kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
        Steve Winslow <swinslow@gmail.com>,
        Allison Randal <allison@lohutok.net>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: lpddr: Fix a double free in probe()
Date:   Mon,  9 Mar 2020 15:03:41 +0100
Message-Id: <20200309140341.22314-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228092554.o57igp3nqhyvf66t@kili.mountain>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 315d2e0cdfe0e15585d2244c6986008c78cc330d
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 2020-02-28 at 09:25:54 UTC, Dan Carpenter wrote:
> This function is only called from lpddr_probe().  We free "lpddr" both
> here and in the caller, so it's a double free.  The best place to free
> "lpddr" is in lpddr_probe() so let's delete this one.
> 
> Fixes: 8dc004395d5e ("[MTD] LPDDR qinfo probing.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
