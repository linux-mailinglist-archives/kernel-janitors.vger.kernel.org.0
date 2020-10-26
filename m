Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A400F298A0C
	for <lists+kernel-janitors@lfdr.de>; Mon, 26 Oct 2020 11:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391364AbgJZJuD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 26 Oct 2020 05:50:03 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:55220 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1768496AbgJZJtR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Oct 2020 05:49:17 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09Q9TQsq176793;
        Mon, 26 Oct 2020 09:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=DsatrYWuTVQD9DFTRg3SP/t5ZKpx/JJaPj4Ye2QdCYc=;
 b=hb5fEt+dGXpomfwahueNv9SOzWFTeuX7UA0toeM7ryBrdYmeQBG5h+lB867rt5h5ljA5
 vEpUOeoJHHXC7GeN9iaagFRVNqadWDv7vCfIgqhd1AjhzQMh8yqUda6+m+YYMkCokuzI
 h9JPr6UiTPBrL+8/QAdsadomJs9AePhEsm66YkENajo9NT6LDpt3/EdR521sqcImyLLE
 Z1LTudnV2Sc9qv57rK/XvkZnUuL8CuFfLacZZ/MJkNM8CACPfY1ucrhvXlgMNSxl2ZN2
 Ut4bsK44TbkJ7YprP3SuehT09oZ6QRrAzntr9j2tJhZiLa9g70yz/8IGuFejLwxvIkaT wQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 34c9sakxgn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 26 Oct 2020 09:47:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09Q9kCiJ047258;
        Mon, 26 Oct 2020 09:47:04 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 34cx1pc82y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 26 Oct 2020 09:47:04 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09Q9kstM020727;
        Mon, 26 Oct 2020 09:46:55 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 26 Oct 2020 02:46:54 -0700
Date:   Mon, 26 Oct 2020 12:46:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Eric Anholt <eric@anholt.duckdns.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/v3d: Fix double free in v3d_submit_cl_ioctl()
Message-ID: <20201026094648.GH18329@kadam>
References: <20191024205306.GA14416@mwanda>
 <20191025090956.0bd40095@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191025090956.0bd40095@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9785 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=2 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010260069
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9785 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1011 suspectscore=2
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010260068
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 25, 2019 at 09:09:56AM +1100, Stephen Rothwell wrote:
> Hi Dan,
> 
> On Thu, 24 Oct 2019 23:53:06 +0300 Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > Originally this error path used to leak "bin" but then we accidentally
> > applied two separate commits to fix it and ended up with a double free.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > Hi Stephen,
> > 
> > I think this one is actually just a linux-next issue and the Fixes tag
> > would point to commit f8593384f83f ("Merge remote-tracking branch
> > 'drm/drm-next'").
> > 
> > The original commits are 0d352a3a8a1f ("drm/v3d: don't leak bin job if
> > v3d_job_init fails.") and commit 29cd13cfd762 ("drm/v3d: Fix memory leak
> > in v3d_submit_cl_ioctl").
> > 
> > I'm not totally sure how you guys address this normally but presumably
> > you are experts at dealing with merge issues.  :)
> > 
> >  drivers/gpu/drm/v3d/v3d_gem.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> > index 549dde83408b..37515e47b47e 100644
> > --- a/drivers/gpu/drm/v3d/v3d_gem.c
> > +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> > @@ -568,7 +568,6 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
> >  		ret = v3d_job_init(v3d, file_priv, &bin->base,
> >  				   v3d_job_free, args->in_sync_bcl);
> >  		if (ret) {
> > -			kfree(bin);
> >  			v3d_job_put(&render->base);
> >  			kfree(bin);
> >  			return ret;
> 
> I will just apply this as part of the drm tree merge until Dave merges
> the drm-misc-fixes tree and fixes this up.
> 

It turns out that Dave never fixed it.  Let me resend.

regards,
dan carpenter

