Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD83534294
	for <lists+kernel-janitors@lfdr.de>; Wed, 25 May 2022 19:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237324AbiEYR4B (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 25 May 2022 13:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236773AbiEYR4A (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 May 2022 13:56:00 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7201ADE9B
        for <kernel-janitors@vger.kernel.org>; Wed, 25 May 2022 10:55:59 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id h9so13069184qtx.2
        for <kernel-janitors@vger.kernel.org>; Wed, 25 May 2022 10:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MOVhGv8nvnJAMgaPQNE7u1253LKLy/xiNdpEsmTDTbE=;
        b=WJCkihoeiXVWiX/SOtblOOlzlu3o2aHAt1gN1TX6lFhU8avW+lxELbdDcwL1aKNICn
         I+sG6kM3hlZkIK/zhfi6fmyoAA1eLW6pnPKaVuK2//ToSFxelpB0Jbah+xMdBTz5PtGs
         +DZmD9eWzcnj2s0NE9AP8o9BY2ChUHncv+JnL6Vp3zvFl0o5aAXMJuBHPfoFsUrO3Amj
         SlFL5+ZxdrWQuWVIICw4I+TnV2u1cJyhDqwN7lqoz3ovho1ITmjF0SvG9EjL4AqSSrqj
         TPnpfFhUcH927BpTvBYK7uuBhT3q/dvWW+Bw1xUSKaZuEnJZ2DCG1eLBhaaNln0iQnCV
         Smww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MOVhGv8nvnJAMgaPQNE7u1253LKLy/xiNdpEsmTDTbE=;
        b=x27TLc4/ljNpvvJttTScn58M6i0n/tIgYLZwThr73hxeW+EvaBDmECJJZ+u4Cujvkn
         M0s9O4NTGDJRHeio+jdaa4guoIm1pDCjrypGCe900t9yIBCvr5hwPZdVW99FKU4RDkAN
         tA1r0vUTEoNYtQcIewVeNtyBRDNE+FtGOJqX/Ays+bEAXQquMEBlzToQ8ojiRv9qpdkE
         URTkBoOFW5k+ONJEw4dFjwHChzoNsO+x9IANoZhO1rrJGrEXWS5lUFfOe05tQESFYdbe
         bQ8i9YHT2vLHBc7jRmT5oK1OrpeM3QToK+78Uw1UNZ9M7Wei7z2S92zFA8h1ODGJXFUb
         Ep4g==
X-Gm-Message-State: AOAM530Ji2duUN3b/dSiZPn5XiTrpiU02GbSvqYj+9Wpkt+U2EJaWfwe
        WWMnrpZAfQaS/dV1GuUrrog7wQ==
X-Google-Smtp-Source: ABdhPJzdp2VNn9pnKNHbOndGMfw8RXNIILILr87XVT4fV8PNUxZ0CjncskKdcvVSzb75m4dSk6LUgw==
X-Received: by 2002:a05:622a:1181:b0:2f9:3050:ec82 with SMTP id m1-20020a05622a118100b002f93050ec82mr15696118qtk.202.1653501358620;
        Wed, 25 May 2022 10:55:58 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id l19-20020a05622a051300b002f933204688sm2018521qtx.4.2022.05.25.10.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 10:55:18 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1ntvDV-00BuDB-GC; Wed, 25 May 2022 14:54:41 -0300
Date:   Wed, 25 May 2022 14:54:41 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     "Saleem, Shiraz" <shiraz.saleem@intel.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        "Ismail, Mustafa" <mustafa.ismail@intel.com>,
        Leon Romanovsky <leon@kernel.org>,
        "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] RDMA/irdma: Initialize struct members in
 irdma_reg_user_mr()
Message-ID: <20220525175441.GD2661880@ziepe.ca>
References: <Yoz4iXtRJ8jw6IeD@kili>
 <20220524153600.GB2661880@ziepe.ca>
 <MWHPR11MB0029F37D40D9D4A993F8F549E9D79@MWHPR11MB0029.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MWHPR11MB0029F37D40D9D4A993F8F549E9D79@MWHPR11MB0029.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 24, 2022 at 04:53:46PM +0000, Saleem, Shiraz wrote:
> > Subject: Re: [PATCH] RDMA/irdma: Initialize struct members in
> > irdma_reg_user_mr()
> > 
> > On Tue, May 24, 2022 at 06:23:53PM +0300, Dan Carpenter wrote:
> > > The ib_copy_from_udata() function does not always initialize the whole
> > > struct.  It depends on the value of udata->inlen.  So initialize it to
> > > zero at the start.
> > >
> > > Fixes: b48c24c2d710 ("RDMA/irdma: Implement device supported verb
> > > APIs")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com> What I know is
> > > that RDMA takes fast paths very seriously.
> > >
> > > This is probably a fast path so you may want to implement a different
> > > solution.  If you want to do something else then, just feel free to do
> > > that and give me a Reported-by tag.
> > 
> > This isn't fast path..
> > 
> > But the bug here is not validating inlen properly and should be fixed there, not by
> > zero-initing and allowing userspace to pass in an invalid inlen..
> > 
> Hi Jason -
> 
> So something like this is appropriate?

Yes

Jason
