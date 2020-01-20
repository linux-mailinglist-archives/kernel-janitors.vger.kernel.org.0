Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EECA14305F
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Jan 2020 18:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbgATRBi (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 20 Jan 2020 12:01:38 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33037 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbgATRBi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 Jan 2020 12:01:38 -0500
Received: by mail-ot1-f68.google.com with SMTP id b18so397637otp.0
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Jan 2020 09:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=l7rXrWc9zdyZC8ngED66aztSeYAIdSfuXFbxTohqXwo=;
        b=FxbANqXV7CZGzzBj+hbAItH/ABPzjboPJBwcqWNsAjJuV6ZzuMFWZt//n7SNS2Wayf
         k0mrNKGCC8fY1WKehL7UEw5/dAFcFbpnJ/yv7FzE7CJKao/3UlEqXPMm3xJWLCuI7yxT
         O8CzgQT7Sxix0lNBYH6ezfmW/UAVM6lry0pzHCbb/L/F8f7HrR6LqIO98R9zi/w7rFMh
         /R/x8fEZNw4g3KbH+LUN3P47dkLHjf+1R/ZqTzZmIB4759TViL/KZQFiUrZS7byD/O7L
         cNXrebX0KFx5LoQJ63cYPxa7yQ7gvN1nrLoRIQrl5djAPy9p+FVedKPFK1VZTmRlT0R7
         6xUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=l7rXrWc9zdyZC8ngED66aztSeYAIdSfuXFbxTohqXwo=;
        b=pztIzGF18Gd2ICdJIh2wbM56UdjCu+zGwhRbzyYAJdqspQlw1jKn5yrL6lZpUuyMNL
         mLSoBi5abx7f9mkRBWgm2Sw9yBXKcLFb/yXJLabMEWVjP09lTR780FBo8TtvdTq8D6dy
         lKvYoLaiJt2mYU/I4IE1Dy6KdtVjjOPB6AU6MwaOKq09uhkaaoIehhFHSc1YEdH8r8Rz
         gy9QzFe2Z0WeQfFcKYi7dhe+ayQ3sooXsPJgbOeecue4XMF43tvcn6OGTk4FhNkWZP93
         2ecaJpQ9DGAMq3Plkv/xIgzgkNMIaRfHk3gKW0LOl4Qv34hLFAftoDhKGKv/oO+Fyhty
         zd1g==
X-Gm-Message-State: APjAAAWcCIc8RxqI/UzsB3sFZ5s7KR/i1+f1xK8RWbiTJ8ETJMYxS5vS
        DrPks+YTirlz9y7I8hw56UsxsA==
X-Google-Smtp-Source: APXvYqxQlqgtwctnFJkk3FTNJcvt4oudhWgrQUyGHRg/Lus5T12Up6Sc2lVZkysElds60n0QZ1910Q==
X-Received: by 2002:a9d:5885:: with SMTP id x5mr311761otg.132.1579539695269;
        Mon, 20 Jan 2020 09:01:35 -0800 (PST)
Received: from minyard.net ([2001:470:b8f6:1b:9c9c:d583:ce3d:f87a])
        by smtp.gmail.com with ESMTPSA id n16sm12479084otk.25.2020.01.20.09.01.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 09:01:34 -0800 (PST)
Date:   Mon, 20 Jan 2020 11:01:32 -0600
From:   Corey Minyard <cminyard@mvista.com>
To:     Asmaa Mnebhi <Asmaa@mellanox.com>
Cc:     Colin King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vadim Pasternak <vadimp@mellanox.com>,
        "openipmi-developer@lists.sourceforge.net" 
        <openipmi-developer@lists.sourceforge.net>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] drivers: ipmi: fix off-by-one bounds check that
 leads to a out-of-bounds write
Message-ID: <20200120170132.GT2886@minyard.net>
Reply-To: cminyard@mvista.com
References: <20200114144031.358003-1-colin.king@canonical.com>
 <DB6PR0501MB2712BEBCF959566EAB063769DA340@DB6PR0501MB2712.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB6PR0501MB2712BEBCF959566EAB063769DA340@DB6PR0501MB2712.eurprd05.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jan 14, 2020 at 03:50:22PM +0000, Asmaa Mnebhi wrote:
> Reviewed-by: Asmaa Mnebhi <asmaa@mellanox.com>

Thanks, I've picked this up in my next tree.

-corey

> 
> -----Original Message-----
> From: Colin King <colin.king@canonical.com> 
> Sent: Tuesday, January 14, 2020 9:41 AM
> To: Corey Minyard <cminyard@mvista.com>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Vadim Pasternak <vadimp@mellanox.com>; Asmaa Mnebhi <Asmaa@mellanox.com>; openipmi-developer@lists.sourceforge.net
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH][next] drivers: ipmi: fix off-by-one bounds check that leads to a out-of-bounds write
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The end of buffer check is off-by-one since the check is against an index that is pre-incremented before a store to buf[]. Fix this adjusting the bounds check appropriately.
> 
> Addresses-Coverity: ("Out-of-bounds write")
> Fixes: 51bd6f291583 ("Add support for IPMB driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/char/ipmi/ipmb_dev_int.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
> index 9fdae83e59e0..382b28f1cf2f 100644
> --- a/drivers/char/ipmi/ipmb_dev_int.c
> +++ b/drivers/char/ipmi/ipmb_dev_int.c
> @@ -279,7 +279,7 @@ static int ipmb_slave_cb(struct i2c_client *client,
>  		break;
>  
>  	case I2C_SLAVE_WRITE_RECEIVED:
> -		if (ipmb_dev->msg_idx >= sizeof(struct ipmb_msg))
> +		if (ipmb_dev->msg_idx >= sizeof(struct ipmb_msg) - 1)
>  			break;
>  
>  		buf[++ipmb_dev->msg_idx] = *val;
> --
> 2.24.0
> 
