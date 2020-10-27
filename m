Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5989229AB3C
	for <lists+kernel-janitors@lfdr.de>; Tue, 27 Oct 2020 12:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S367976AbgJ0Lxi (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 27 Oct 2020 07:53:38 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:52308 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2899629AbgJ0Lxh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Oct 2020 07:53:37 -0400
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 3C6983A1DD2
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Oct 2020 11:32:56 +0000 (UTC)
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 575A41BF209;
        Tue, 27 Oct 2020 11:32:33 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel-janitors@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf2127: fix pcf2127_nvmem_read/write() returns
Date:   Tue, 27 Oct 2020 12:32:32 +0100
Message-Id: <160379780345.96488.3985201259905259323.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201022070451.GA2817669@mwanda>
References: <20201022070451.GA2817669@mwanda>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 22 Oct 2020 10:04:51 +0300, Dan Carpenter wrote:
> These functions should return zero on success.  Non-zero returns are
> treated as error.  On some paths, this doesn't matter but in
> nvmem_cell_read() a non-zero return would be passed to ERR_PTR() and
> lead to an Oops.

Applied, thanks!

[1/1] rtc: pcf2127: fix pcf2127_nvmem_read/write() returns
      commit: ba1c30bf3f2536f248d262c6f257b5a787305991

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
