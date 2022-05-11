Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7BA523BB5
	for <lists+kernel-janitors@lfdr.de>; Wed, 11 May 2022 19:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234039AbiEKRiF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 11 May 2022 13:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236299AbiEKRiC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 May 2022 13:38:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA6D1692AC
        for <kernel-janitors@vger.kernel.org>; Wed, 11 May 2022 10:38:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 767E3B82153
        for <kernel-janitors@vger.kernel.org>; Wed, 11 May 2022 17:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBBAC340EE;
        Wed, 11 May 2022 17:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652290679;
        bh=aCdJZ9j/PdDH2n+Soo73CJM408N6OH2MVsuqlRgTyUY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CcCUfm40CzRZ1Y6C96F/ZLkrgWClKU80ytqM1L6OU/pKGGDj5qyDlaRd06MG1OQA1
         DnwUFFuzFcmuCOT/Ot3+GJ6cqqrHLIt/bWZVRkK4EyJDr8xlt9S2ReMHPRZk51EJ+e
         3KLD9r1fQHa3k3XR9VQZehsHwT8LHOIFHNQCrT/sMfLmdr4mVvGv8aeiqIYeVykz6+
         WEC0CvZd3Xd0br0at88Vf7aLP3dppquz5X9U7T+vsqUsXg04r6vT3Utm8fXuMZQP4F
         KvNN6vSYjo7BE/pTN4MwqVsmCXLxH2hV/BtBOzsg4WCf1AAP+muEcRoiK9zTWgLkkW
         fd2Cpf93nk+VQ==
Date:   Wed, 11 May 2022 10:37:57 -0700
From:   Jaegeuk Kim <jaegeuk@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Daeho Jeong <daehojeong@google.com>, Chao Yu <chao@kernel.org>,
        linux-f2fs-devel@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] f2fs: fix error code in f2fs_ioc_start_atomic_write()
Message-ID: <Ynv0ddBz91EoyWwl@google.com>
References: <Ynu4CGiqiU4l2vdf@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ynu4CGiqiU4l2vdf@kili>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

Thank you for the fix. If you don't mind, can I integrate this fix into
the original patch which is in -next?

Thanks,

On 05/11, Dan Carpenter wrote:
> Return an error code if f2fs_iget() fails.  Currently it returns
> success.
> 
> Fixes: 3d7ad9c30607 ("f2fs: change the current atomic write way")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/f2fs/file.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 79d1a20fbda9..cd768fadfd67 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2047,6 +2047,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>  	pinode = f2fs_iget(inode->i_sb, fi->i_pino);
>  	if (IS_ERR(pinode)) {
>  		f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +		ret = PTR_ERR(pinode);
>  		goto out;
>  	}
>  
> -- 
> 2.35.1
