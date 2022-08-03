Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE6BA588F95
	for <lists+kernel-janitors@lfdr.de>; Wed,  3 Aug 2022 17:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238097AbiHCPnu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 3 Aug 2022 11:43:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236130AbiHCPnt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Aug 2022 11:43:49 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34AB2638D;
        Wed,  3 Aug 2022 08:43:49 -0700 (PDT)
Received: from fraeml740-chm.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LybdP0Zn6z67PDP;
        Wed,  3 Aug 2022 23:39:37 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml740-chm.china.huawei.com (10.206.15.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 3 Aug 2022 17:43:47 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 3 Aug
 2022 16:43:46 +0100
Date:   Wed, 3 Aug 2022 16:43:44 +0100
From:   Jonathan Cameron <Jonathan.Cameron@huawei.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Alison Schofield <alison.schofield@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Ben Widawsky <bwidawsk@kernel.org>,
        "Vishal Verma" <vishal.l.verma@intel.com>,
        Ira Weiny <ira.weiny@intel.com>, <linux-cxl@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] cxl/region: Fix IS_ERR() vs NULL check
Message-ID: <20220803164344.000064e4@huawei.com>
In-Reply-To: <Yuo65lq2WtfdGJ0X@kili>
References: <Yuo65lq2WtfdGJ0X@kili>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhreml740-chm.china.huawei.com (10.201.108.190) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 3 Aug 2022 12:07:50 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The nvdimm_pmem_region_create() function returns NULL on error.  It does
> not return error pointers.
> 
> Fixes: 04ad63f086d1 ("cxl/region: Introduce cxl_pmem_region objects")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
LGTM

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/cxl/pmem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cxl/pmem.c b/drivers/cxl/pmem.c
> index e69f99a0747d..7dc0a2fa1a6b 100644
> --- a/drivers/cxl/pmem.c
> +++ b/drivers/cxl/pmem.c
> @@ -525,8 +525,8 @@ static int cxl_pmem_region_probe(struct device *dev)
>  
>  	cxlr_pmem->nd_region =
>  		nvdimm_pmem_region_create(cxl_nvb->nvdimm_bus, &ndr_desc);
> -	if (IS_ERR(cxlr_pmem->nd_region)) {
> -		rc = PTR_ERR(cxlr_pmem->nd_region);
> +	if (!cxlr_pmem->nd_region) {
> +		rc = -ENOMEM;
>  		goto err;
>  	}
>  

