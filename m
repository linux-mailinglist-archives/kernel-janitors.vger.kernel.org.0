Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A94933CAF6F
	for <lists+kernel-janitors@lfdr.de>; Fri, 16 Jul 2021 00:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232169AbhGOWxc (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 15 Jul 2021 18:53:32 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:57093 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232139AbhGOWxb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Jul 2021 18:53:31 -0400
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D17411BF205;
        Thu, 15 Jul 2021 22:50:36 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Heiko Schocher <hs@denx.de>, linux-mtd@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: mchp48l640: silence some uninitialized variable warnings
Date:   Fri, 16 Jul 2021 00:50:36 +0200
Message-Id: <20210715225036.66051-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <YMyir961W28TX5dT@mwanda>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e83862ee1b9b1668826683f432b041875ec0c819'
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 2021-06-18 at 13:42:07 UTC, Dan Carpenter wrote:
> Smatch complains that zero length read/writes will lead to an
> uninitalized return value.  I don't know if that's possible, but
> it's nicer to return a zero literal anyway so let's do that.
> 
> Fixes: 88d125026753 ("mtd: devices: add support for microchip 48l640 EERAM")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Reviewed-by: Heiko Schocher <hs@denx.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel
