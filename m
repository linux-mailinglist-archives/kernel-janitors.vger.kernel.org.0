Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3DBC746EF4
	for <lists+kernel-janitors@lfdr.de>; Tue,  4 Jul 2023 12:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbjGDKlq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 4 Jul 2023 06:41:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbjGDKlN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 4 Jul 2023 06:41:13 -0400
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3006::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6786E187;
        Tue,  4 Jul 2023 03:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202212; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=sZ7AiJOzzA//Q93VjRWW9dH5MOs3juSEKz6GOzqzlbU=; b=Ms6QAwFXTo5LdGGfFPGLLL364Y
        eMkI5EGIvGVoVLQj/t3fgjelBkqIw9ZFdknLVXb9+x5Q7RVUMMz/SSw8LSFug+UleFjbNV9I0AH+c
        +6hnYKRCWtn+Yz1u3CsxuEAuO888ZtZo4GICIhJ0/fQkq1Ctpv8nK/U4G46NR0ApL5fzStazM2sKI
        zhGojKLwLyeBQlOTcn9JrNG06JeFcT6t78NeqpijsJ61jvf1ZmXppX1BeLlhAlEvX7OdmQtWC/MRi
        c3EA7uLSPD5KEncjFtgwHQTd9W163T2ZoD4RiE5jnx+PIdSbOsQDzlnf8Ud/MBFwGlmCPwmTXc/aP
        viIVyfiw==;
Received: from 65.81-166-157.customer.lyse.net ([81.166.157.65]:58144 helo=[192.168.10.99])
        by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <noralf@tronnes.org>)
        id 1qGdT3-00BcKD-P6;
        Tue, 04 Jul 2023 12:41:09 +0200
Message-ID: <56f6fb34-f130-fddd-ca72-aa87362efd0c@tronnes.org>
Date:   Tue, 4 Jul 2023 12:41:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 03/24] drm/gud: use vmalloc_array and vcalloc
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org, keescook@chromium.org,
        christophe.jaillet@wanadoo.fr, kuba@kernel.org,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        noralf@tronnes.org
References: <20230627144339.144478-1-Julia.Lawall@inria.fr>
 <20230627144339.144478-4-Julia.Lawall@inria.fr>
Content-Language: en-US
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20230627144339.144478-4-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 6/27/23 16:43, Julia Lawall wrote:
> Use vmalloc_array and vcalloc to protect against
> multiplication overflows.
> 
> The changes were done using the following Coccinelle
> semantic patch:
> 
> // <smpl>
> @initialize:ocaml@
> @@
> 
> let rename alloc =
>   match alloc with
>     "vmalloc" -> "vmalloc_array"
>   | "vzalloc" -> "vcalloc"
>   | _ -> failwith "unknown"
> 
> @@
>     size_t e1,e2;
>     constant C1, C2;
>     expression E1, E2, COUNT, x1, x2, x3;
>     typedef u8;
>     typedef __u8;
>     type t = {u8,__u8,char,unsigned char};
>     identifier alloc = {vmalloc,vzalloc};
>     fresh identifier realloc = script:ocaml(alloc) { rename alloc };
> @@
> 
> (
>       alloc(x1*x2*x3)
> |
>       alloc(C1 * C2)
> |
>       alloc((sizeof(t)) * (COUNT), ...)
> |
> -     alloc((e1) * (e2))
> +     realloc(e1, e2)
> |
> -     alloc((e1) * (COUNT))
> +     realloc(COUNT, e1)
> |
> -     alloc((E1) * (E2))
> +     realloc(E1, E2)
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---

Thanks, applied to drm-misc-next.

Noralf.

> v2: Use vmalloc_array and vcalloc instead of array_size.
> This also leaves a multiplication of a constant by a sizeof
> as is.  Two patches are thus dropped from the series.
> 
>  drivers/gpu/drm/gud/gud_pipe.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff -u -p a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -390,7 +390,7 @@ static int gud_fb_queue_damage(struct gu
>  	mutex_lock(&gdrm->damage_lock);
>  
>  	if (!gdrm->shadow_buf) {
> -		gdrm->shadow_buf = vzalloc(fb->pitches[0] * fb->height);
> +		gdrm->shadow_buf = vcalloc(fb->pitches[0], fb->height);
>  		if (!gdrm->shadow_buf) {
>  			mutex_unlock(&gdrm->damage_lock);
>  			return -ENOMEM;
> 
