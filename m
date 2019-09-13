Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85EADB1B3F
	for <lists+kernel-janitors@lfdr.de>; Fri, 13 Sep 2019 11:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387967AbfIMJz5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 13 Sep 2019 05:55:57 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42115 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387439AbfIMJz5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Sep 2019 05:55:57 -0400
Received: by mail-ot1-f65.google.com with SMTP id c10so28864244otd.9
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Sep 2019 02:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UMQYVHEWLYiHDyJ6nTZFM9bO2lcGE6JPb6li8qp7+Vk=;
        b=dJzYZ3B+/+gdgBIxCnf0X6itRvlfNcX7If2XgYPo5Ssp7hdAepbogmTZly9CF/3YaU
         lJE6KuYWAxZYeSG8Ti8SOEg0Bc0mrcXVMo7eNZuiUel54x/TFKXkg6Viw9w2U/J/BYCP
         hYscKPhgytjFQTDbt1ZajAMSP+ZI4tGFtwGUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UMQYVHEWLYiHDyJ6nTZFM9bO2lcGE6JPb6li8qp7+Vk=;
        b=FQbiYyoDjsFQnkGOljI6yapuEKfW4gozr/D/eP/MDJpdcRLnxOVDaXzDfzeA0CgNgV
         rKvrh3P5gZJ8NKwEtJfg6jH/RwgPHenC1R3WNzdFDNJdkNalOPALz7PX+78LH6yJ648t
         2w14Je8VEWNHGuLFwNzrn1fQ6+rrlWemxzOTFPwnNI2hUpWQZJUjDSJinuwpSFOeAel/
         5zNod+Ufzepgbd2bRNFI8d3r2t2w7m2qEAj35kdDmsVarfyBoXvzz8lnLi7vWZWhNElA
         n2JOoV0+wg/FGdg+AAls/3lgqjFqYzhZopgOp0aOsKsKajCzhG14IablJr5boZ2CRNEA
         fVNw==
X-Gm-Message-State: APjAAAVPapmxIjsskDeIhUX4ycdHssRj7ZBCwDbOmS3dEY1wrDUncFgo
        VqVOy/yTDavZ5blDG/V8wW4mHrYzm2t1fTffxMB9nQ==
X-Google-Smtp-Source: APXvYqw+1a84R4pBtZm3Y54xxn1FobvFYUznqgrUfd5/p6M55wi73uijrk14i87/KA7+sR2LmnCkMGF2HZR7ArTo1Co=
X-Received: by 2002:a9d:37c7:: with SMTP id x65mr37287063otb.47.1568368556464;
 Fri, 13 Sep 2019 02:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190911092856.11146-1-colin.king@canonical.com> <20190912150957.GA9160@mellanox.com>
In-Reply-To: <20190912150957.GA9160@mellanox.com>
From:   Selvin Xavier <selvin.xavier@broadcom.com>
Date:   Fri, 13 Sep 2019 15:25:45 +0530
Message-ID: <CA+sbYW1MWTBa-yG+Z2Z5KwZGfwRTOdLpzL64fE35OEeGrPbgeQ@mail.gmail.com>
Subject: Re: [PATCH] RDMA/bnxt_re: fix spelling mistake "missin_resp" -> "missing_resp"
To:     Jason Gunthorpe <jgg@mellanox.com>
Cc:     Colin King <colin.king@canonical.com>,
        Devesh Sharma <devesh.sharma@broadcom.com>,
        Somnath Kotur <somnath.kotur@broadcom.com>,
        Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
        Doug Ledford <dledford@redhat.com>,
        "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 12, 2019 at 8:40 PM Jason Gunthorpe <jgg@mellanox.com> wrote:
>
> On Wed, Sep 11, 2019 at 10:28:56AM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > There is a spelling mistake in a literal string, fix it.
> >
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/infiniband/hw/bnxt_re/hw_counters.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/infiniband/hw/bnxt_re/hw_counters.c b/drivers/infiniband/hw/bnxt_re/hw_counters.c
> > index 604b71875f5f..3421a0b15983 100644
> > --- a/drivers/infiniband/hw/bnxt_re/hw_counters.c
> > +++ b/drivers/infiniband/hw/bnxt_re/hw_counters.c
> > @@ -74,7 +74,7 @@ static const char * const bnxt_re_stat_name[] = {
> >       [BNXT_RE_SEQ_ERR_NAKS_RCVD]     = "seq_err_naks_rcvd",
> >       [BNXT_RE_MAX_RETRY_EXCEEDED]    = "max_retry_exceeded",
> >       [BNXT_RE_RNR_NAKS_RCVD]         = "rnr_naks_rcvd",
> > -     [BNXT_RE_MISSING_RESP]          = "missin_resp",
> > +     [BNXT_RE_MISSING_RESP]          = "missing_resp",
>
> Broadcom folks, can you confirm if this is OK? Is the string ABI for
> this driver?
>

 bnxt_re doesn't have a string ABI.
This is a spelling mistake while posting the patch and it is okay to
merge this patch.

Thanks
Acked-by: Selvin Xavier <selvin.xavier@broadcom.com>
