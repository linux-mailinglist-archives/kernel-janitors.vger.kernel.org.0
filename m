Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABF95780E4
	for <lists+kernel-janitors@lfdr.de>; Mon, 18 Jul 2022 13:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234211AbiGRLgV (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 18 Jul 2022 07:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232158AbiGRLgV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 18 Jul 2022 07:36:21 -0400
Received: from out30-44.freemail.mail.aliyun.com (out30-44.freemail.mail.aliyun.com [115.124.30.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1CB9DF24
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Jul 2022 04:36:19 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0VJjf4Le_1658144174;
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0VJjf4Le_1658144174)
          by smtp.aliyun-inc.com;
          Mon, 18 Jul 2022 19:36:16 +0800
Date:   Mon, 18 Jul 2022 19:36:14 +0800
From:   Gao Xiang <hsiangkao@linux.alibaba.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
        Yue Hu <huyue2@coolpad.com>,
        Jeffle Xu <jefflexu@linux.alibaba.com>,
        linux-erofs@lists.ozlabs.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] erofs: clean up a loop
Message-ID: <YtVFrpFdaR2Iwf2x@B-P7TQMD6M-0146.local>
References: <YtVB6GBWHVSc6fbU@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YtVB6GBWHVSc6fbU@kili>
X-Spam-Status: No, score=-9.9 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On Mon, Jul 18, 2022 at 02:20:08PM +0300, Dan Carpenter wrote:
> It's easier to see what this loop is doing when the decrement is in
> the normal place.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/erofs/zdata.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
> index 601cfcb07c50..2691100eb231 100644
> --- a/fs/erofs/zdata.c
> +++ b/fs/erofs/zdata.c
> @@ -419,8 +419,8 @@ static bool z_erofs_try_inplace_io(struct z_erofs_decompress_frontend *fe,
>  {
>  	struct z_erofs_pcluster *const pcl = fe->pcl;
>  
> -	while (fe->icur > 0) {
> -		if (!cmpxchg(&pcl->compressed_bvecs[--fe->icur].page,
> +	while (fe->icur--) {

Thanks for your patch!
Yet at a quick glance, on my side, that doesn't equal
to be honest...

.. What we're trying to do here is to find a free slot
for inplace i/o, but also need to leave fe->icur as 0
when going out the loop since z_erofs_try_inplace_io()
can be called again the next time when attaching
another page but it will overflow then...

Thanks,
Gao Xiang

> +		if (!cmpxchg(&pcl->compressed_bvecs[fe->icur].page,
>  			     NULL, bvec->page)) {
>  			pcl->compressed_bvecs[fe->icur] = *bvec;
>  			return true;
> -- 
> 2.35.1
