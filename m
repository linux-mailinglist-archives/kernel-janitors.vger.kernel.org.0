Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDBF65BD5BC
	for <lists+kernel-janitors@lfdr.de>; Mon, 19 Sep 2022 22:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbiISUef (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 19 Sep 2022 16:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiISUec (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Sep 2022 16:34:32 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B7031B7
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Sep 2022 13:34:27 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id d64-20020a17090a6f4600b00202ce056566so8557069pjk.4
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Sep 2022 13:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=hY1ESHzuc2YXzHNhbXEN0S/ivkwR1R1K5cJrHwLxc/w=;
        b=CImTGElzONiSywCQVLIBEX6bjlro80T+TDvl7o8Es/GrU2DdC/4V6S55pQf9e1+E/R
         FyPSQ/r7LgKAFTCHji0INGEPTvT/W9qjXLj6arA4vkei0kyBV/rTMZtWy5Hum4Mt/RfH
         j5ouP2Hx64Sc3ZjnzaJcuBQcP7RFC4n7zcxudCwriED1GlLlD6AZm7Fj2AElQmju2KGj
         FbrZf4tW+11b/WtEytr764UJ3sFO+qE5YtTPwTnMryqfcztLHGUVunhK9+M/9SoBzAlB
         R3JReO7CYaoGyXKCF7P4rq+41JkCnkMWwyG6BPkz4EJWwVHh+r2OT90Pzo+4CxbFm+si
         mE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=hY1ESHzuc2YXzHNhbXEN0S/ivkwR1R1K5cJrHwLxc/w=;
        b=5pz5tr24G9C8QdXBxkSw924K0VeIwf6uWHOA4zCAZLpmD1wfHXvGa5w4mSYbMErY3y
         1bObvg0/bSrVFE12edKYDq7EjR/JsmjS2vwk/h7QGio0JBcELbQwNI5EfuvZguHmZNzs
         /0SZsJJ0683AibNxIwALcsa37va3uAc+d3macEUDm2p9amIef093+90nTOHYIzXtieSG
         JnDmQVxsLzLb0VNMz456joyv3JM94Hizj4iVJiIPFyIbOFUIwsfDH2fYjSao/a6jHa3q
         W9JZ47vKAnMsqklGj0nqwlImT+z1FAwzU8mq5SI42BFSnCufWi0ZfkD6REID06ehTvye
         8fng==
X-Gm-Message-State: ACrzQf2gFDPgfjaFr33a9YWpkmKguXGCWSzlnU+MNGlfhz0x/GY3fgRY
        FCs41nNSPvB+anxgYKTm1R1Y1A==
X-Google-Smtp-Source: AMsMyM5NtGwlmSJVk/LVY2Ed6VYoj7JcLbYT0SfHoymeN9j/Hc20KcRTnFk77qFbm07V9PzZPLNENw==
X-Received: by 2002:a17:90a:d485:b0:202:e6eb:4b7f with SMTP id s5-20020a17090ad48500b00202e6eb4b7fmr21482465pju.217.1663619666625;
        Mon, 19 Sep 2022 13:34:26 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id b10-20020a17090a6aca00b001f22647cb56sm6986009pjm.27.2022.09.19.13.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 13:34:25 -0700 (PDT)
Date:   Mon, 19 Sep 2022 14:34:23 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] remoteproc: harden rproc_handle_vdev() against integer
 overflow
Message-ID: <20220919203423.GE759648@p14s>
References: <YyMyoPoGOJUcEpZT@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyMyoPoGOJUcEpZT@kili>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 15, 2022 at 05:11:44PM +0300, Dan Carpenter wrote:
> The struct_size() macro protects against integer overflows but adding
> "+ rsc->config_len" introduces the risk of integer overflows again.
> Use size_add() to be safe.
> 
> Fixes: c87846571587 ("remoteproc: use struct_size() helper")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied.

Thanks,
Mathieu

> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index e5279ed9a8d7..4fc5ce2187ac 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -520,12 +520,13 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	struct fw_rsc_vdev *rsc = ptr;
>  	struct device *dev = &rproc->dev;
>  	struct rproc_vdev *rvdev;
> +	size_t rsc_size;
>  	int i, ret;
>  	char name[16];
>  
>  	/* make sure resource isn't truncated */
> -	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
> -			avail) {
> +	rsc_size = struct_size(rsc, vring, rsc->num_of_vrings);
> +	if (size_add(rsc_size, rsc->config_len) > avail) {
>  		dev_err(dev, "vdev rsc is truncated\n");
>  		return -EINVAL;
>  	}
> -- 
> 2.35.1
> 
