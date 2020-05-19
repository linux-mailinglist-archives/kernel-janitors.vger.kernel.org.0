Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 849701DA5C6
	for <lists+kernel-janitors@lfdr.de>; Wed, 20 May 2020 01:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgESXqw (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 May 2020 19:46:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgESXqv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 May 2020 19:46:51 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB7F7C061A0F
        for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2020 16:46:51 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id f83so1776361qke.13
        for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2020 16:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EZ3w/dTFCdeQDnc5fZLNBPSrCy5eNFWI04k57XtzKOU=;
        b=jXx4VJ+9t3i6gDkDjplc/D+KPwAczZFkHP6J2PT6CIutMBDMZi9gDlVw7L7jsGJPNC
         eFugtwTwXUdZ1Nvz+vRscTxBrwEn3ClePlgHpav2J3NfQ3iuLhxoYXNT3gf+ZlE90GBU
         lY+pmWHrM2tEvrCOJZyzqWwNgWG8IRHh4NL/UdhuckIHJj1v9kYZbt6JG0Z9wY2yta+b
         pWNLna4+3CAYNJJAb735TOlEhe7ayRx7DQqSNOvA8yaGphTQNhNKYRSnOEfp0sQn+/7U
         oZdORieWAJ95ELNa8mP52Pp5wnsaGECGpmtCBy+mfz2Q0Gj+klrIIJu4HEDmJye41m82
         WbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EZ3w/dTFCdeQDnc5fZLNBPSrCy5eNFWI04k57XtzKOU=;
        b=sFxM7j5ISLMAAVKFAoYCI+8AHdBsC05gcWCXmNSt9Yql0yKO8CaEk5o+WaO/OwtFnY
         pCUpdvqXXZQuklW/Tg8VQ13JT3bb/gTuigaS5KVav9Gz1HudBdNNYFu5iXWZnFclgifs
         zNsoQrMCN/6Ki30XHVrnSXVis2ZI467S6WjsZMQVzpMq/geLhK9C92iFLYhW2SMKqQM0
         kNMtVDy9q1tEBpeVmbl6X2HGCCWWYYZmJsOXMfCqdW2Y49uv4vY1EogCbRf85fRGogdx
         Rmqzgu5QPwd9nbuDfFYbWoQTt8KRDYM7yMQTiC/EBy/aJgIcx2eZ+T1gmkYf2DFPuc1G
         PVxw==
X-Gm-Message-State: AOAM531jUGEQDOkN9geitfoK6mJU4VXsqzCPB02C3MHFt1LGhpiUGQdD
        Lbno6N7ixqFsRDQdojT8sVDeJA==
X-Google-Smtp-Source: ABdhPJw4RRZlSUYpdIrXm0xYqrUMah4E94MBUSKzQ9DMxhy7RFs/HWzOylhu7E0nkTztuoec09r7qg==
X-Received: by 2002:a37:84a:: with SMTP id 71mr1989448qki.56.1589932011041;
        Tue, 19 May 2020 16:46:51 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id k13sm1017287qtm.80.2020.05.19.16.46.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 16:46:50 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jbBwg-00080m-60; Tue, 19 May 2020 20:46:50 -0300
Date:   Tue, 19 May 2020 20:46:50 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Danil Kipnis <danil.kipnis@cloud.ionos.com>,
        Jack Wang <jinpu.wang@cloud.ionos.com>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] RDMA/rtrs: Fix a couple off by one bugs in
 rtrs_srv_rdma_done()
Message-ID: <20200519234650.GD30609@ziepe.ca>
References: <CAHg0Huz39q9nWwTrtCY=SgU=T9oZJQdchx6c1LOPbSQiywzrqw@mail.gmail.com>
 <20200519154525.GA66801@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519154525.GA66801@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 19, 2020 at 06:45:25PM +0300, Dan Carpenter wrote:
> These > comparisons should be >= to prevent accessing one element
> beyond the end of the buffer.
> 
> Fixes: 9cb837480424 ("RDMA/rtrs: server: main functionality")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Danil Kipnis <danil.kipnis@cloud.ionos.com>
> ---
>  drivers/infiniband/ulp/rtrs/rtrs-srv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to for-next, thanks

Jason
