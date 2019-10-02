Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64CDCC4B33
	for <lists+kernel-janitors@lfdr.de>; Wed,  2 Oct 2019 12:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727699AbfJBKQe (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 2 Oct 2019 06:16:34 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48151 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbfJBKQd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Oct 2019 06:16:33 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iFbgI-0007V7-6C; Wed, 02 Oct 2019 12:16:26 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1iFbgG-0003J6-MW; Wed, 02 Oct 2019 12:16:24 +0200
Date:   Wed, 2 Oct 2019 12:16:24 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Colin King <colin.king@canonical.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-pwm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pwm: sun4i: redundant assignment to variable pval
Message-ID: <20191002101624.gljyf7g4nia2rcbx@pengutronix.de>
References: <20191002100844.10490-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191002100844.10490-1-colin.king@canonical.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernel-janitors@vger.kernel.org
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Oct 02, 2019 at 11:08:44AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable pval is being assigned a value that is never read. The
> assignment is redundant and hence can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/pwm/pwm-sun4i.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
> index 6f5840a1a82d..53970d4ba695 100644
> --- a/drivers/pwm/pwm-sun4i.c
> +++ b/drivers/pwm/pwm-sun4i.c
> @@ -156,7 +156,6 @@ static int sun4i_pwm_calculate(struct sun4i_pwm_chip *sun4i_pwm,
>  	if (sun4i_pwm->data->has_prescaler_bypass) {
>  		/* First, test without any prescaler when available */
>  		prescaler = PWM_PRESCAL_MASK;
> -		pval = 1;
>  		/*
>  		 * When not using any prescaler, the clock period in nanoseconds
>  		 * is not an integer so round it half up instead of

Looks fine, the issue exists since
deb9c462f4e539cc7f8389b9855eb7a507c78e7e.

You can even make pval a local variable for the second for loop.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-K�nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
