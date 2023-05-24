Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8873670FD8A
	for <lists+kernel-janitors@lfdr.de>; Wed, 24 May 2023 20:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236848AbjEXSLJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 24 May 2023 14:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236057AbjEXSLI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 24 May 2023 14:11:08 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2E8B6;
        Wed, 24 May 2023 11:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1684951856; x=1685556656; i=deller@gmx.de;
 bh=PX6l2+dRfCXuhXDmiXC0qZdP0ZuQhXi2T02P+uceBMA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=egy1v9c4H/TCIUb3R1jINF01kAoJ/wzFLbOmKS56ifrELGra9tfg3RG+XArT5f409UVTc9c
 mukLagydXi/1exUwqljACh0G1J7RN1QVc/AyuO+W6WOM65wbii1qC8+78FpZWy4E4WL34AJRR
 P3wDItMQ9u1QpYOUUwb/IYW8wZVbyJP44dr19/0jTT42ptOijcRW5l3OzZeaqVrxkzp2yN3J+
 vYyZiFokaVcH0HBkw5r+h1qtJrN9+S0dPsV5mjYX3q/6GV8j3dtTk9LJnsPBtksW1lS4uLDpR
 5C4i40i/jTktWU65/Bgq1NW7YW5sveGUp+bm2JAufBTkdkJbXEyw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.145.4]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8ygO-1q4cVC1PFO-0068mJ; Wed, 24
 May 2023 20:10:56 +0200
Message-ID: <35bb7db7-bf14-20ba-3bff-80d05c42e28b@gmx.de>
Date:   Wed, 24 May 2023 20:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] fbdev: Move two variable assignments in
 fb_alloc_cmap_gfp()
Content-Language: en-US
To:     Markus Elfring <Markus.Elfring@web.de>,
        kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Cc:     LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
References: <8f0bcb48-7677-340d-282e-27f6fe063c6b@web.de>
 <341b4af7-5c6c-cbd2-6fe3-c0e4e58f3c7d@web.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <341b4af7-5c6c-cbd2-6fe3-c0e4e58f3c7d@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:L50JDaxHIw1ErP6ds8mw4snHYBR9Vh3lZepm9cyz+wRsl5vmDPv
 W18dS73RGm8bZ8n8r1KcWYHjMA8XsR+8E1LKIXRFhPdAe/ZOikI4sgxMzcLVdOqryCNsaoS
 2hLnXBcH/EGsX90g3TMg04vEhGBD7gffu+W7duwP2MGMwqfU8TqDzdm+3bjiKIZmRXvdCF7
 eZiQN0NkGx9Gj3lFqw1wg==
UI-OutboundReport: notjunk:1;M01:P0:dcabAtqFmMo=;MRsvEB2fpSzJcl5nWEe4w2X/Jtx
 0B2Y/RksUjIPlyQu4WcW6V8LZKjKVzeI/S57lvHrIwqNB15PrDorg5wVYXZTs2mB/MNuNMkiN
 3Y6UB+BOVVTKk7hxm2rcRPjiLwB3fEm/0djO1yapE7Ou2SOn2CpBFpSeSwfMVZx56xSb1F+ih
 o8QCYbZqkY5T28Sflhk+x0CPDJsUhnW44XfwdWzS+RQ5UP+7JBeUTEijTJxKqt0Y94sbqoN+a
 54eB31VavK0+Y+HV4VK3LSRhRTrJ7ADKpIP7lwutrn8sWzE6z1DACtbyy4vLh1pQ8PwQLzosl
 4JhKZFjZP8vrPdFGvJNLV7t5OPrij8hxQEPysGZtzCgXfvdmPqRGJ8f6m1Su874HrVDPVeE2B
 h47ho3NWRmlzCztoXwvXzDuBbLFoj/nHMbWKzP3aTHArM3jftIK7y+grQtTwqkfnsCkBworxI
 mGG82+1odfV6U4PErnFJi84TmklaB1lQyxDdWYlvRp2ONbZIIa19Auew0PJmKXRl2AUi48mnz
 RMWpXnfXJac3q0IW9fn+5cd6CB+VHk7i5M2YLz24tKFOLgunc9kV5TG5i/DdRrGFwcmugjW57
 IdgG6pXGLNzCnM3Sz4B7AquTqU+Q0YfPQcBDPahc1M/d9gIb1gyVno488qbMCoZDabOT1oRXF
 3YKh2kKhoJNMXH1uvoljUZ4OOKdfjLc/n5LLWhDrOdA0GsBw3M/n87ZuLdCMG2qH4FXAfR/Xq
 scxwASeoJ1xjZtspuffLKEMyxCimTnC0B10iBwZbIb9dFkMGre5caCYLYMWNlktE4uMNVJaOx
 hrj6157DSLw8XZCoa7p7D52xnZggHvbYHOC34JBgoZqkx8kFg1x3BocfCHXAnMZ67Ww2gfLg4
 3gDCh/8EohJ4axKQRDWBEuFJvi6+SOYna0GeQaT7Dq7qUFT+5Vy0c/J5PVo8CWXFTcq74Wc5h
 CFAoCw==
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 5/23/23 22:15, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 23 May 2023 21:30:29 +0200
>
> Move the assignment for the local variables =E2=80=9Csize=E2=80=9D and =
=E2=80=9Cflags=E2=80=9D
> because the computed values were only used in a single if branch.

Please do not move such variables without real need.
It makes backporting (of this and maybe follow-up patches) much more
complicated and the compiler will optimize it anyway.

Thanks!
Helge


> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/video/fbdev/core/fbcmap.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcmap.c b/drivers/video/fbdev/cor=
e/fbcmap.c
> index ff09e57f3c38..5c1075ed28ab 100644
> --- a/drivers/video/fbdev/core/fbcmap.c
> +++ b/drivers/video/fbdev/core/fbcmap.c
> @@ -91,16 +91,17 @@ static const struct fb_cmap default_16_colors =3D {
>
>   int fb_alloc_cmap_gfp(struct fb_cmap *cmap, int len, int transp, gfp_t=
 flags)
>   {
> -	int size =3D len * sizeof(u16);
>   	int ret =3D -ENOMEM;
>
> -	flags |=3D __GFP_NOWARN;
> -
>   	if (cmap->len !=3D len) {
> +		int size;
> +
>   		fb_dealloc_cmap(cmap);
>   		if (!len)
>   			return 0;
>
> +		size =3D len * sizeof(u16);
> +		flags |=3D __GFP_NOWARN;
>   		cmap->red =3D kzalloc(size, flags);
>   		if (!cmap->red)
>   			goto fail;
> --
> 2.40.1
>

