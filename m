Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74622266508
	for <lists+kernel-janitors@lfdr.de>; Fri, 11 Sep 2020 18:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgIKQux (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 11 Sep 2020 12:50:53 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:45531 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbgIKQuN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Sep 2020 12:50:13 -0400
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4A686E0002;
        Fri, 11 Sep 2020 16:50:06 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Colin King <colin.king@canonical.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: mtdconcat: map: remove redundant assignment to variable 'size'
Date:   Fri, 11 Sep 2020 18:50:04 +0200
Message-Id: <20200911165004.27501-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200910154451.752569-1-colin.king@canonical.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 1840ff8d426122a06e849b805b5c5095ff4a59ee
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 2020-09-10 at 15:44:51 UTC, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable 'size' is being assigned the value zero that will never be
> read. The assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
