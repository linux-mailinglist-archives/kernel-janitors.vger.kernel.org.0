Return-Path: <kernel-janitors+bounces-2064-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C989870074
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 Mar 2024 12:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B018C1F24E61
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 Mar 2024 11:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D3438DF7;
	Mon,  4 Mar 2024 11:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J5xudpDt"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BED38DF5
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Mar 2024 11:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709551982; cv=none; b=H5W8WRq9awa5Cep6jhAjZV5kg2eM22b+oUA3MDJzJ5Be5+FawmZ9PONYm8xNEfWNqb8jaIJKXG+87K15RnIodu//j5h3k26BAD7He69oK0LUL5uHurhkRCmLDZkf4AFNmRK37WTxlaVOhlROk7XPPLoFImOyXpiXEUhMxRnIR6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709551982; c=relaxed/simple;
	bh=8tXG9rx3pLAtn54IfYAwMD1l9xHfhlAoTKmFPJpoLtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRPw9TBGZ1GrDG+IIsOKBMvn+xmZ5fZjx6m2ktfiEJrXVgPbJcycQD0NuutTIGY9hk9A6u6tCjyy+o056wn/sXt1f7kP6ks9DhYXe9vY7TzTAFcF5LsBVSej0knOMYvjFT3tf/qQhiNXQxpzSgoOfL7atByKEt/Lz3SYyt7mgv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J5xudpDt; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-412e783c94fso2373645e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Mar 2024 03:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709551979; x=1710156779; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=202rFosXjhFYE+j5mBIhVw+lc/s83SboshMBdgomeu8=;
        b=J5xudpDtGICFcsnA8mmLg5/3OOOxbp9sIUI8WpmUM1DLOexrELc/IsMiqV3lIw3S3E
         y5T/mP+SPGk0UAVXjsE8vt0Q890FWM6XpPqoFWNViMZlfkmaFWd45YdSLaa7Aag9fV+1
         QQbeZ2GzwKkhKRqwjawZkRZFiM+bajATadJyUCdDIW2AwwqbAMVuz1w4HrlhwOlAJe54
         2CYWEonhqsyeW5G4Nus2DJgZXAhpi9nn+V80MHWBRO+2U/CTwtfujF9HMxVGpMBNGAK7
         X7y+bU5xz+dgbaMwFvZvsZnE/wxzZp3MNMX6GMoqfZFklEk6PRRQI88UuV07vxn/o3QI
         u+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709551979; x=1710156779;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=202rFosXjhFYE+j5mBIhVw+lc/s83SboshMBdgomeu8=;
        b=CKJJkMgCU4MzOVUa9L2eP9kTq1TO1xR1Kv/UTbGEnIZq5TQTAYJ5GNb8guouXfWa+z
         sKjvQoDHh6vnHM+lHs2So4AdLu25svjkYl8Gvr6Q81RDQ7d+a3gvAjTC8F3RRZSNLoDW
         4FKCGhN0/Mm523KCG7nbe+RZTW7fitw44YIicHUu3guW0FeBCm8LwPpQfBX3ASSRjBYX
         ALosKK89ony8gWZA3xkkrgWVwFQRSlyhOSFo1xnLDm3wjkLR5KyHCwovLc2QpOT1I/nq
         XaPU8Oj1po4PmpvRfiVxc6U+bG7MGpBtGKIl0bzLIlWdkXXKz3LmjlFTbkjzdN4hI2Vd
         WsNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwi2M7J4mQ97w1GcJ4uTfxfjDJxGXZ/lU06zXZSG6XmrZbOjEqTo67y0SjjaFFv/dzZDFV7EgXRegJJTrfG8Eycu8jdXfdqto9roJMTyMF
X-Gm-Message-State: AOJu0YwgwsLoBsHkdHKPLmihf6YZK3xwmAHmnNHEhaGd1CQYusj7jnW6
	6899kjzEA0j7fYTv+qDMh9dcsJ3/GtueIiWV3CqOm4q34jZWVqPXURaSZGO+rXU=
X-Google-Smtp-Source: AGHT+IEr2Xo21Q/br36eGatLTCNsEagP+hGAH1EvtLB+2zZMEM7q81Z9ROjZaGk0RaPEBYMhUEyO7w==
X-Received: by 2002:a05:600c:4508:b0:412:c288:d22b with SMTP id t8-20020a05600c450800b00412c288d22bmr7323696wmo.14.1709551978868;
        Mon, 04 Mar 2024 03:32:58 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id f12-20020a05600c4e8c00b00412ae4b45b3sm17796835wmq.30.2024.03.04.03.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 03:32:58 -0800 (PST)
Date: Mon, 4 Mar 2024 14:32:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-input@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>, Rob Herring <robh@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	LKML <linux-kernel@vger.kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2] Input: iqs626a - Use scope-based resource management
 in iqs626_parse_events()
Message-ID: <2be02b12-84ce-4f83-b104-685f3b7cfd95@moroto.mountain>
References: <8a7607f8-d634-415e-8269-e26dcc0f9fdc@web.de>
 <ZeU8ENmnPj3sKxAv@nixie71>
 <ZeVOPSt0L1D4BxuZ@google.com>
 <e8a2b63f-4f9a-463b-b419-c5f673191111@web.de>
 <b91fe21-fe2-eac8-d1ee-ea8922a08861@inria.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b91fe21-fe2-eac8-d1ee-ea8922a08861@inria.fr>

On Mon, Mar 04, 2024 at 11:55:23AM +0100, Julia Lawall wrote:
> 
> 
> On Mon, 4 Mar 2024, Markus Elfring wrote:
> 
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Mon, 4 Mar 2024 11:40:04 +0100
> >
> > Scope-based resource management became supported also for this software
> > area by contributions of Jonathan Cameron on 2024-02-17.
> >
> > device property: Add cleanup.h based fwnode_handle_put() scope based cleanup.
> > https://lore.kernel.org/r/20240217164249.921878-3-jic23@kernel.org
> >
> >
> > * Thus use the attribute “__free(fwnode_handle)”.
> >
> > * Reduce the scope for the local variable “ev_node” into a for loop.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >
> > v2:
> > An other cleanup technique was applied as requested by Dmitry Torokhov
> > and Jeff LaBundy.
> >
> >
> >  drivers/input/misc/iqs626a.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/input/misc/iqs626a.c b/drivers/input/misc/iqs626a.c
> > index 0dab54d3a060..86fcb5134f45 100644
> > --- a/drivers/input/misc/iqs626a.c
> > +++ b/drivers/input/misc/iqs626a.c
> > @@ -462,7 +462,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
> >  {
> >  	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
> >  	struct i2c_client *client = iqs626->client;
> > -	struct fwnode_handle *ev_node;
> >  	const char *ev_name;
> >  	u8 *thresh, *hyst;
> >  	unsigned int val;
> > @@ -501,6 +500,8 @@ iqs626_parse_events(struct iqs626_private *iqs626,
> >  		if (!iqs626_channels[ch_id].events[i])
> >  			continue;
> >
> > +		struct fwnode_handle *ev_node __free(fwnode_handle);
> 
> Doesn't this need to be initialized?
> 

Only if you declared before the continue; statement.  Generally kernel
style is that you have to declare variables at the start of the block...
But that's becoming less universal now that it's not a compile error.

regards,
dan carpenter



