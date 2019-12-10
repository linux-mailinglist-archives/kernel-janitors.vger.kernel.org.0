Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF40B1183E1
	for <lists+kernel-janitors@lfdr.de>; Tue, 10 Dec 2019 10:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbfLJJpN (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 10 Dec 2019 04:45:13 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:45985 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727016AbfLJJpN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 10 Dec 2019 04:45:13 -0500
Received: by mail-ot1-f68.google.com with SMTP id 59so14921894otp.12
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Dec 2019 01:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f0hX1Q9n2M6XKrv28o3J4nDH2VccV/c+e5EpwuDXaV8=;
        b=eYtAXHNjbJi0coWRbSWx/MvEE1yATN8Gf5ucGHbk8+GIV8B+gUo0G6Rl1iXdXwCu9h
         AbjbQbUWzVO/Bg2sZ5hP7E2TUpAmKWVNxbhVJPF4B/wATGIilAc/aF+BL/Xc2O+uJbjy
         fuAzaQr/FOWKBKl3+R0ue65031yPbkBhG3ZeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f0hX1Q9n2M6XKrv28o3J4nDH2VccV/c+e5EpwuDXaV8=;
        b=ZtMw6dZkKMvcyUnrCsT1zOd+GjOK57H9vraBhRt/JBPmUDnqQwvImnH872cZJCFeWU
         Q573wrAQJBd+nHdc+7xYJ5XYYc4L0fDA24OxZ0tCnlhjbes6qZbqSEw4EDIx2kv/D0kF
         srORcOfOv09dk+SrcODn84pB0uouZad2StxPpbyvcq/qFlvN/UHCH6v/6/jmVJ6zkgVl
         3Lq4ZHJt9YvqZ3aXkylHAXsmJhtvPXK3TzSy3GmtwYKuiFz2oWj5ipqg2GS/Wxzj1EPU
         QuBjdoi43sfgATc2DXN2wRLWW+tt9ja/hwmoKaqb4zXwhyVU96ArN67c+QX7y2+1bG1d
         EAGg==
X-Gm-Message-State: APjAAAVgAW2Lv/8JMPqgQPrbLhf7Qf2MJc8+7NUPd/JDepCy++jerLL9
        JZ5cOqWExCysodYL/0ptNM53jgj0KcvBWhuC1fuCXQ==
X-Google-Smtp-Source: APXvYqzXmWF7kmHvwlQo+xBOGKIDgKUXO26i22KHYHNWJeQSopq7Stgp7SZXldjNy69rP8d22wWHs8UPpwcU7bWGHKg=
X-Received: by 2002:a9d:76c5:: with SMTP id p5mr10471945otl.61.1575971112100;
 Tue, 10 Dec 2019 01:45:12 -0800 (PST)
MIME-Version: 1.0
References: <20191203093652.gyntgvnkw2udatyc@kili.mountain>
In-Reply-To: <20191203093652.gyntgvnkw2udatyc@kili.mountain>
From:   Sreekanth Reddy <sreekanth.reddy@broadcom.com>
Date:   Tue, 10 Dec 2019 15:15:00 +0530
Message-ID: <CAK=zhgrQ_9R+kWhMWG7D0iqsoTb=Q6WQKhN3ydeCxt-uK-CL-g@mail.gmail.com>
Subject: Re: [PATCH] scsi: mpt3sas: Fix double free in attach error handling
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Sathya Prakash <sathya.prakash@broadcom.com>,
        Chaitra P B <chaitra.basappa@broadcom.com>,
        Suganath Prabu Subramani 
        <suganath-prabu.subramani@broadcom.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        PDL-MPT-FUSIONLINUX <MPT-FusionLinux.pdl@broadcom.com>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Dec 3, 2019 at 3:07 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The caller also calls _base_release_memory_pools() on error so it
> leads to a number of double frees:
>
> drivers/scsi/mpt3sas/mpt3sas_base.c:7207 mpt3sas_base_attach() warn: 'ioc->chain_dma_pool' double freed
> drivers/scsi/mpt3sas/mpt3sas_base.c:7207 mpt3sas_base_attach() warn: 'ioc->hpr_lookup' double freed
> drivers/scsi/mpt3sas/mpt3sas_base.c:7207 mpt3sas_base_attach() warn: 'ioc->internal_lookup' double freed
> drivers/scsi/mpt3sas/mpt3sas_base.c:7207 mpt3sas_base_attach() warn: 'ioc->pcie_sgl_dma_pool' double freed
> drivers/scsi/mpt3sas/mpt3sas_base.c:7207 mpt3sas_base_attach() warn: 'ioc->reply_dma_pool' double freed
> drivers/scsi/mpt3sas/mpt3sas_base.c:7207 mpt3sas_base_attach() warn: 'ioc->reply_free_dma_pool' double freed
> drivers/scsi/mpt3sas/mpt3sas_base.c:7207 mpt3sas_base_attach() warn: 'ioc->reply_post_free_array_dma_pool' double freed
> drivers/scsi/mpt3sas/mpt3sas_base.c:7207 mpt3sas_base_attach() warn: 'ioc->reply_post_free_dma_pool' double freed
> drivers/scsi/mpt3sas/mpt3sas_base.c:7207 mpt3sas_base_attach() warn: 'ioc->sense_dma_pool' double freed
>
> Fixes: 74522a92bbf0 ("scsi: mpt3sas: Optimize I/O memory consumption in driver.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Sreekanth Reddy <sreekanth.reddy@broadcom.com>

> ---
>  drivers/scsi/mpt3sas/mpt3sas_base.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/scsi/mpt3sas/mpt3sas_base.c b/drivers/scsi/mpt3sas/mpt3sas_base.c
> index 848fbec7bda6..45fd8dfb7c40 100644
> --- a/drivers/scsi/mpt3sas/mpt3sas_base.c
> +++ b/drivers/scsi/mpt3sas/mpt3sas_base.c
> @@ -5248,7 +5248,6 @@ _base_allocate_memory_pools(struct MPT3SAS_ADAPTER *ioc)
>                                         &ct->chain_buffer_dma);
>                         if (!ct->chain_buffer) {
>                                 ioc_err(ioc, "chain_lookup: pci_pool_alloc failed\n");
> -                               _base_release_memory_pools(ioc);
>                                 goto out;
>                         }
>                 }
> --
> 2.11.0
>
