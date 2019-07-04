Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAF5F5FC41
	for <lists+kernel-janitors@lfdr.de>; Thu,  4 Jul 2019 19:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbfGDRHy (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 4 Jul 2019 13:07:54 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:35003 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727095AbfGDRHy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 Jul 2019 13:07:54 -0400
Received: by mail-qt1-f194.google.com with SMTP id d23so8663386qto.2
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Jul 2019 10:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XqfKYWKGSYLgbJr6fPQ+lFHdBqt7mzzp7w7+/NgGtDk=;
        b=X6NiXeAMF1OwtlTW4QqugOJ53ZeaHYD/sLo9k8HcbCwSQByg/XZqvCY4YZ+NYEl7+p
         iNzSMGDWZ5tSIXvWCBaZgIICKztGnisde/lW/EA7/5qeHQu+15yWvVUsJRLIZmnz8wha
         FFQqyPZ2lh/7vbQ1YNZqInN11zwc/aPBlJbKnEheIYIs5DRlEPuNf2j32b7lU2Cr/rcQ
         96vKhTR4yz256EpG20zwOf0ABEaIZ5Hm7+BC+Ly7ve2P51vGNgxR6r8d9luBnVSDGfnC
         hecuC40wXSVrpqNgLK4oewKcZuEQsgqJRuOyJclwZzjzgTs41CxzCm22YgsyxzVDu9Bi
         dJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XqfKYWKGSYLgbJr6fPQ+lFHdBqt7mzzp7w7+/NgGtDk=;
        b=VgBqQKjnvdKWTYGd95x9hrMSZ3ii0sb6/bRJhwhhyx0VokeEI7dASkkwDDV4Ks2o0H
         fxKeUikkQpmDcWoW5jA5RZYx8ZysIOpyXUSgGR0ei+sgww4ruonJ0vQzxddg4td3SrbV
         tWegsdH2E2ADdyr8ya1iGpsBzzFmsyJTr05y//EU7A9BdW9xu9tmFmXsKFCwkp3LgKEL
         Nsjm9qK/bcBoue/dA1/F5S8W+VoYJimroToEzZYkXXUjE1MNnAJ2mXU847NC1Rw+PcRs
         U4gohiiAnEZpACLXd1Y/YF2rBY+OQcHrUQcElQ/Ps96X1q51f4bSKYaJ2RgipcgnmZaI
         XITg==
X-Gm-Message-State: APjAAAWBsrXEwCYy0CLbSDEV6oj1ti4pXZVRMoS/SkB4GnLjqcu8h9Dx
        405S4pd/tJPPQ9VofKCF7Fh5Wg==
X-Google-Smtp-Source: APXvYqxtr+v0L2/2WEquOomQKVdBZ8+LLKmCnbiOU43dpww5W7vo+SURvHo2eSQslH/YdnPX0elgpQ==
X-Received: by 2002:aed:36c5:: with SMTP id f63mr36872490qtb.239.1562260073519;
        Thu, 04 Jul 2019 10:07:53 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id b67sm2660401qkd.82.2019.07.04.10.07.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2019 10:07:53 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1hj5D6-000348-Ib; Thu, 04 Jul 2019 14:07:52 -0300
Date:   Thu, 4 Jul 2019 14:07:52 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Colin King <colin.king@canonical.com>
Cc:     Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RDMA/uverbs: remove redundant assignment to variable ret
Message-ID: <20190704170752.GA11760@ziepe.ca>
References: <20190704125027.4514-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190704125027.4514-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jul 04, 2019 at 01:50:27PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never
> read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/core/uverbs_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next, thanks

Jason
