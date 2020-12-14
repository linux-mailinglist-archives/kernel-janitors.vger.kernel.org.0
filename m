Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5472A2DA085
	for <lists+kernel-janitors@lfdr.de>; Mon, 14 Dec 2020 20:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408553AbgLNTbA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 14 Dec 2020 14:31:00 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:35822 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408575AbgLNTao (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 14 Dec 2020 14:30:44 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BEJOTgd173260;
        Mon, 14 Dec 2020 19:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=B9veKK6RS8BjzhYYkonv/wRvP3TajCIALIsGxb6pXDs=;
 b=ObR9Uu+n7w+esaYRArJ0QtqW9vbmfm54jNTNUyw+HDchaMPSglW6nt+rg3ARuBkK8uj0
 byK/eyANnlM8WckCtJE4GSJvir0UYlBJhwLehNlPmmpHPkIL3eyRDmGQPggPwFNC3V+q
 b1MGkBOPK/JCtJRjTtblRag93Q6wPXywkcbUposSJP/l0IQ/8bWo1y+LIrNBKkoFQT8P
 +cziYyilwB1GFxcZQNR6ysMmJRtuEacc6y4UWhOfBHrBEX7b4nrgcNBT0fyTBsLrYBg2
 gLsFMMiFFTK+kEYdvQHdLRRHHUBWxC1IgrIVX6QlYkwK1U82nJM3uy7pZG401eV1e5xC Bw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 35cn9r73db-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 14 Dec 2020 19:29:53 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BEJP5ND077765;
        Mon, 14 Dec 2020 19:27:53 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 35e6jpws7h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 14 Dec 2020 19:27:53 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BEJRqO6007570;
        Mon, 14 Dec 2020 19:27:52 GMT
Received: from [192.168.2.112] (/50.38.35.18)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 14 Dec 2020 11:27:51 -0800
Subject: Re: [PATCH] hugetlb: Fix an error code in hugetlb_reserve_pages()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mina Almasry <almasrymina@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
References: <X9NGZWnZl5/Mt99R@mwanda>
From:   Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <dff4211a-687c-a3e1-fdf6-1562581e0da4@oracle.com>
Date:   Mon, 14 Dec 2020 11:27:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <X9NGZWnZl5/Mt99R@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012140128
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012140128
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 12/11/20 2:13 AM, Dan Carpenter wrote:
> Preserve the error code from region_add() instead of returning success.
> 
> Fixes: 0db9d74ed884 ("hugetlb: disable region_add file_region coalescing")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From static analysis.  Untested.

Thanks Dan.

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


That error path is VERY unlikely to be taken, but is indeed incorrect.

When looking at this, I noticed that callers of hugetlb_reserve_pages only
check for 0 or !0.  This changed as the code evolved to add reservation
cgroup support.  The routine type can be changed to a bool and simplified
some.  I'll send that as a follow up patch not for stable.

Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
-- 
Mike Kravetz
