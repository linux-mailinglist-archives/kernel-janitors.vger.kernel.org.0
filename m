Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4696E1EA568
	for <lists+kernel-janitors@lfdr.de>; Mon,  1 Jun 2020 15:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgFAN4r (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 1 Jun 2020 09:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgFAN4r (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 1 Jun 2020 09:56:47 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6EB1C03E96B
        for <kernel-janitors@vger.kernel.org>; Mon,  1 Jun 2020 06:56:46 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id f18so9105614qkh.1
        for <kernel-janitors@vger.kernel.org>; Mon, 01 Jun 2020 06:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ntTQh6WltJCEpegt7h2c57+gIBfSY5EOmHIEsgHmRIU=;
        b=CNZwg+F26lNY1SXnZVmmSMZ1s3wURI5mydV600unahy2nf+Sq43rl1GEyJ2sG1aE5Y
         uPKF4mQ7lvFBncydxzKWwkxXxDQ1nc5wt46auLeL+KYtST6DJ7gK9nUm4DS6oWOEOwZG
         lnWKlgexrnInnplLafYvwuyHLAJ3V00DSDkU1AtgvEf0u9f8eGJELuBolKTi61jtYRjZ
         GQX+GDBr2EuChpxPCQU3xcoXmDfq3Gj3qp8naHWHOgVbeeNJfF1n8iW0sxVlHkFFDdie
         5lhWeWOCWwIA+getqlMHXxUDE9+vLGxNcrco9FlkaeiopKti4FP5+rQVztySlLJ2slOF
         PPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ntTQh6WltJCEpegt7h2c57+gIBfSY5EOmHIEsgHmRIU=;
        b=aCPGZc8TUWBQjYWDk81xetTV/VjQYaxmf7QgmrRLSWX+rpD+jHUzC8F6UWPJziEt09
         Uh68ULeJPKCEUgBPHrMYyNogOCJSif4IGok/JEws4KnheNFM5YQdy5nAK11UfYwf4tkX
         sB06XQ4pfzs0cMSuT7mp7EIj6TBKkcml98kt84cnMmIs1Y6g60bGeqf2erGdmYWly7w2
         UZHss1HAsNz3n2KJBS60QTCvdgU9oSj7R/Dt5OtzvTxD90k/8ilKvxuTA8Ts+dJtGsSu
         cvA27Cqf+yjGprDmG1oD+L6/FGrZFC8oo4qAI9w515I0jQvhaYOqUfYbmXy7PmsLf36O
         9+ag==
X-Gm-Message-State: AOAM531fSO7/Ss7Fy0gOVmNlHKlHSh4gFGzoorNIQsazmXpKwwFEGZFB
        3Udi8PAbCZP6lvxZ+XQbI8ps9w==
X-Google-Smtp-Source: ABdhPJxDT/YlICzGv8LgIeCF6lFgoL6j+xKq2z+DcM5OIioTXwPBgw7wCBUAW/nOX+6QKfh1IlKWxA==
X-Received: by 2002:a37:b547:: with SMTP id e68mr2119990qkf.127.1591019806061;
        Mon, 01 Jun 2020 06:56:46 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id j22sm14545311qke.117.2020.06.01.06.56.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 06:56:45 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jfkvl-0004UF-0T; Mon, 01 Jun 2020 10:56:45 -0300
Date:   Mon, 1 Jun 2020 10:56:45 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dennis Dalessandro <dennis.dalessandro@intel.com>
Cc:     "Marciniszyn, Mike" <mike.marciniszyn@intel.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Doug Ledford <dledford@redhat.com>,
        "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "Dan Carpenter (dan.carpenter@oracle.com)" <dan.carpenter@oracle.com>
Subject: Re: [PATCH -next] IB/hfi1: Remove set but not used variable 'priv'
Message-ID: <20200601135644.GD4872@ziepe.ca>
References: <20200528075946.123480-1-yuehaibing@huawei.com>
 <MN2PR11MB396654BC46500F828609C6A3868E0@MN2PR11MB3966.namprd11.prod.outlook.com>
 <86634519-3dd8-0c6a-a8d2-19f4b986fd3d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86634519-3dd8-0c6a-a8d2-19f4b986fd3d@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jun 01, 2020 at 09:45:52AM -0400, Dennis Dalessandro wrote:
> On 5/28/2020 7:25 AM, Marciniszyn, Mike wrote:
> > > From: YueHaibing <yuehaibing@huawei.com>
> > > Sent: Thursday, May 28, 2020 4:00 AM
> > > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > >   drivers/infiniband/hw/hfi1/netdev_rx.c | 11 +++--------
> > >   1 file changed, 3 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/infiniband/hw/hfi1/netdev_rx.c
> > > b/drivers/infiniband/hw/hfi1/netdev_rx.c
> > > index 58af6a454761..bd6546b52159 100644
> > > +++ b/drivers/infiniband/hw/hfi1/netdev_rx.c
> > > @@ -371,14 +371,9 @@ int hfi1_netdev_alloc(struct hfi1_devdata *dd)
> > > 
> > >   void hfi1_netdev_free(struct hfi1_devdata *dd)
> > >   {
> > > -struct hfi1_netdev_priv *priv;
> > > -
> > > -if (dd->dummy_netdev) {
> > > -priv = hfi1_netdev_priv(dd->dummy_netdev);
> > > -dd_dev_info(dd, "hfi1 netdev freed\n");
> > > -kfree(dd->dummy_netdev);
> > > -dd->dummy_netdev = NULL;
> > > -}
> > > +dd_dev_info(dd, "hfi1 netdev freed\n");
> > > +kfree(dd->dummy_netdev);
> > 
> > Dan Carpenter has reported kfree() should be free_netdev()...
> > 
> > Mike
> > 
> 
> I'm OK with this patch going in and then adding a separate one to fix the
> kfree. Or this one can be touched up to include that as well.

Please resend it with both things fixed

Jason
