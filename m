Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C313738F5BB
	for <lists+kernel-janitors@lfdr.de>; Tue, 25 May 2021 00:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhEXWmk (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 24 May 2021 18:42:40 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:39593 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhEXWmk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 May 2021 18:42:40 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 50FB7C7602
        for <kernel-janitors@vger.kernel.org>; Mon, 24 May 2021 22:36:48 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 15A0FFF803;
        Mon, 24 May 2021 22:36:24 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "Kim, Milo" <Milo.Kim@ti.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel-janitors@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] rtc: fix snprintf() checking in is_rtc_hctosys()
Date:   Tue, 25 May 2021 00:36:24 +0200
Message-Id: <162189577175.211185.2359785793574104400.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <YJov/pcGmhLi2pEl@mwanda>
References: <YJov/pcGmhLi2pEl@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 11 May 2021 10:19:26 +0300, Dan Carpenter wrote:
> The scnprintf() function silently truncates the printf() and returns
> the number bytes that it was able to copy (not counting the NUL
> terminator).  Thus, the highest value it can return here is
> "NAME_SIZE - 1" and the overflow check is dead code.  Fix this by
> using the snprintf() function which returns the number of bytes that
> would have been copied if there was enough space and changing the
> condition from "> NAME_SIZE" to ">= NAME_SIZE".

Applied, thanks!

[1/1] rtc: fix snprintf() checking in is_rtc_hctosys()
      commit: 54b909436ede47e0ee07f1765da27ec2efa41e84

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
