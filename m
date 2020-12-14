Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46D322D955E
	for <lists+kernel-janitors@lfdr.de>; Mon, 14 Dec 2020 10:39:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393601AbgLNJi4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 14 Dec 2020 04:38:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23313 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728667AbgLNJiq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 14 Dec 2020 04:38:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607938639;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jJITYNcYZy9bWpFBf8qUIxMVsU06tfqMpCOlk/PORM0=;
        b=Cz+LXu7YheqcwpFZE8HMRlUAqPec1Sfi4xos+zzPRl4erjO+0pAeYLCExnQ0VMXo6hsZYR
        TbeZNSuwxHyE8TpFGmdum4iJtPyXdqiYYz6Rze1E+4AN2JScIvZif1VGviFhp980CzOy2M
        ysQ/qxc93jRZ3/Od4FyXbk2m2Ko82SE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-k6keiBBsOGicQk8iwCCIgA-1; Mon, 14 Dec 2020 04:37:17 -0500
X-MC-Unique: k6keiBBsOGicQk8iwCCIgA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5AC5107ACE4;
        Mon, 14 Dec 2020 09:37:15 +0000 (UTC)
Received: from [10.36.114.184] (ovpn-114-184.ams2.redhat.com [10.36.114.184])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 70A1062467;
        Mon, 14 Dec 2020 09:37:13 +0000 (UTC)
Subject: Re: [PATCH] hugetlb: Fix an error code in hugetlb_reserve_pages()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mina Almasry <almasrymina@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
References: <X9NGZWnZl5/Mt99R@mwanda>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <2a7ac28f-3623-a1ad-951f-58cf143a75b8@redhat.com>
Date:   Mon, 14 Dec 2020 10:37:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <X9NGZWnZl5/Mt99R@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 11.12.20 11:13, Dan Carpenter wrote:
> Preserve the error code from region_add() instead of returning success.
> 
> Fixes: 0db9d74ed884 ("hugetlb: disable region_add file_region coalescing")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From static analysis.  Untested.
> 
>  mm/hugetlb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 1f3bf1710b66..ac2e48b9f1d7 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5113,6 +5113,7 @@ int hugetlb_reserve_pages(struct inode *inode,
>  
>  		if (unlikely(add < 0)) {
>  			hugetlb_acct_memory(h, -gbl_reserve);
> +			ret = add;
>  			goto out_put_pages;
>  		} else if (unlikely(chg > add)) {
>  			/*
> 

Was wioing if something like

return ret ? ret : add;

would be cleaner, but then I spotted "chg" ...

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

