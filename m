Return-Path: <kernel-janitors+bounces-114-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD3E7DEB25
	for <lists+kernel-janitors@lfdr.de>; Thu,  2 Nov 2023 04:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 374922819B8
	for <lists+kernel-janitors@lfdr.de>; Thu,  2 Nov 2023 03:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D001854;
	Thu,  2 Nov 2023 03:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j24z/zUF"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADBE2D61F
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 03:08:55 +0000 (UTC)
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2255101;
	Wed,  1 Nov 2023 20:08:54 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3b2ea7cca04so292065b6e.2;
        Wed, 01 Nov 2023 20:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698894534; x=1699499334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDyUdMXxOZyxGka8nH6miMPNn2W5hAmBJES98BuVD/s=;
        b=j24z/zUFO4sJggHkZicSnrP9HnesHh1b4d+1sPk5Q17Km0DOXiM5D7SFWGP6+k8IRX
         qxgnvrZ3NPakDKZZuxxQJ6GFH5dKmA3kEMsYWum70WwIHEvLqZzTjdtKy1W/7aYGciC6
         GB+PWxvJ9M5UJ1iQd31Y5NXy8QzpPFy4I+5g+ODss957lkYpvcV59FxZneKvijs5XtCf
         1gXdu/JPilZsH032u1cjAgUdAw59P9m4eX4LSQslj28h8zjNwGV8nDg3oavxDmojujR/
         hTSynyxwUtc6cKmXYN4imD1HK6xyZfIgSTAOehEYIG6VEKhnYCxxqx6ZR9Oh08xwnOdC
         rmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698894534; x=1699499334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDyUdMXxOZyxGka8nH6miMPNn2W5hAmBJES98BuVD/s=;
        b=LO1M/m4ePTbmFYLVj+wMtwZMwIA0xanZswKFGwQPwx2GUr7+OLdrDpUnrW940h5K8h
         Ckw6OC9iLkNM7824N/FR2bn2aYEj+KuPTplqYg9Zjzp8S5topK/QP8Mq84BkmmAwUU9I
         jzLNhm+mVmBeyYU9wTKFollq4qietDm8ci8xD7Zy3rnUnW/hnskvm1lTRPNnZGStjxnN
         uhc5duxNn0qWDrjLN5Mel+r4vQt2ePW/BajV4XxtllOxSLzBzPaGUa0Pi7MJ0fH8nqbE
         bUsl2ptns3I06Dd6LH6HtG3/PasjPhrPbuYT0XJiHbaigrk3bEy2iqm8kWFeSdaEr8VT
         J4YA==
X-Gm-Message-State: AOJu0Yx9uxt+O9Z/y4eKhNekyhxdqbdDZLmf0Rsnd8gz1vC5aw+TL8h/
	zYKHwjB+xJisnBmwyGeNe3X3OvMFE30=
X-Google-Smtp-Source: AGHT+IFSJoRUgQ/5MywXb/2S6QGk99xonwcFvX+ypA5VRZJuvCPHBCTd9pVbyqGuafFGwh10+y/m9g==
X-Received: by 2002:aca:1214:0:b0:3ae:1446:d48b with SMTP id 20-20020aca1214000000b003ae1446d48bmr17972225ois.3.1698894533827;
        Wed, 01 Nov 2023 20:08:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u37-20020a056808152500b003afe5617691sm421510oiw.12.2023.11.01.20.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 20:08:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 1 Nov 2023 20:08:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] hwmon: ltc2991: Fix spelling mistake "contiuous"
 -> "continuous"
Message-ID: <fff2742f-6e90-4d7a-b9e5-365429c57f4d@roeck-us.net>
References: <20231031084240.2148339-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031084240.2148339-1-colin.i.king@gmail.com>

On Tue, Oct 31, 2023 at 08:42:40AM +0000, Colin Ian King wrote:
> There is a spelling mistake in a dev_err_probe messages. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied.

Thanks,
Guenter

