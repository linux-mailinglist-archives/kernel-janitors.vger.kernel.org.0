Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48203583DE8
	for <lists+kernel-janitors@lfdr.de>; Thu, 28 Jul 2022 13:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235978AbiG1LoW (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 28 Jul 2022 07:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236101AbiG1LoW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 28 Jul 2022 07:44:22 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30B296591
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Jul 2022 04:44:21 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id y11so2443142lfs.6
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Jul 2022 04:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tbXP8qNprGm58AEISDfBUgGwntYkFNWKEaIhjBXeL5Y=;
        b=esxMVpWf7Ufk58lF0ldIcDSVr5QyRlOOu7fM0kl4YwnV5Vpr3L9RxQ6e2shda+3p5T
         anWabe2tUmuF197IvT7ZJkXHwAphqfxjJHhhG8AqwW3AxTfmDAk9+mbnX1rTe+W07qcr
         iIaldCEKZiMGxnKzD0pjfoQDFG16v+3Dw5AJv4co3fpgUu9jAmIt1UoRNxePn12sb8Fm
         IwI1IrMeaeNHgGXfoSN8rpAxfgmk3xHUlwnFlWTwO4+oqeZkbit28U/hmF4joT1SO3Jr
         atgsaFQ8FmeveNNYRv4ffpDnZhcACv8GHUx1bZZxisrjRzOS2ZSeGpNIXNv4a43oYmSV
         DDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tbXP8qNprGm58AEISDfBUgGwntYkFNWKEaIhjBXeL5Y=;
        b=oNuf8tPqvbzHxhSC4d8zGejh4Tp5Z+CDTD5jaaWn6HmUmVP+E8vlopP/AooY+f63Zm
         IVBOQVQ3wDQaogeZapiEPJ1HwQHRMPaSCk4PR6z1irPFwmsmfEFZhURHfyx7x5LJ0fJX
         uPyAY4HGIdrhpp8vhTgg31O5k3Bk+H2Vw4aABeWhLA8eXGA+vdT8Smt/ced0NyjHiWby
         0nOmWYlrn/SFxWuP6VOqRc+ragWbllBbDNn6PvDMiRYMNyjQJup0H3bcjjrRa/LcXdh6
         yS3ya96NVS1PusW4fq8GzOLQvLWWOQj6SxKykyS5XqZVcwPNYTwVp2TFL8R0agOSZNkd
         fUeg==
X-Gm-Message-State: AJIora9qVtEdQO4YQ50yVTJoV3n9XtP3rkqcr2a9HMOBPddyVN2Z5BF1
        qEzaUgvSMMy5bFbLSFYJsEM=
X-Google-Smtp-Source: AGRyM1tEOsvAfwLqoLibNHpjwJhC83hvw9zfhdQw7Y85VRUWXN1y5KpC76gcjsEyggJXeii+igNP7A==
X-Received: by 2002:a05:6512:3691:b0:48a:81ff:343d with SMTP id d17-20020a056512369100b0048a81ff343dmr9863235lfs.553.1659008659563;
        Thu, 28 Jul 2022 04:44:19 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id u21-20020ac25195000000b0047fa16f71e6sm167045lfi.30.2022.07.28.04.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 04:44:18 -0700 (PDT)
Date:   Thu, 28 Jul 2022 14:44:17 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jon Mason <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>,
        Dave Jiang <dave.jiang@intel.com>, ntb@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] NTB: ntb_tool: uninitialized heap data in tool_fn_write()
Message-ID: <20220728114417.hkhnv4lkqy6uzqq3@mobilestation>
References: <YthJQqfMCb47jHbG@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YthJQqfMCb47jHbG@kili>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jul 20, 2022 at 09:28:18PM +0300, Dan Carpenter wrote:
> The call to:
> 
> 	ret = simple_write_to_buffer(buf, size, offp, ubuf, size);
> 
> will return success if it is able to write even one byte to "buf".
> The value of "*offp" controls which byte.  This could result in
> reading uninitialized data when we do the sscanf() on the next line.
> 
> This code is not really desigined to handle partial writes where
> *offp is non-zero and the "buf" is preserved and re-used between writes.
> Just ban partial writes and replace the simple_write_to_buffer() with
> copy_from_user().
> 
> Fixes: 578b881ba9c4 ("NTB: Add tool test client")

Looks good. Thanks.
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/ntb/test/ntb_tool.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/ntb/test/ntb_tool.c b/drivers/ntb/test/ntb_tool.c
> index b7bf3f863d79..5ee0afa621a9 100644
> --- a/drivers/ntb/test/ntb_tool.c
> +++ b/drivers/ntb/test/ntb_tool.c
> @@ -367,14 +367,16 @@ static ssize_t tool_fn_write(struct tool_ctx *tc,
>  	u64 bits;
>  	int n;
>  
> +	if (*offp)
> +		return 0;
> +
>  	buf = kmalloc(size + 1, GFP_KERNEL);
>  	if (!buf)
>  		return -ENOMEM;
>  
> -	ret = simple_write_to_buffer(buf, size, offp, ubuf, size);
> -	if (ret < 0) {
> +	if (copy_from_user(buf, ubuf, size)) {
>  		kfree(buf);
> -		return ret;
> +		return -EFAULT;
>  	}
>  
>  	buf[size] = 0;
> -- 
> 2.35.1
> 
> 
