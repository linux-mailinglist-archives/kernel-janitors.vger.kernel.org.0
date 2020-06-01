Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 415C01EA3D2
	for <lists+kernel-janitors@lfdr.de>; Mon,  1 Jun 2020 14:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgFAM10 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 1 Jun 2020 08:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgFAM1Z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 1 Jun 2020 08:27:25 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B1BC03E97C
        for <kernel-janitors@vger.kernel.org>; Mon,  1 Jun 2020 05:27:25 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id f18so8815285qkh.1
        for <kernel-janitors@vger.kernel.org>; Mon, 01 Jun 2020 05:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PKVdNwhkp7XsfYsgOqc49jOrL5d1+RDMlh1791f6yRY=;
        b=iy+gJs/uZZBIe8fICOF2ugnxZ9qIHKiwm+R3k074+kDaSKC0+LW0fIkO/+T/Xo2dZ3
         PHM4G+5w8oLLS7J2RqsTv1r0F8SrWs6Tqwr1RqHUBQqYKhWQ4m3FoAQKSLtyYiwJ/9wr
         vpudvsBzBzttfJTkIraknWe43pZ+MOXX341ObdBAye1cXqgGWPdeNO6Rc7Khax0Zbitt
         QZOrPIAGor/9NcQS9Xt651wqc78mGY4jIdSp57scD/SXtTemBNrhWHDwVBzRGsTo5Wyr
         SEQQrUncdzk+MAQt496LZThit+ilNEHBWcfoBc6aifEL6D0KYY2SvUrB+WwDkboszH/i
         n6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PKVdNwhkp7XsfYsgOqc49jOrL5d1+RDMlh1791f6yRY=;
        b=Dx3lDG0QPe7VGfzjYqLHmr0JfKVNvaEjEH9rolyAjU83JLbHQL5MjWu0A8QBPlbriH
         m7othyzcvkqv47Al2F1+K3zJsZxiqNFNJAprdIoKcaURcu1U+m4oymwPBR4LqyFp8w0b
         KDQ46bZoF0n5uYT7VGCY4chJxCBqyNNQrV5TQSwr0Uq37D7Kq6P4+inLLvOC4tjNIV5u
         XPIrkuKMyVTTo9v5xfydlkjHbwSWF+L6EJjkNCHUSnEpY5VKHhpin9rCTqFo8pYRc3yJ
         +9oand46EWWs7HoMYWoyfJEvY7O4HTXLypFf/vBo3ypuime1p2NY7DHnzynTSjj2aBeB
         770Q==
X-Gm-Message-State: AOAM532o2CasbRpnAymV0CzC1AVDxszYfzgTcVRnWaVoG52+wlCykyP2
        0mNCVTCaj0EXbe1SNjVHbV7/lA==
X-Google-Smtp-Source: ABdhPJzBcvuaFvFWy86YzAUof85bQx0g1z7uniGfW2txq+d6j+CNtyXWTb+BcNpPQlLegs6BdE/2XA==
X-Received: by 2002:a37:9c91:: with SMTP id f139mr20445965qke.371.1591014444227;
        Mon, 01 Jun 2020 05:27:24 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id n13sm16852613qtb.20.2020.06.01.05.27.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 05:27:23 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jfjXH-0002V7-EH; Mon, 01 Jun 2020 09:27:23 -0300
Date:   Mon, 1 Jun 2020 09:27:23 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Leon Romanovsky <leon@kernel.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mike Marciniszyn <mike.marciniszyn@intel.com>,
        Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>,
        Dennis Dalessandro <dennis.dalessandro@intel.com>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] IB/hfi1: Fix hfi1_netdev_rx_init() error handling
Message-ID: <20200601122723.GB4872@ziepe.ca>
References: <BY5PR11MB3958CF61BB1F59A6F6B5234D868F0@BY5PR11MB3958.namprd11.prod.outlook.com>
 <20200530140224.GA1330098@mwanda>
 <20200531100512.GH66309@unreal>
 <20200531173655.GT22511@kadam>
 <20200601042433.GA34024@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200601042433.GA34024@unreal>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jun 01, 2020 at 07:24:33AM +0300, Leon Romanovsky wrote:
> On Sun, May 31, 2020 at 08:36:55PM +0300, Dan Carpenter wrote:
> > On Sun, May 31, 2020 at 01:05:12PM +0300, Leon Romanovsky wrote:
> > > On Sat, May 30, 2020 at 05:02:24PM +0300, Dan Carpenter wrote:
> > > > The hfi1_vnic_up() function doesn't check whether hfi1_netdev_rx_init()
> > > > returns errors.  In hfi1_vnic_init() we need to change the code to
> > > > preserve the error code instead of returning success.
> > > >
> > > > Fixes: 2280740f01ae ("IB/hfi1: Virtual Network Interface Controller (VNIC) HW support")
> > > > Fixes: 4730f4a6c6b2 ("IB/hfi1: Activate the dummy netdev")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > v2: Add error handling in hfi1_vnic_up() and add second fixes tag
> > > >
> > > >  drivers/infiniband/hw/hfi1/vnic_main.c | 11 +++++++++--
> > > >  1 file changed, 9 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/infiniband/hw/hfi1/vnic_main.c b/drivers/infiniband/hw/hfi1/vnic_main.c
> > > > index b183c56b7b6a4..03f8be8e9488e 100644
> > > > +++ b/drivers/infiniband/hw/hfi1/vnic_main.c
> > > > @@ -457,13 +457,19 @@ static int hfi1_vnic_up(struct hfi1_vnic_vport_info *vinfo)
> > > >  	if (rc < 0)
> > > >  		return rc;
> > > >
> > > > -	hfi1_netdev_rx_init(dd);
> > > > +	rc = hfi1_netdev_rx_init(dd);
> > > > +	if (rc < 0)
> > > > +		goto err_remove;
> > >
> > > Why did you check for the negative value here and didn't check below?
> > >
> >
> > I just copied the pattern in the nearest code.  I didn't realize until
> > now that it was different in both functions...  The checking isn't done
> > consistently in this file.
> >
> > I can resend on Tuesday though if you want.
> 
> I imagine that Jason will fix it once he will apply the patch.

If someone from hfi says which is the right one, sure..

Jason
