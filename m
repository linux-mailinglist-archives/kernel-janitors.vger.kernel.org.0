Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0686E7A0E99
	for <lists+kernel-janitors@lfdr.de>; Thu, 14 Sep 2023 21:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbjINT4N (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 14 Sep 2023 15:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjINT4N (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 Sep 2023 15:56:13 -0400
X-Greylist: delayed 135 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 14 Sep 2023 12:56:08 PDT
Received: from out-215.mta0.migadu.com (out-215.mta0.migadu.com [IPv6:2001:41d0:1004:224b::d7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C839A26B8
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Sep 2023 12:56:08 -0700 (PDT)
Date:   Thu, 14 Sep 2023 15:56:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1694721367;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lIeNziu5d/91jzA9cz0Wp32gKclV5K73uMUzd4K9O0A=;
        b=SPdzjWFKCP5lgikxsgv5VorH692Kh2XY4YU3PWj6F6majiyOYkV9GrGq1qQGpaRqnfHktH
        tSuEg0jLULkAWZvdch+/ONiDEF6miCDxrvLrlAq915iJrSHWE8QqkKKeazlzolUtlG1cqO
        GK+AMYxCCjxTn2kywdaX7/cgYJI4LM8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Kent Overstreet <kent.overstreet@gmail.com>,
        Brian Foster <bfoster@redhat.com>,
        linux-bcachefs@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/3] bcachefs: chardev: fix NULL vs IS_ERR() checks
Message-ID: <20230914195604.vjshvlv76zknbgvu@moria.home.lan>
References: <6f3b0d3e-d20e-47fc-a3e5-4ad4c03d58b8@moroto.mountain>
 <043689fd-b686-429f-a4bb-602c37578370@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <043689fd-b686-429f-a4bb-602c37578370@moroto.mountain>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 14, 2023 at 05:58:48PM +0300, Dan Carpenter wrote:
> The strndup_user() function returns error pointers on error.  It never
> returns NULL.  Fix the checks including the commented out code.

My preferred style in bcachefs is

ret = PTR_ERR_OR_ZERO(p);
if (ret)
	return ret;

It keeps things consistent when we're doing a goto err instead of a
return.

> 
> Fixes: e0750d947352 ("bcachefs: Initial commit")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  fs/bcachefs/chardev.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/bcachefs/chardev.c b/fs/bcachefs/chardev.c
> index e5e9fddddfb5..5556bb2dc539 100644
> --- a/fs/bcachefs/chardev.c
> +++ b/fs/bcachefs/chardev.c
> @@ -86,8 +86,8 @@ static long bch2_ioctl_assemble(struct bch_ioctl_assemble __user *user_arg)
>  		devs[i] = strndup_user((const char __user *)(unsigned long)
>  				       user_devs[i],
>  				       PATH_MAX);
> -		if (!devs[i]) {
> -			ret = -ENOMEM;
> +		if (IS_ERR(devs[i])) {
> +			ret = PTR_ERR(devs[i]);
>  			goto err;
>  		}
>  	}
> @@ -117,8 +117,8 @@ static long bch2_ioctl_incremental(struct bch_ioctl_incremental __user *user_arg
>  		return -EINVAL;
>  
>  	path = strndup_user((const char __user *)(unsigned long) arg.dev, PATH_MAX);
> -	if (!path)
> -		return -ENOMEM;
> +	if (IS_ERR(path))
> +		return PTR_ERR(path);
>  
>  	err = bch2_fs_open_incremental(path);
>  	kfree(path);
> @@ -189,8 +189,8 @@ static long bch2_ioctl_disk_add(struct bch_fs *c, struct bch_ioctl_disk arg)
>  		return -EINVAL;
>  
>  	path = strndup_user((const char __user *)(unsigned long) arg.dev, PATH_MAX);
> -	if (!path)
> -		return -ENOMEM;
> +	if (IS_ERR(path))
> +		return PTR_ERR(path);
>  
>  	ret = bch2_dev_add(c, path);
>  	kfree(path);
> @@ -231,8 +231,8 @@ static long bch2_ioctl_disk_online(struct bch_fs *c, struct bch_ioctl_disk arg)
>  		return -EINVAL;
>  
>  	path = strndup_user((const char __user *)(unsigned long) arg.dev, PATH_MAX);
> -	if (!path)
> -		return -ENOMEM;
> +	if (IS_ERR(path))
> +		return PTR_ERR(path);
>  
>  	ret = bch2_dev_online(c, path);
>  	kfree(path);
> -- 
> 2.39.2
> 
