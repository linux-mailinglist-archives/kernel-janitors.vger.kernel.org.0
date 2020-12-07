Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1797E2D0EF7
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Dec 2020 12:26:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgLGL0E (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 7 Dec 2020 06:26:04 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:45060 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgLGL0D (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Dec 2020 06:26:03 -0500
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 569F23AABC3
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Dec 2020 11:10:30 +0000 (UTC)
X-Originating-IP: 109.220.208.103
Received: from localhost.localdomain (lfbn-tou-1-1617-103.w109-220.abo.wanadoo.fr [109.220.208.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0B1EDC0007;
        Mon,  7 Dec 2020 11:09:26 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Liang Yang <liang.yang@amlogic.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        kernel-janitors@vger.kernel.org,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Richard Weinberger <richard@nod.at>,
        Yixun Lan <yixun.lan@amlogic.com>,
        linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] mtd: rawnand: meson: Fix a resource leak in init
Date:   Mon,  7 Dec 2020 12:09:25 +0100
Message-Id: <20201207110926.7951-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <X8ikVCnUsfTpffFB@mwanda>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 7d4a8c2a2852cb9d3f5754bb418995ef2bf0739e
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 2020-12-03 at 08:39:48 UTC, Dan Carpenter wrote:
> Call clk_disable_unprepare(nfc->phase_rx) if the clk_set_rate() function
> fails to avoid a resource leak.
> 
> Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
