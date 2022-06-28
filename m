Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 864C955CDF1
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Jun 2022 15:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242516AbiF1H0W (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 28 Jun 2022 03:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242568AbiF1H0R (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 28 Jun 2022 03:26:17 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD7D22CE24
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Jun 2022 00:26:15 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 85B676601856;
        Tue, 28 Jun 2022 08:26:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1656401174;
        bh=suXARUlqolSyiyZzoBq0PQIQXSuftLrXkHbx60ZkKso=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=IscQs1pzPwiYacCIUqogKrTu3P8hiBbpw8TUGn93rSNP11fK3wIz2twuEs2rqGIPC
         80B7a1NTWSR1s8R4fxMFsD7Jth9FZzwUdvyQkoqKM0hyF6wES3zYGYlh4LKs/kUWOl
         c+UUspNmbbaX3Eordg//GgNxwKxoGqs4zLiZfFpGVIQF2CTuQZykVbQd/S6G2LtY2f
         0N0FETqRjQ5FmWmouE6KCAX5Cj1A7tZ4V79evdz+cBGqmIuZxn/rpUoC+1BRYMjErx
         KOpR3utIc7tYjtFl1yQnhe/f8QWtqnMDUVuPi+nhyUmsJqDnboABR41WX9FhuuAM9T
         jPiyjrFtxtUZg==
Date:   Tue, 28 Jun 2022 09:26:09 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: Avoid uninitialized variable warning
Message-ID: <20220628092609.7d0b1ea3@collabora.com>
In-Reply-To: <Yrqm5yYVa6xMY2vq@kili>
References: <Yrqm5yYVa6xMY2vq@kili>
Organization: Collabora
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 28 Jun 2022 09:59:51 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This works, but technically it uses "num_in_bus_fmts" before it has been
> initialized so it leads to static checker warnings and probably KMEMsan
> warnings at run time.  Reverse the checks so it checks for failure first
> and then check for unsupported formats next.
> 
> Fixes: f32df58acc68 ("drm/bridge: Add the necessary bits to support bus format negotiation")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index e275b4ca344b..00cbde654472 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -897,10 +897,10 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
>  							conn_state,
>  							out_bus_fmt,
>  							&num_in_bus_fmts);
> -	if (!num_in_bus_fmts)
> -		return -ENOTSUPP;
> -	else if (!in_bus_fmts)
> +	if (!in_bus_fmts)
>  		return -ENOMEM;
> +	else if (!num_in_bus_fmts)
> +		return -ENOTSUPP;

Well, it changes the error we return when num_in_bus_fmts = 0
&& in_bus_fmts == NULL which is not an ENOMEM situation, so I'd rather
initialize num_{in,out}_bus_fmts to 0 here.

>  
>  	if (first_bridge == cur_bridge) {
>  		cur_state->input_bus_cfg.format = in_bus_fmts[0];
> @@ -993,10 +993,10 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
>  							crtc_state,
>  							conn_state,
>  							&num_out_bus_fmts);
> -		if (!num_out_bus_fmts)
> -			return -ENOTSUPP;
> -		else if (!out_bus_fmts)
> +		if (!out_bus_fmts)
>  			return -ENOMEM;
> +		else if (!num_out_bus_fmts)
> +			return -ENOTSUPP;
>  	} else {
>  		num_out_bus_fmts = 1;
>  		out_bus_fmts = kmalloc(sizeof(*out_bus_fmts), GFP_KERNEL);

