Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01F05525244
	for <lists+kernel-janitors@lfdr.de>; Thu, 12 May 2022 18:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350745AbiELQPm (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 12 May 2022 12:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233278AbiELQPl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 May 2022 12:15:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFDDF335
        for <kernel-janitors@vger.kernel.org>; Thu, 12 May 2022 09:15:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A051DB8290E
        for <kernel-janitors@vger.kernel.org>; Thu, 12 May 2022 16:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E35C385B8;
        Thu, 12 May 2022 16:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652372137;
        bh=i70+uprLNQWZny9cy3ILuJ6vbMHaIKlCK36vJUzGZs4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sqN4NGF72oJUnGSThojIkUaS2ddM9sV7wTkF+bJHaMEOg0xmNG6gFJZBZYH7GREpm
         RwD4lCYTSwL1YmkAGEYrpjtGc7PG3SVskxeLrtDlar8YHDi0RAM1uf21ZIhQ3izELQ
         p0bh8qweZQtprn9NkA/M1U+6vl+L14tpFtBings7t54MNiGBFkqhhEL7Nst2CDgn/8
         2In0MBn5uSRWZC/HcTGU4dgeKCyNBv3WpdVM0LX87hO56A+LjS5GvApWjzMir2HW5S
         ZvoZHocC36qfbBkbZ7/9AqD+74uf6BJSwxSR9ThWyv2XLBlGl/FrU+UwZzJRrjiAWH
         2i5Ked+Ihrwtw==
Date:   Thu, 12 May 2022 09:15:35 -0700
From:   Jaegeuk Kim <jaegeuk@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Daeho Jeong <daehojeong@google.com>, Chao Yu <chao@kernel.org>,
        linux-f2fs-devel@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] f2fs: fix error code in f2fs_ioc_start_atomic_write()
Message-ID: <Yn0ypxFbz2H0u+Ay@google.com>
References: <Ynu4CGiqiU4l2vdf@kili>
 <Ynv0ddBz91EoyWwl@google.com>
 <20220512092043.GD29930@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512092043.GD29930@kadam>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 05/12, Dan Carpenter wrote:
> On Wed, May 11, 2022 at 10:37:57AM -0700, Jaegeuk Kim wrote:
> > Hi Dan,
> > 
> > Thank you for the fix. If you don't mind, can I integrate this fix into
> > the original patch which is in -next?
> > 
> 
> Yeah, that's not a problem.  Feel free.

Thank you~

> 
> regards,
> dan carpenter
> 
> > Thanks,
> > 
> > On 05/11, Dan Carpenter wrote:
> > > Return an error code if f2fs_iget() fails.  Currently it returns
> > > success.
> > > 
> > > Fixes: 3d7ad9c30607 ("f2fs: change the current atomic write way")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > >  fs/f2fs/file.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > index 79d1a20fbda9..cd768fadfd67 100644
> > > --- a/fs/f2fs/file.c
> > > +++ b/fs/f2fs/file.c
> > > @@ -2047,6 +2047,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
> > >  	pinode = f2fs_iget(inode->i_sb, fi->i_pino);
> > >  	if (IS_ERR(pinode)) {
> > >  		f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> > > +		ret = PTR_ERR(pinode);
> > >  		goto out;
> > >  	}
> > >  
> > > -- 
> > > 2.35.1
