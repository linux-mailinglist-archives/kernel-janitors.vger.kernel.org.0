Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C53A6228432
	for <lists+kernel-janitors@lfdr.de>; Tue, 21 Jul 2020 17:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729840AbgGUPu1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 21 Jul 2020 11:50:27 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44374 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726029AbgGUPu1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Jul 2020 11:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595346625;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T1eqkdT+65WSXffQEgvHX8BA45HzVx3nhgyMOFl0KCM=;
        b=LXDYYUVkCAmxYiakMNh2CR5elrdytu8V4UulWPWam2ttJLIL4xtQSewlVYCUoJkvl2G2Tm
        S6YuihhI9B6Ry3rOqBh5uNeKaFSgS0fjWiP5bfmpagC3EH7HQ+vyhW/l1n8+GmeShkestA
        mrp1EA8552ppVvqNEyo1fDsCnAMKt6Y=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-uo_JXHtWMrmsWGJPo8a_VQ-1; Tue, 21 Jul 2020 11:50:23 -0400
X-MC-Unique: uo_JXHtWMrmsWGJPo8a_VQ-1
Received: by mail-qt1-f198.google.com with SMTP id q7so14629464qtq.14
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Jul 2020 08:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=T1eqkdT+65WSXffQEgvHX8BA45HzVx3nhgyMOFl0KCM=;
        b=RR1gpN1CTSX9GB9hShSsU3Xiaer/S2yW7AX5WJHpJyGRbyw+CfuMs5PWDtnXE5eqeR
         X7v8KxtEF61h8c3y2uHVSxQkgCCNJXat377Xs3L+WLQzpRSW4YS3/xIra1GykxNIo5oc
         /mi9K0RjwPFuXJseS9GN/Sa9rrt76NcAFR6PKchVcuk41Jz9ar+GdjYplHgi/ZphUcoC
         uJyhgCmrzFZjVUdTGbXKIK/DCYgZyVeacPIA353aKko/geCgUotQiT6dTIaHhc2gSwVl
         qCXbcT0zHOJfLX1qHQSkXmmhNWeNNiebRsK8+Htt7dq/4Amjlfex/aJ4w16yEpewgAlq
         Lbag==
X-Gm-Message-State: AOAM533xgYFs6nkg/3YQne+YTeyfA36j9sDgVJ88r6dAFSd09evD1dHC
        pvdE/dYIvVWeOOLRbi3UdA48pwwWIdaXWNcKLW1WR6f31VKnM/ATIk6NhhwHp8NJdqzOKTf5hQv
        Pz/APZ7jsG9evlO22U/OHWlnK8ncd
X-Received: by 2002:aed:2f46:: with SMTP id l64mr29601839qtd.1.1595346622841;
        Tue, 21 Jul 2020 08:50:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRfxmS1vh9brmkhzM4t8kBfNgHEn/slIPecHCsCE4ib2gN5E/VVud9VW0vl+hQQ4YSUuRZ2Q==
X-Received: by 2002:aed:2f46:: with SMTP id l64mr29601827qtd.1.1595346622609;
        Tue, 21 Jul 2020 08:50:22 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id m17sm202763qtm.92.2020.07.21.08.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 08:50:21 -0700 (PDT)
Message-ID: <4e90a54c61e3ecb19802d7ea811c58a51ac457ed.camel@redhat.com>
Subject: Re: [PATCH -next] drm/nouveau/kms/nvd9-: Fix file release memory
 leak
From:   Lyude Paul <lyude@redhat.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Date:   Tue, 21 Jul 2020 11:50:20 -0400
In-Reply-To: <20200721151701.51412-1-weiyongjun1@huawei.com>
References: <20200721151701.51412-1-weiyongjun1@huawei.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks!

On Tue, 2020-07-21 at 15:17 +0000, Wei Yongjun wrote:
> When using single_open() for opening, single_release() should be
> used instead of seq_release(), otherwise there is a memory leak.
> 
> Fixes: 12885ecbfe62 ("drm/nouveau/kms/nvd9-: Add CRC support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/crc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> index f17fb6d56757..4971a1042415 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> @@ -706,6 +706,7 @@ static const struct file_operations
> nv50_crc_flip_threshold_fops = {
>  	.open = nv50_crc_debugfs_flip_threshold_open,
>  	.read = seq_read,
>  	.write = nv50_crc_debugfs_flip_threshold_set,
> +	.release = single_release,
>  };
>  
>  int nv50_head_crc_late_register(struct nv50_head *head)
> 
> 
> 
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

