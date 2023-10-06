Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 670A37BB906
	for <lists+kernel-janitors@lfdr.de>; Fri,  6 Oct 2023 15:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232259AbjJFNYv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 6 Oct 2023 09:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbjJFNYv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 Oct 2023 09:24:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5692A83
        for <kernel-janitors@vger.kernel.org>; Fri,  6 Oct 2023 06:24:50 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9177C433C7;
        Fri,  6 Oct 2023 13:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696598690;
        bh=o3GGCVpXVd8CErOLPgr8dEp7DvAX/9TjHNxkbvAx2Ms=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rfJsOhJFE7q48tKMmozjOtul3zFQQYKVGQOOnDkF8R9JxpHRQZkAsuaNWF99Y7LA7
         53zP1cbXK8YasHZ+OF/wrBQHnLwhlpbZ902UGFSj7hHxmo3rxsTtXnmOLRC2qHPhPf
         nOtEKvHMaBZuQD2LQFY2k+6lsJw4RgomuaX9Cc0NQpRCjdoh5q3GrJ71v3wRx9g7Fn
         Sh8AdT20EXHezVdFMW7uLaG7dwxRG9vaz03w34iIinTd7vpVa2lwjzq10mbzGl0cFW
         a/F7Vk1NcoZhGjXYlHNgM1VdfOKhZCpbhejOVlxbj8Gmi0al7qknFGEsKrvg0IcG+W
         18d3/DW05u1gw==
Date:   Fri, 6 Oct 2023 15:24:45 +0200
From:   Simon Horman <horms@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Greg Rose <gregory.v.rose@intel.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] ixgbe: fix crash with empty VF macvlan list
Message-ID: <ZSAKnfOY6Raoi9DV@kernel.org>
References: <3cee09b8-4c49-4a39-b889-75c0798dfe1c@moroto.mountain>
 <ZR/si/di5IbSB9Gq@kernel.org>
 <569ba96b-2bc3-45ea-b397-36e7ef88ed8f@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <569ba96b-2bc3-45ea-b397-36e7ef88ed8f@kadam.mountain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 06, 2023 at 03:49:39PM +0300, Dan Carpenter wrote:
> On Fri, Oct 06, 2023 at 01:16:27PM +0200, Simon Horman wrote:
> > On Thu, Oct 05, 2023 at 04:57:02PM +0300, Dan Carpenter wrote:
> > > The adapter->vf_mvs.l list needs to be initialized even if the list is
> > > empty.  Otherwise it will lead to crashes.
> > > 
> > > Fixes: c6bda30a06d9 ("ixgbe: Reconfigure SR-IOV Init")
> > 
> > Hi Dan,
> > 
> > I see that the patch cited above added the line you are changing.
> > But it also seems to me that patch was moving it from elsewhere.
> > 
> > Perhaps I am mistaken, but I wonder if this is a better tag.
> > 
> > Fixes: a1cbb15c1397 ("ixgbe: Add macvlan support for VF")
> > 
> 
> Yeah.  You're right.  I'll resend.

Thanks!

> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >  drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
> > > index a703ba975205..9cfdfa8a4355 100644
> > > --- a/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
> > > +++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
> > > @@ -28,6 +28,9 @@ static inline void ixgbe_alloc_vf_macvlans(struct ixgbe_adapter *adapter,
> > >  	struct vf_macvlans *mv_list;
> > >  	int num_vf_macvlans, i;
> > >  
> > > +	/* Initialize list of VF macvlans */
> > > +	INIT_LIST_HEAD(&adapter->vf_mvs.l);
> > > +
> > >  	num_vf_macvlans = hw->mac.num_rar_entries -
> > >  			  (IXGBE_MAX_PF_MACVLANS + 1 + num_vfs);
> > >  	if (!num_vf_macvlans)
> > > @@ -36,8 +39,6 @@ static inline void ixgbe_alloc_vf_macvlans(struct ixgbe_adapter *adapter,
> > >  	mv_list = kcalloc(num_vf_macvlans, sizeof(struct vf_macvlans),
> > >  			  GFP_KERNEL);
> > >  	if (mv_list) {
> > 
> > I'm not sure it it is worth it, but perhaps more conventional error
> > handling could be used here:
> > 
> > 	if (!mv_list)
> > 		return;
> > 
> > 	for (i = 0; i < num_vf_macvlans; i++) {
> > 		...
> 
> I mean error handling is always cleaner than success handling but it's
> probably not worth cleaning up in old code.  I say it's not worth
> cleaning up old code and yet I secretly reversed two if statements like
> this yesterday.  :P
> https://lore.kernel.org/all/d9da4c97-0da9-499f-9a21-1f8e3f148dc1@moroto.mountain/
> It really is nicer, yes.  But it just makes the patch too noisy.

Yeah, I'm also worried about the noise in this case.
