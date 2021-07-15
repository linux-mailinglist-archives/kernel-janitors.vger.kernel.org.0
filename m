Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 208303CAF8B
	for <lists+kernel-janitors@lfdr.de>; Fri, 16 Jul 2021 01:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231626AbhGOXLs (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 15 Jul 2021 19:11:48 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:50131 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbhGOXLr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Jul 2021 19:11:47 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 08C41C72D4
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Jul 2021 23:08:52 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 86C8EC0006;
        Thu, 15 Jul 2021 23:08:28 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Colin King <colin.king@canonical.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: Fix a couple of spelling mistakes in Kconfig
Date:   Fri, 16 Jul 2021 01:08:28 +0200
Message-Id: <20210715230828.222684-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210704094705.37175-1-colin.king@canonical.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c5b9ee9c361f52cd319135b9ec7fe684d5e2e026'
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 2021-07-04 at 09:47:05 UTC, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are two spelling mistakes in the Kconfig text. Fix them.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
