Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABB81A683C
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Apr 2020 16:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730839AbgDMOfR (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 13 Apr 2020 10:35:17 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59722 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728716AbgDMOfP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 13 Apr 2020 10:35:15 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 12EA92A1043
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_sensorhub: Add missing '\n' in
 log messages
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        bleung@chromium.org, groeck@chromium.org,
        andy.shevchenko@gmail.com, Jonathan.Cameron@huawei.com
Cc:     gwendal@chromium.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20200411145844.29542-1-christophe.jaillet@wanadoo.fr>
Message-ID: <6487789d-185b-d9f9-d3a0-752bdd5bac98@collabora.com>
Date:   Mon, 13 Apr 2020 16:35:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200411145844.29542-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Christophe,

Thank you for your patch.

On 11/4/20 16:58, Christophe JAILLET wrote:
> Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.
> 
> Fixes: 145d59baff59 ("platform/chrome: cros_ec_sensorhub: Add FIFO support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied as a fix for 5.7

>  drivers/platform/chrome/cros_ec_sensorhub_ring.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> index 230e6cf3da2f..c51af569708f 100644
> --- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> +++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> @@ -820,7 +820,7 @@ static void cros_ec_sensorhub_ring_handler(struct cros_ec_sensorhub *sensorhub)
>  	if (fifo_info->count > sensorhub->fifo_size ||
>  	    fifo_info->size != sensorhub->fifo_size) {
>  		dev_warn(sensorhub->dev,
> -			 "Mismatch EC data: count %d, size %d - expected %d",
> +			 "Mismatch EC data: count %d, size %d - expected %d\n",
>  			 fifo_info->count, fifo_info->size,
>  			 sensorhub->fifo_size);
>  		goto error;
> @@ -851,14 +851,14 @@ static void cros_ec_sensorhub_ring_handler(struct cros_ec_sensorhub *sensorhub)
>  		}
>  		if (number_data > fifo_info->count - i) {
>  			dev_warn(sensorhub->dev,
> -				 "Invalid EC data: too many entry received: %d, expected %d",
> +				 "Invalid EC data: too many entry received: %d, expected %d\n",
>  				 number_data, fifo_info->count - i);
>  			break;
>  		}
>  		if (out + number_data >
>  		    sensorhub->ring + fifo_info->count) {
>  			dev_warn(sensorhub->dev,
> -				 "Too many samples: %d (%zd data) to %d entries for expected %d entries",
> +				 "Too many samples: %d (%zd data) to %d entries for expected %d entries\n",
>  				 i, out - sensorhub->ring, i + number_data,
>  				 fifo_info->count);
>  			break;
> 
