Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE982D9344
	for <lists+kernel-janitors@lfdr.de>; Mon, 14 Dec 2020 07:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727747AbgLNGbT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 14 Dec 2020 01:31:19 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:39208 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgLNGbT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 14 Dec 2020 01:31:19 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BE6OjLw135714;
        Mon, 14 Dec 2020 06:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=eTcVx+zYAqt3xiesxfWT+p+5jhqtCGYH972TyzkxRJI=;
 b=HvFtXlQfp8QpPrFLbgRMLApq8zyjdS80pf5esjgjznwxpvMvMolpJ9tlZsNsaZUdzqzK
 jmHt50pbZHR4Q25CbkvFcdqxyzELFdo5IV1FjpxNz7J9h0JcGO/r6QZk7J5C5nMhRu7S
 SY4fjiOZqCEs3nQDjQ9qzDI7DAoemTlKtzhK3UfJrYAuwj6K4YIV5ls1Q1w4HiVdssPQ
 ZNLiFxgAtrfkHhHgeKMQPmwQBh84AufW+rRMte+Z2+4erGGZxnDwtEbFNNCueWsc+KqH
 bGUXZL6pb69xl3axS0dG6ta8nqUXXeOOuzwJhLWA7e5i1rNPBI6iw1GErDCdOy1qI99L 7w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 35cn9r3k3c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 14 Dec 2020 06:30:32 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BE6PDir146658;
        Mon, 14 Dec 2020 06:30:32 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 35d7mphh8f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 14 Dec 2020 06:30:32 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BE6UT7d006830;
        Mon, 14 Dec 2020 06:30:30 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sun, 13 Dec 2020 22:30:29 -0800
Date:   Mon, 14 Dec 2020 09:30:21 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Souptick Joarder <jrdr.linux@gmail.com>
Cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Mina Almasry <almasrymina@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>,
        Linux-MM <linux-mm@kvack.org>, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hugetlb: Fix an error code in hugetlb_reserve_pages()
Message-ID: <20201214063021.GA2809@kadam>
References: <X9NGZWnZl5/Mt99R@mwanda>
 <CAFqt6zYtQ0BR_KZjJsicmmGDT1WYyYYOHqEVe1Vd5ZWLBSAVWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFqt6zYtQ0BR_KZjJsicmmGDT1WYyYYOHqEVe1Vd5ZWLBSAVWA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012140048
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012140048
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Dec 12, 2020 at 01:19:28AM +0530, Souptick Joarder wrote:
> Hi Dan,
> 
> On Fri, Dec 11, 2020 at 3:44 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > Preserve the error code from region_add() instead of returning success.
> >
> > Fixes: 0db9d74ed884 ("hugetlb: disable region_add file_region coalescing")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > From static analysis.  Untested.
> >
> >  mm/hugetlb.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 1f3bf1710b66..ac2e48b9f1d7 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -5113,6 +5113,7 @@ int hugetlb_reserve_pages(struct inode *inode,
> >
> >                 if (unlikely(add < 0)) {
> >                         hugetlb_acct_memory(h, -gbl_reserve);
> > +                       ret = add;
> 
> This function returns int but ret is long type.
> Does it need correction ?
>

It doesn't *need* correction.  The code works fine as-is.  Smatch parses
it correctly, also.  Hard to say if making it "ret" makes the code
simpler or more complicated for a human reader.

regards,
dan carpenter

