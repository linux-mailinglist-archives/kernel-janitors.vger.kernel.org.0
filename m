Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0F2A1CF7D9
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 May 2020 16:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729519AbgELOvN (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 12 May 2020 10:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbgELOvN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 May 2020 10:51:13 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 333A0C061A0C
        for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2020 07:51:13 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id 4so11254126qtb.4
        for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2020 07:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PWULC0b3p9xilVpcGJBq6z0w2G3wjMLjl9SymPNgfjY=;
        b=hcyJ8oZnpgeT//+uQ0FrTWWvPkUdYIIm/b5PcUbmE6ojoy81o0Z327mL0LnurC2q4H
         JbSdzeYwrTOz0r9fyk/p/Vk0hCN+4NFR8zhkAhT0FGLEqfBNRWDYrsKEDa5pj/ys3xF5
         eA639woEdssfY7/5l26n3n3vgjofZA3yTxeVqrFMmP/A+9k7tt2WXq3iRJVlraH4GJUt
         Jsk0avrQPQ2h3k0jtLHVcSCmhaP4byng5VOxwVjEAeaMHX3fBPSCA538+tERRBwcGYlv
         Zd5n2gQ9SoK00wCJzp5mBXcm/9Hi7XV+yJoWp0PZHtWciWmg9Cz11a7JabXTrbG9mhwZ
         VyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PWULC0b3p9xilVpcGJBq6z0w2G3wjMLjl9SymPNgfjY=;
        b=bKtFuV6YfIkbg/Kb3kQQzvmjWwmOBF83Pt0YjmH8SeOGzJ7XIoqpjvXJj6rhseo+10
         HrH93oc5uv16D/CxJNTPKhKAyhycVRyJdx/89FmE2VtnfYmJWOU3Bupp6oBNlghAUoGT
         KKaKDggWDnUcdDxeh8C+NAKV1Z59jarHBw6cjl8hDvH8WP5QMyiYp6rwNPneTYOEg9GX
         2cQmcu0U0olZmTxdemt7xaBUJ5stKdqnaqKWhokBTZuUjypqLU/qcSt7gBvKdPlAJB6s
         iHS0CmG8j6r3od3LIHngssCdRwKWl9UjWCiuu2apcER5vcWeB3VVvoBd0d4ZIFlULa+p
         SXxA==
X-Gm-Message-State: AGi0PubQYhvzevUpA+iRESuyBStgmEvX+ASSqcOyQrVJ8is46ZqFzYaW
        f3Jtw9c+VbtXA10Fv66HWlLnzg==
X-Google-Smtp-Source: APiQypLT15z9fhw3qHvotvfSlOKmyD1J3vdel/Zc618LpjCwSAmQWEslDfy7gPw4Vg+4+X0Ec3iLDg==
X-Received: by 2002:ac8:2a76:: with SMTP id l51mr21526437qtl.81.1589295072347;
        Tue, 12 May 2020 07:51:12 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id g5sm10182455qkl.114.2020.05.12.07.51.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 07:51:11 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jYWFT-0002qb-0q; Tue, 12 May 2020 11:51:11 -0300
Date:   Tue, 12 May 2020 11:51:11 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Zhu Yanjun <yanjunz@mellanox.com>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] RDMA/rxe: Return -EFAULT if copy_from_user() fails
Message-ID: <20200512145110.GA10905@ziepe.ca>
References: <20200511183742.GB225608@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511183742.GB225608@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 11, 2020 at 09:37:42PM +0300, Dan Carpenter wrote:
> This function used to always return -EINVAL but we updated it to try
> preserve the error codes.  Unfortunately the copy_to_user() is returning
> the number of bytes remaining to be copied instead of a negative error
> code.
> 
> Fixes: a3a974b4654d ("RDMA/rxe: Always return ERR_PTR from rxe_create_mmap_info()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/infiniband/sw/rxe/rxe_queue.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

I squashed this into to the above patch since it is marked for -stable

This means for-rc gets rebased

Thanks,
Jason
