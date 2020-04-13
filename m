Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9191A683A
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Apr 2020 16:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730827AbgDMOfD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 13 Apr 2020 10:35:03 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59712 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728713AbgDMOfA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 13 Apr 2020 10:35:00 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 34C0D2A1043
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_sensorhub: Off by one in
 cros_sensorhub_send_sample()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Benson Leung <bleung@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>
Cc:     Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20200407092935.GJ68494@mwanda>
Message-ID: <7731f717-805b-5698-d8d8-7446545813cb@collabora.com>
Date:   Mon, 13 Apr 2020 16:34:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200407092935.GJ68494@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

Thank you for your patch.

On 7/4/20 11:29, Dan Carpenter wrote:
> The sensorhub->push_data[] array has sensorhub->sensor_num elements.
> It's allocated in cros_ec_sensorhub_ring_add().  So the > should be >=
> to prevent a read one element beyond the end of the array.
> 
> Fixes: 145d59baff59 ("platform/chrome: cros_ec_sensorhub: Add FIFO support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Applied as a fix for 5.7

>  drivers/platform/chrome/cros_ec_sensorhub_ring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> index 230e6cf3da2f..85e8ba782f0c 100644
> --- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> +++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> @@ -40,7 +40,7 @@ cros_sensorhub_send_sample(struct cros_ec_sensorhub *sensorhub,
>  	int id = sample->sensor_id;
>  	struct iio_dev *indio_dev;
>  
> -	if (id > sensorhub->sensor_num)
> +	if (id >= sensorhub->sensor_num)
>  		return -EINVAL;
>  
>  	cb = sensorhub->push_data[id].push_data_cb;
> 
