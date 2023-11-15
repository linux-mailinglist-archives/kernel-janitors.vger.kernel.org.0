Return-Path: <kernel-janitors+bounces-98-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD997DDEDC
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Nov 2023 11:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C2691C20C8A
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Nov 2023 10:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC158D513;
	Wed,  1 Nov 2023 10:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB3A63AD
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 10:00:28 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD4B101;
	Wed,  1 Nov 2023 03:00:23 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4SL2VL3Ckfz6K63t;
	Wed,  1 Nov 2023 17:57:14 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 1 Nov
 2023 10:00:20 +0000
Date: Wed, 1 Nov 2023 10:00:19 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Su Hui <suhui@nfschina.com>
CC: Jonathan Cameron <jic23@kernel.org>, <lars@metafoo.de>,
	<jean-baptiste.maneyrol@tdk.com>, <andy.shevchenko@gmail.com>,
	<chenhuiz@axis.com>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v2] iio: imu: inv_mpu6050: fix an error code problem in
 inv_mpu6050_read_raw
Message-ID: <20231101100019.00004be7@Huawei.com>
In-Reply-To: <7555437b-9289-eba4-efa8-965386e0e956@nfschina.com>
References: <20231027145949.243f03f2@jic23-huawei>
	<7555437b-9289-eba4-efa8-965386e0e956@nfschina.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected

On Mon, 30 Oct 2023 10:10:05 +0800
Su Hui <suhui@nfschina.com> wrote:

> On 2023/10/27 21:59, Jonathan Cameron wrote:
> > On Mon, 23 Oct 2023 12:05:52 +0800
> > Su Hui <suhui@nfschina.com> wrote:
> >  
> >> inv_mpu6050_sensor_show() can return -EINVAL or IIO_VAL_INT. Return the
> >> true value rather than only return IIO_VAL_INT.
> >>
> >> Signed-off-by: Su Hui <suhui@nfschina.com>  
> > If you can figure out a fixes tag that would be great.  Just reply to this thread
> > with it and I'll pick it up from here.  
> Oh, I just send a v3 patch, sorry....
> Fixes: d5098447147c ("iio: imu: mpu6050: add calibration offset support")
That works too!

Thanks,

J
> >> ---
> >> v2:
> >>   - fix the error of commit title.
> >> v1:
> >>   - https://lore.kernel.org/all/20231020091413.205743-2-suhui@nfschina.com/
> >>   drivers/iio/imu/inv_mpu6050/inv_mpu_core.c | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
> >> index 29f906c884bd..a9a5fb266ef1 100644
> >> --- a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
> >> +++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
> >> @@ -749,13 +749,13 @@ inv_mpu6050_read_raw(struct iio_dev *indio_dev,
> >>   			ret = inv_mpu6050_sensor_show(st, st->reg->gyro_offset,
> >>   						chan->channel2, val);
> >>   			mutex_unlock(&st->lock);
> >> -			return IIO_VAL_INT;
> >> +			return ret;
> >>   		case IIO_ACCEL:
> >>   			mutex_lock(&st->lock);
> >>   			ret = inv_mpu6050_sensor_show(st, st->reg->accl_offset,
> >>   						chan->channel2, val);
> >>   			mutex_unlock(&st->lock);
> >> -			return IIO_VAL_INT;
> >> +			return ret;
> >>   
> >>   		default:
> >>   			return -EINVAL;  
> 


