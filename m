Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0957DAA2AA
	for <lists+kernel-janitors@lfdr.de>; Thu,  5 Sep 2019 14:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387970AbfIEMGi (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 5 Sep 2019 08:06:38 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35481 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387444AbfIEMGi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Sep 2019 08:06:38 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1i5qWy-00005L-6N; Thu, 05 Sep 2019 14:06:28 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1i5qWw-0004PO-P9; Thu, 05 Sep 2019 14:06:26 +0200
Date:   Thu, 5 Sep 2019 14:06:26 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] led: triggers: Fix NULL dereference in led_trigger_set()
 error handling
Message-ID: <20190905120626.hyegecmy6hf5lvhj@pengutronix.de>
References: <20190905095728.GA26005@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190905095728.GA26005@mwanda>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernel-janitors@vger.kernel.org
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello,

On Thu, Sep 05, 2019 at 12:57:28PM +0300, Dan Carpenter wrote:
> The problem is we set "led_cdev->trigger = NULL;" and then dereference
> it when we call write_lock_irqsave():
> 
> 	write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
>                             ^^^^^^^^^^^^^^^^^
> 
> Fixes: 2282e125a406 ("leds: triggers: let struct led_trigger::activate() return an error code")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Obviously right. Thanks for catching.

Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Did you find this at runtime or by using some static checker?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
