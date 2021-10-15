Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 547B942FBD5
	for <lists+kernel-janitors@lfdr.de>; Fri, 15 Oct 2021 21:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242670AbhJOTRE (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 15 Oct 2021 15:17:04 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:43377 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233027AbhJOTRE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 15 Oct 2021 15:17:04 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 3EB48CC6A9;
        Fri, 15 Oct 2021 19:12:46 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 85580FF804;
        Fri, 15 Oct 2021 19:12:24 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] rtc: rv3032: fix error handling in rv3032_clkout_set_rate()
Date:   Fri, 15 Oct 2021 21:12:19 +0200
Message-Id: <163432513382.815620.16082619578546658825.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012101028.GT2083@kadam>
References: <20211012101028.GT2083@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 12 Oct 2021 13:10:28 +0300, Dan Carpenter wrote:
> Do not call rv3032_exit_eerd() if the enter function fails but don't
> forget to call the exit when the enter succeeds.
> 
> 

Applied, thanks!

[1/1] rtc: rv3032: fix error handling in rv3032_clkout_set_rate()
      commit: c3336b8ac6091df60a5c1049a8c685d0b947cc61

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
