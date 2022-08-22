Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF77259BCB0
	for <lists+kernel-janitors@lfdr.de>; Mon, 22 Aug 2022 11:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiHVJUT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 22 Aug 2022 05:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234035AbiHVJUG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 Aug 2022 05:20:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDBAFB49F
        for <kernel-janitors@vger.kernel.org>; Mon, 22 Aug 2022 02:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661160005;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ngqpb8Rvk54UWz4xTDNZ012eO5zct1yya4XBjftITj4=;
        b=CvW6WBIeJ0fMu0sKzhgqy7vQ6LzMdrXBbPt4D4Am6mb61lajoyXRP9ntzFHPxQ+Pz9Rps8
        qD2es1zlsjJyTWNo9e+5iUUXb910VN8CmDa5pkziVzAjD9K/5mp5XJEyHp0ViuZ2zC95II
        5v33FkQkbQ0ULvvPthYmw7hU7Qddzok=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-ToeIBdFJMwihErbdufKduw-1; Mon, 22 Aug 2022 05:19:59 -0400
X-MC-Unique: ToeIBdFJMwihErbdufKduw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A03885A586;
        Mon, 22 Aug 2022 09:19:59 +0000 (UTC)
Received: from localhost (unknown [10.39.193.142])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id C444C2166B26;
        Mon, 22 Aug 2022 09:19:58 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Diana Craciun <diana.craciun@oss.nxp.com>,
        Alex Williamson <alex.williamson@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        kvm@vger.kernel.org
Subject: Re: [PATCH v2] vfio/fsl-mc: Fix a typo in a message
In-Reply-To: <3d2aa8434393ee8d2aa23a620e59ce1059c9d7ad.1660663440.git.christophe.jaillet@wanadoo.fr>
Organization: Red Hat GmbH
References: <3d2aa8434393ee8d2aa23a620e59ce1059c9d7ad.1660663440.git.christophe.jaillet@wanadoo.fr>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date:   Mon, 22 Aug 2022 11:19:57 +0200
Message-ID: <87y1vgocsi.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Aug 16 2022, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> L and S are swapped in the message.
> s/VFIO_FLS_MC/VFIO_FSL_MC/
>
> Also use WARN instead of WARN_ON+dev_warn because WARN can already print
> the message.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Changes in v2:
>   * s/comment/message/ in the subject   [Cornelia Huck <cohuck@redhat.com>]
>   * use WARN instead of WARN_ON+dev_warn   [Jason Gunthorpe <jgg@ziepe.ca>]
>
> v1:
>   https://lore.kernel.org/all/2b65bf8d2b4d940cafbafcede07c23c35f042f5a.1659815764.git.christophe.jaillet@wanadoo.fr/
> ---
>  drivers/vfio/fsl-mc/vfio_fsl_mc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> index 3feff729f3ce..57774009e0eb 100644
> --- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> +++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> @@ -108,9 +108,7 @@ static void vfio_fsl_mc_close_device(struct vfio_device *core_vdev)
>  	/* reset the device before cleaning up the interrupts */
>  	ret = vfio_fsl_mc_reset_device(vdev);
>  
> -	if (WARN_ON(ret))
> -		dev_warn(&mc_cont->dev,
> -			 "VFIO_FLS_MC: reset device has failed (%d)\n", ret);
> +	WARN(ret, "VFIO_FSL_MC: reset device has failed (%d)\n", ret);

Hm, but this drops the device information, not such a fan... maybe the
author can chime in?

>  
>  	vfio_fsl_mc_irqs_cleanup(vdev);
>  

