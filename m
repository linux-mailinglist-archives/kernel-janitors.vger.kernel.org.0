Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 058D7297CAA
	for <lists+kernel-janitors@lfdr.de>; Sat, 24 Oct 2020 15:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1761794AbgJXNvd (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 24 Oct 2020 09:51:33 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:60884 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgJXNvd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 24 Oct 2020 09:51:33 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09ODnLHD080910;
        Sat, 24 Oct 2020 13:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=7rjOYCVlssD4+N9kW3ptFrEt/i1XeNEK+8icb/redcs=;
 b=vXT7Hl7EIjBJFGpKmhCb4LY0i2v/CpTf+9gaJqRz8CDsX+ZTbO0UuZ5b9anKlqBd8Sog
 jOz+WpzLDCwkYaqI+aJEAGuoePxrdCSpmpwWpLqL2hcGqJLEqcFOAO/E+0MO3uYfweCq
 DAWghKJGkwbTjJJhMqR9u5IaL9oMH3zhRHhVfl/Iknk4X7kehOePytmkS83jFFpXpZAO
 jkeZ4j5VyuGA8enIspRuTOg5O7knR1wkVFLVb6EymG/7W6vI18ZFea0UULMUo/9iIBx+
 JQ+1quEbquWMfXxUdOkPeB2tPzgpulq1yX5OSYatftIF4C9/oFE3ho/zZVEli5cedFVD tg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 34cc7kgpm0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 24 Oct 2020 13:50:15 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09ODkWeO109630;
        Sat, 24 Oct 2020 13:48:14 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 34cbkhh38e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 24 Oct 2020 13:48:14 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09ODm1Gd027136;
        Sat, 24 Oct 2020 13:48:01 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 24 Oct 2020 06:48:01 -0700
Date:   Sat, 24 Oct 2020 16:47:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Matthew Auld <matthew.auld@intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Fix a crash in shmem_pin_map() error handling
Message-ID: <20201024134752.GF18329@kadam>
References: <20201023113401.GG282278@mwanda>
 <20201023121941.GB18499@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201023121941.GB18499@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9783 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 phishscore=0 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010240105
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9783 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010240106
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 23, 2020 at 02:19:41PM +0200, Christoph Hellwig wrote:
> > diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
> > index f011ea42487e..7eb542018219 100644
> > --- a/drivers/gpu/drm/i915/gt/shmem_utils.c
> > +++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
> > @@ -52,8 +52,9 @@ struct file *shmem_create_from_object(struct drm_i915_gem_object *obj)
> >  void *shmem_pin_map(struct file *file)
> >  {
> >  	struct page **pages;
> > -	size_t n_pages, i;
> > +	size_t n_pages;
> >  	void *vaddr;
> > +	int i;
> >  
> >  	n_pages = file->f_mapping->host->i_size >> PAGE_SHIFT;
> >  	pages = kvmalloc_array(n_pages, sizeof(*pages), GFP_KERNEL);
> 
> This assumes we never have more than INT_MAX worth of pages before
> a failure. 

Doh.  Yeah.  My bad.

regards,
dan carpenter
