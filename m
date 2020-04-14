Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD971A89AB
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Apr 2020 20:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504047AbgDNSeq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Apr 2020 14:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2503997AbgDNSeo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Apr 2020 14:34:44 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3CD4C061A0E
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Apr 2020 11:34:43 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id m67so14385514qke.12
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Apr 2020 11:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UckdiV4g5smZ/YcYI1aDJQcvx18cWKoMgwV0GVKDwJ0=;
        b=Qal0UHDj/Eh4X2gPNfet+Ka0Gd7Qxqv6WpAnof0EP/tM7en7YjAoUu3rwectliHx7Y
         r/11+bJ0rk7/AA1OcEDXD0YMNQT+id7VTgB/BnjObZPMdLPfh4SqFd14nx6Ngqon4GJl
         N1uiOu7wVABx2p4DOPdrqi0i1GwK4np0KxVY7jJOV+80BPCzYqXPRoE+YkXM6cOT22X7
         suqYhKQbOmCb8IPB+SA6OC1Rv4kfGqukqe03wLBKfPm1FczWzmZc4h7MVrHJnzCzzMqP
         LeC8pauqSDJJ7L8P0aVYRe+qybQjGc4hrCDzc7wRoOozJrVPBZS3LgeicsSvK3GxD6en
         DfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UckdiV4g5smZ/YcYI1aDJQcvx18cWKoMgwV0GVKDwJ0=;
        b=P075gaC9sUmc8Jx+fSPHe7ox4XNXn4V6J0go6+gKlaKhlA8MlpH3Pb6E/bBaDDzke9
         8dmk4GlC5LtbpGnhbxKUbDeoLg5DGjMQfcACWLoiSNTgAIs/hLG3QRw1j665sbKjkvGf
         qY8aU5BaYM+3aMKpg/dIbIF2Z0Syar6RkMR8HHhegJwlwp0ZLJXSpRsWBQrm1TvRZRFR
         QAG7WDlbo/Jy1P9yV1WgUk7090RUuo388WAbFFSQrgkkNMytl4NpdnM6sFcEGW0gDuHl
         CmebPd0KwpjkMUsfbkpINL3U2D91LiHQCj0AUmmDcIx8exbBWHlIugfauXcAPGUXce18
         fMMQ==
X-Gm-Message-State: AGi0PuaIMYE75ut9nJdazx6Zqa/VrWpRoIwxEa6hXDtKg+U7TI9LDLc+
        ikVIX2AlAtQquInjawnyTW0uyg==
X-Google-Smtp-Source: APiQypLAHvd4BQDsWDVAsKlHDEm2qIIWVfGyjyhDo2xP6GrGkkqj/rTWWaUyHuGIzua7pF+OJeIiSQ==
X-Received: by 2002:a37:6754:: with SMTP id b81mr2072274qkc.129.1586889282884;
        Tue, 14 Apr 2020 11:34:42 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id o6sm10819346qkd.113.2020.04.14.11.34.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 11:34:42 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jOQOP-0007ea-Qq; Tue, 14 Apr 2020 15:34:41 -0300
Date:   Tue, 14 Apr 2020 15:34:41 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     selvin.xavier@broadcom.com, devesh.sharma@broadcom.com,
        dledford@redhat.com, leon@kernel.org, colin.king@canonical.com,
        roland@purestorage.com, linux-rdma@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] RDMA/ocrdma: Fix an off-by-one issue in 'ocrdma_add_stat'
Message-ID: <20200414183441.GA28870@ziepe.ca>
References: <20200328073040.24429-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200328073040.24429-1-christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Mar 28, 2020 at 08:30:40AM +0100, Christophe JAILLET wrote:
> There is an off-by-one issue when checking if there is enough space in the
> output buffer, because we must keep some place for a final '\0'.
> 
> While at it:
>    - Use 'scnprintf' instead of 'snprintf' in order to avoid a superfluous
>     'strlen'
>    - avoid some useless initializations
>    - avoida hard coded buffer size that can be computed at built time.
> 
> Fixes: a51f06e1679e ("RDMA/ocrdma: Query controller information")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> The '\0' comes from memset(..., 0, ...) in all callers.
> This could be also avoided if needed.
> ---
>  drivers/infiniband/hw/ocrdma/ocrdma_stats.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_stats.c b/drivers/infiniband/hw/ocrdma/ocrdma_stats.c
> index 5f831e3bdbad..614a449e6b87 100644
> --- a/drivers/infiniband/hw/ocrdma/ocrdma_stats.c
> +++ b/drivers/infiniband/hw/ocrdma/ocrdma_stats.c
> @@ -49,13 +49,12 @@ static struct dentry *ocrdma_dbgfs_dir;
>  static int ocrdma_add_stat(char *start, char *pcur,
>  				char *name, u64 count)
>  {
> -	char buff[128] = {0};
> -	int cpy_len = 0;
> +	char buff[128];
> +	int cpy_len;
>  
> -	snprintf(buff, 128, "%s: %llu\n", name, count);
> -	cpy_len = strlen(buff);
> +	cpy_len = scnprintf(buff, sizeof(buff), "%s: %llu\n", name, count);
>  
> -	if (pcur + cpy_len > start + OCRDMA_MAX_DBGFS_MEM) {
> +	if (pcur + cpy_len >= start + OCRDMA_MAX_DBGFS_MEM) {
>  		pr_err("%s: No space in stats buff\n", __func__);
>  		return 0;
>  	}

The memcpy is still kind of silly right? What about this:

static int ocrdma_add_stat(char *start, char *pcur, char *name, u64 count)
{
	size_t len = (start + OCRDMA_MAX_DBGFS_MEM) - pcur;
	int cpy_len;

	cpy_len = snprintf(pcur, len, "%s: %llu\n", name, count);
	if (cpy_len >= len || cpy_len < 0) {
		pr_err("%s: No space in stats buff\n", __func__);
		return 0;
	}
	return cpy_len;
}

Jason
