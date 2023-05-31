Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F072171795B
	for <lists+kernel-janitors@lfdr.de>; Wed, 31 May 2023 10:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234626AbjEaIBI (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 31 May 2023 04:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235096AbjEaH72 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 31 May 2023 03:59:28 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99EBAE52
        for <kernel-janitors@vger.kernel.org>; Wed, 31 May 2023 00:58:58 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f6094cb2d2so56844565e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 31 May 2023 00:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685519937; x=1688111937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LGoVMkHiLGD64s03Y6+AFjuEJ/YkfPkSNgwpozijN6E=;
        b=qpRVmSbM34qqrH3gCx8n/suiBR131xb9ZKYYmYExMuWV3Awb1ou96gvKFE8WKkLtWy
         6ynBunEvz5k0ixVtgEpDcABbi1n57mZJZbs6ilqM8FMO+P5RzD2xBAjeKJT02Fq8lyfK
         POpe/MwOY4D58UyuaPJAhgZNxm0+O+Cqpoa5ZlQd2tE9wXmfHOo0EIRcB4zG7RDWNRs1
         FZDRZlEJA/fMYbTUzYf8RlOvpAodqgxr//acmFAASaD8EcKa1CaqNfrccXDETzaLWwn4
         P5WUgvzSn630/95baknVapsYOZTwgIrev04E6KJ6IBCY0NENQIewnXwSNuHnEcr4d08A
         UXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685519937; x=1688111937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGoVMkHiLGD64s03Y6+AFjuEJ/YkfPkSNgwpozijN6E=;
        b=WTlvmDME4mZIrxxK3F2l7dJiEoR/tKSwSRH7Mey1PVd3HItLqVPxuZYgsoPTQ8X4+p
         c2Hh2lqn8jdAUiTBpi1zivWDqoFFlB9dCkOSSal4Pu9LM+IIGlLd+TAEOCc3rR9byEOX
         de3vZZJrtIYLlhJqhCRV/+QMbCmXHKHATTznf4xmr6mr3WqxyRwSaP/ZYoHqC6RJkK6P
         Q3+WDjZw7MvjxVF4JLknrJj7W+cNnmJ7+yqtaHFJ33ZNu9AW1DQYoHNIZQCM34oP3hcb
         qvx92T7suFlL/GWmuur0d20l4RJJDYu4fEjaayF/nMdjQYFY8+9OhFpZ4iJI1r/Rm6UA
         jEQg==
X-Gm-Message-State: AC+VfDyy3wD6C5m1HknWqzvatv1QigGPk6fApSGse8/G/Y9lHe8LzXvb
        nwY11oAANZw84ZhBUJoA4Xqg9Q==
X-Google-Smtp-Source: ACHHUZ58AYa3MbtCcRUbj2mx8+2x0cns1qme0y7htZXh4dwN06OjOF6OPHWMbG5Q32MOUvkb2dNK7Q==
X-Received: by 2002:a05:600c:b44:b0:3f2:48dc:5e02 with SMTP id k4-20020a05600c0b4400b003f248dc5e02mr3192671wmr.27.1685519937097;
        Wed, 31 May 2023 00:58:57 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s26-20020a7bc39a000000b003f42328b5d9sm19765106wmj.39.2023.05.31.00.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 00:58:54 -0700 (PDT)
Date:   Wed, 31 May 2023 10:58:51 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     NeilBrown <neilb@suse.de>
Cc:     Stanislav Kinsbursky <skinsbursky@parallels.com>,
        Chuck Lever <chuck.lever@oracle.com>,
        Jeff Layton <jlayton@kernel.org>,
        Trond Myklebust <trond.myklebust@hammerspace.com>,
        Anna Schumaker <anna@kernel.org>,
        "J. Bruce Fields" <bfields@redhat.com>, linux-nfs@vger.kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] nfsd: fix double fget() bug in __write_ports_addfd()
Message-ID: <9279444f-b113-41ad-afaa-c6b550104906@kili.mountain>
References: <9c90e813-c7fb-4c90-b52b-131481640a78@kili.mountain>
 <168548566376.23533.14778348024215909777@noble.neil.brown.name>
 <58fd7e35-ba6c-432e-8e02-9c5476c854b4@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58fd7e35-ba6c-432e-8e02-9c5476c854b4@kili.mountain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, May 31, 2023 at 10:48:09AM +0300, Dan Carpenter wrote:
>  	err = nfsd_create_serv(net);
>  	if (err != 0)
> -		return err;
> +		goto out_put_sock;
>  
> -	err = svc_addsock(nn->nfsd_serv, fd, buf, SIMPLE_TRANSACTION_LIMIT, cred);
> +	err = svc_addsock(nn->nfsd_serv, so, buf, SIMPLE_TRANSACTION_LIMIT, cred);
> +	if (err)
> +		goto out_put_net;

Oops.  This change is wrong.  svc_addsock() actually does return
positive values on success.

>  
> -	if (err >= 0 &&
> -	    !nn->nfsd_serv->sv_nrthreads && !xchg(&nn->keep_active, 1))
> +	if (!nn->nfsd_serv->sv_nrthreads && !xchg(&nn->keep_active, 1))
>  		svc_get(nn->nfsd_serv);
>  
>  	nfsd_put(net);
> +	return 0;

Also wrong (same bug).

> +
> +out_put_net:
> +	nfsd_put(net);
> +out_put_sock:
> +	sockfd_put(so);
>  	return err;
>  }

regards,
dan carpenter
