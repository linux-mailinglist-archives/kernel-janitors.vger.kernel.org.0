Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E12B8578214
	for <lists+kernel-janitors@lfdr.de>; Mon, 18 Jul 2022 14:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234481AbiGRMUU (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 18 Jul 2022 08:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234913AbiGRMUT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 18 Jul 2022 08:20:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 788112497F
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Jul 2022 05:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658146817;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dT8wclbe0dsDbFDo3wqco9LNIKkqsqCbo2sn9czCEwQ=;
        b=Vc+khjFRWOTX3Dvj7JnPLflUNT8jAmtrifGNmK2yvRzLMSbc1Z5H/iuCbGgkkLCFOncstw
        RVtonrpk1I5Oy+ChIWh429g4kMRvSZmfzZ3VvZs16FaF0qvIsQ07byVo9HYTqGB8M5/Kip
        VsqaVTOCJdtR4EsH3aSNU19WX4UVCO4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-YtucA-rdPumzn4GtpOW_xQ-1; Mon, 18 Jul 2022 08:20:08 -0400
X-MC-Unique: YtucA-rdPumzn4GtpOW_xQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20B9F2919EB7;
        Mon, 18 Jul 2022 12:20:08 +0000 (UTC)
Received: from T590 (ovpn-8-29.pek2.redhat.com [10.72.8.29])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 191482166B26;
        Mon, 18 Jul 2022 12:20:03 +0000 (UTC)
Date:   Mon, 18 Jul 2022 20:19:58 +0800
From:   Ming Lei <ming.lei@redhat.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
        kernel-janitors@vger.kernel.org, ming.lei@redhat.com
Subject: Re: [PATCH 1/3] ublk_drv: fix an IS_ERR() vs NULL check
Message-ID: <YtVP7qLG6Cgx+xCN@T590>
References: <YtVAgedTsQVK1oTM@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtVAgedTsQVK1oTM@kili>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jul 18, 2022 at 02:14:09PM +0300, Dan Carpenter wrote:
> The blk_mq_alloc_disk_for_queue() doesn't return error pointers, it
> returns NULL on error.
> 
> Fixes: cebbe577cb17 ("ublk_drv: fix request queue leak")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/block/ublk_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
> index 52fd0af8a4f2..97725d13e4bd 100644
> --- a/drivers/block/ublk_drv.c
> +++ b/drivers/block/ublk_drv.c
> @@ -1175,8 +1175,8 @@ static int ublk_add_dev(struct ublk_device *ub)
>  
>  	disk = ub->ub_disk = blk_mq_alloc_disk_for_queue(ub->ub_queue,
>  						 &ublk_bio_compl_lkclass);
> -	if (IS_ERR(disk)) {
> -		err = PTR_ERR(disk);
> +	if (!disk) {
> +		err = -ENOMEM;
>  		goto out_free_request_queue;
>  	}

Reviewed-by: Ming Lei <ming.lei@redhat.com>


Thanks,
Ming

