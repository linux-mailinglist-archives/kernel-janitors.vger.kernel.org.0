Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC27D58DBC9
	for <lists+kernel-janitors@lfdr.de>; Tue,  9 Aug 2022 18:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244966AbiHIQUp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 9 Aug 2022 12:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245015AbiHIQUh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 9 Aug 2022 12:20:37 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B5A20F5B
        for <kernel-janitors@vger.kernel.org>; Tue,  9 Aug 2022 09:20:30 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id z7so3706882qki.11
        for <kernel-janitors@vger.kernel.org>; Tue, 09 Aug 2022 09:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=PG/NzpP7dxYgSbT1VGhdPEfvsq4XeuSudB3XVxm5vho=;
        b=UWFcTHBG5hnvXz+bOhhIMs+36qXUs7LS+bm8wscLrUKvkhW1PkrqNEt32SN2Ch60WF
         45OX0C7T/Y90O6bR2Zck7kKcRKlCcOkgGVzLxYzDIzlMam5/9vHVAZJ5lY0IqoikggDC
         l6VQInX5RJyUjG5en0AgacfSSw/Rk33TfBuyFsDlJytpV4hvFFxhTKyoRwWRne3gTaME
         z0+/6y5mfgFBof4NsOgQGkXMqGfmPgB4+qLmK37PVJ6429s5c58JSUsZjp7umaYRteAq
         vDQoE7TsoLnx7Ne9/uVXyooRLvvPCqsigtYXXv7GIh1oYg2KvI6GyumvSHY+URTg8WJ0
         YkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=PG/NzpP7dxYgSbT1VGhdPEfvsq4XeuSudB3XVxm5vho=;
        b=Er0be+/gsk7ojqBc11K0UjuEGoEx/ijivmEUK142CygfLGy2GMK0Es1foLM8g4jtmO
         +9uxi6ciKtt/krR9hR1bLo/BV2n4WfvQfNiZK78lFCUAVdivPatjqDg7F9bRxxzlni0T
         gv7Ic3JCkwqBvpU4qwkfQ+f39TOIcl1dU10OSgjGPzN35Epavdftij8NScWHYE0fGOKx
         ZkNxdN9fH0zdO5zzcCOSf6/2mTmzMu9+3UgRan3Gur372X1iksM5mK0e8yp/ClwMit65
         0UKVDX87C/5hQEFLSnX3781K7Q8qf563LclTFemb/zm7bbigSmRxWfbQKcbDOuvPwiUw
         Aiuw==
X-Gm-Message-State: ACgBeo2Vv+RmQU7kOMiWvSwmg3d4T1CPEswCefYdOb0JhJglA6tDaa8l
        mI0WPCr2fRoIlLftWtBBHak5/A==
X-Google-Smtp-Source: AA6agR6XqzWz63ok/9lDp5yv2YzmPFN9jxiX+xJ5eurZ4xCN2N8OROoNYGECiJqBxHp+LSIjMnnimw==
X-Received: by 2002:a05:620a:2947:b0:6b9:6fa7:abd1 with SMTP id n7-20020a05620a294700b006b96fa7abd1mr4589260qkp.202.1660062029646;
        Tue, 09 Aug 2022 09:20:29 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id h126-20020a375384000000b006b5cb0c512asm11261863qkb.101.2022.08.09.09.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 09:20:28 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1oLRy0-0067SD-2f;
        Tue, 09 Aug 2022 13:20:28 -0300
Date:   Tue, 9 Aug 2022 13:20:28 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Diana Craciun <diana.craciun@oss.nxp.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        kvm@vger.kernel.org
Subject: Re: [PATCH] vfio/fsl-mc: Fix a typo in a comment
Message-ID: <YvKJTKYv2htxM1n/@ziepe.ca>
References: <2b65bf8d2b4d940cafbafcede07c23c35f042f5a.1659815764.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b65bf8d2b4d940cafbafcede07c23c35f042f5a.1659815764.git.christophe.jaillet@wanadoo.fr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Aug 06, 2022 at 09:56:13PM +0200, Christophe JAILLET wrote:
> L and S are swapped/
> s/VFIO_FLS_MC/VFIO_FSL_MC/
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> All the dev_ logging functions in the file have the "VFIO_FSL_MC: "
> prefix.
> As they are dev_ function, the driver should already be displayed.
> 
> So, does it make sense or could they be all removed?
> ---
>  drivers/vfio/fsl-mc/vfio_fsl_mc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> index 3feff729f3ce..66d01db1d240 100644
> --- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> +++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> @@ -110,7 +110,7 @@ static void vfio_fsl_mc_close_device(struct vfio_device *core_vdev)
>  
>  	if (WARN_ON(ret))
>  		dev_warn(&mc_cont->dev,
> -			 "VFIO_FLS_MC: reset device has failed (%d)\n", ret);
> +			 "VFIO_FSL_MC: reset device has failed (%d)\n", ret);

WARN_ON already prints, this is better written as

WARN(ret, "VFIO_FSL_MC: reset device has failed (%d)\n", ret);

Jason
