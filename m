Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15AF12C9809
	for <lists+kernel-janitors@lfdr.de>; Tue,  1 Dec 2020 08:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbgLAHVL (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 1 Dec 2020 02:21:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727450AbgLAHVL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Dec 2020 02:21:11 -0500
Received: from nautica.notk.org (ipv6.notk.org [IPv6:2001:41d0:1:7a93::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF4DC0613CF
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Nov 2020 23:20:30 -0800 (PST)
Received: by nautica.notk.org (Postfix, from userid 1001)
        id 803B8C009; Tue,  1 Dec 2020 08:20:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
        t=1606807228; bh=FuLm2jplxEXRKB45ql4yo1SieICwPuk97RPNiI3tRag=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IlSsMXh2kRnLYYxoYcp80kavZEh2mUbY+ANDNCaJYak42pT3YL59wiOv2Rpfki17D
         VX8/ZuaWnua8k2WyD0Gn6o0HHa3Ui/dkh1TCRDsgyuuER35iRbo+jnMC847RixliC7
         OD8ahriDUHbOlZ9J1I86pC9uv8nM7xDeCKvjadhOEvgRoTv+QQo75sDIKxWkppisND
         v7kraprutKOqPQtXy4OVJBwFuiamCKBr0xYz8bXF+KKHsRcfAihM5Mmpxh1zz6Wrq2
         iTOGX9qKCsV4+1xrp3FhjTI4+w24HvtWc9UQBgJ/Onhyq0xdeKApRhYFSsk/a9w1JZ
         z70TGBJpD17qQ==
Date:   Tue, 1 Dec 2020 08:20:13 +0100
From:   Dominique Martinet <asmadeus@codewreck.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Eric Van Hensbergen <ericvh@gmail.com>,
        Jianyong Wu <jianyong.wu@arm.com>,
        Latchesar Ionkov <lucho@ionkov.net>,
        v9fs-developer@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] 9p: Uninitialized variable in v9fs_writeback_fid()
Message-ID: <20201201072013.GA3587@nautica>
References: <X8Xq7JvqR/LKzjB2@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <X8Xq7JvqR/LKzjB2@mwanda>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter wrote on Mon, Nov 30, 2020:
> If v9fs_fid_lookup_with_uid() fails then "fid" is not initialized.
> 
> The v9fs_fid_lookup_with_uid() can't return NULL.  If it returns an
> error pointer then we can still pass that to clone_fid() and it will
> return the error pointer back again.
> 
> Fixes: 6636b6dcc3db ("9p: add refcount to p9_fid struct")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, taken both.

-- 
Dominique
