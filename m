Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42ACE7A0E93
	for <lists+kernel-janitors@lfdr.de>; Thu, 14 Sep 2023 21:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbjINTyA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 14 Sep 2023 15:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjINTx7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 Sep 2023 15:53:59 -0400
Received: from out-215.mta0.migadu.com (out-215.mta0.migadu.com [91.218.175.215])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 633E526B8
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Sep 2023 12:53:55 -0700 (PDT)
Date:   Thu, 14 Sep 2023 15:53:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1694721232;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=n/V9mDPlBb+hzGkiVeVycrEpppJ/yuLI+34FNkiVo3I=;
        b=o2cx2cODMZ83S2wl/LaQLKWz55pqmCUEMG6/bKenksvdWssIoTxZuJp40bcn4zL4KrKOcP
        PoXetd1egM/jGXMMPzYICSvMoDgYuAsytQkpUpnhP8Nwh/GPzcOmibwqngyhb0inHG2RB0
        jsxMcXTc/umH5YE+XTQoWFhOaFUPVQE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Kent Overstreet <kent.overstreet@gmail.com>,
        Brian Foster <bfoster@redhat.com>,
        linux-bcachefs@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/3] bcachefs: chardev: return -EFAULT if copy_to_user()
 fails
Message-ID: <20230914195349.owzmdq6bjnyozni3@moria.home.lan>
References: <6f3b0d3e-d20e-47fc-a3e5-4ad4c03d58b8@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f3b0d3e-d20e-47fc-a3e5-4ad4c03d58b8@moroto.mountain>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 14, 2023 at 05:58:07PM +0300, Dan Carpenter wrote:
> The copy_to_user() function returns the number of bytes remaining but
> we want to return -EFAULT to the user.
> 
> Fixes: e0750d947352 ("bcachefs: Initial commit")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks - never liked this about copy_to_user(), that behaviour is
practically never what we want, maybe we could get a helper that returns
the proper error code someday...

> ---
>  fs/bcachefs/chardev.c | 30 ++++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/bcachefs/chardev.c b/fs/bcachefs/chardev.c
> index fb603df099a5..e5e9fddddfb5 100644
> --- a/fs/bcachefs/chardev.c
> +++ b/fs/bcachefs/chardev.c
> @@ -149,9 +149,10 @@ static long bch2_global_ioctl(unsigned cmd, void __user *arg)
>  static long bch2_ioctl_query_uuid(struct bch_fs *c,
>  			struct bch_ioctl_query_uuid __user *user_arg)
>  {
> -	return copy_to_user(&user_arg->uuid,
> -			    &c->sb.user_uuid,
> -			    sizeof(c->sb.user_uuid));
> +	if (copy_to_user(&user_arg->uuid, &c->sb.user_uuid,
> +			 sizeof(c->sb.user_uuid)))
> +		return -EFAULT;
> +	return 0;
>  }
>  
>  #if 0
> @@ -338,7 +339,10 @@ static ssize_t bch2_data_job_read(struct file *file, char __user *buf,
>  	if (len < sizeof(e))
>  		return -EINVAL;
>  
> -	return copy_to_user(buf, &e, sizeof(e)) ?: sizeof(e);
> +	if (copy_to_user(buf, &e, sizeof(e)))
> +		return -EFAULT;
> +
> +	return sizeof(e);
>  }
>  
>  static const struct file_operations bcachefs_data_ops = {
> @@ -466,9 +470,11 @@ static long bch2_ioctl_fs_usage(struct bch_fs *c,
>  	percpu_up_read(&c->mark_lock);
>  	kfree(src);
>  
> -	if (!ret)
> -		ret = copy_to_user(user_arg, arg,
> -			sizeof(*arg) + arg->replica_entries_bytes);
> +	if (ret)
> +		goto err;
> +	if (copy_to_user(user_arg, arg,
> +			 sizeof(*arg) + arg->replica_entries_bytes))
> +		ret = -EFAULT;
>  err:
>  	kfree(arg);
>  	return ret;
> @@ -513,7 +519,10 @@ static long bch2_ioctl_dev_usage(struct bch_fs *c,
>  
>  	percpu_ref_put(&ca->ref);
>  
> -	return copy_to_user(user_arg, &arg, sizeof(arg));
> +	if (copy_to_user(user_arg, &arg, sizeof(arg)))
> +		return -EFAULT;
> +
> +	return 0;
>  }
>  
>  static long bch2_ioctl_read_super(struct bch_fs *c,
> @@ -550,8 +559,9 @@ static long bch2_ioctl_read_super(struct bch_fs *c,
>  		goto err;
>  	}
>  
> -	ret = copy_to_user((void __user *)(unsigned long)arg.sb,
> -			   sb, vstruct_bytes(sb));
> +	if (copy_to_user((void __user *)(unsigned long)arg.sb, sb,
> +			 vstruct_bytes(sb)))
> +		ret = -EFAULT;
>  err:
>  	if (!IS_ERR_OR_NULL(ca))
>  		percpu_ref_put(&ca->ref);
> -- 
> 2.39.2
> 
