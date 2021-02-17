Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB7231D894
	for <lists+kernel-janitors@lfdr.de>; Wed, 17 Feb 2021 12:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbhBQLkz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 17 Feb 2021 06:40:55 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:44038 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232541AbhBQLii (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 17 Feb 2021 06:38:38 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11HBYuNi061979;
        Wed, 17 Feb 2021 11:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=jPvdeDdVcilj7SA18xFp7qCuNlolfCOSsRK5nC8WTXQ=;
 b=lh4acUks7TDLmXZKx9rfFeUo7zbQmplYN/ljQstkoz1v4+Ylk+KUB64f+eoTqa60+VT1
 E0EiFLDS6z/GpFiazrydnEhe8bykZQV5i5eXY3yFckxIwnxknmrm/9G4k20N6kCYFMRC
 2slgMzR4xpZo22E7tkTi2ePZe1VT+ACUpmbLKmusMm14igs7QwjPQGttwMR1v9gLNSSn
 Gxqp86kW9ZvEb0iAH9/dGWMsndSZRjOE19hWKYpXp6Jh0d5Y/HPYT4pmEHPUlccxB55u
 cYI6MMbyBeH3Otird7u5ukVKCcWeJh6uIKhyNnnbNVqztC38git6/3U1vSrjWJjEJcWT 0Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 36p66r22e0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Feb 2021 11:37:47 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11HBaBox140178;
        Wed, 17 Feb 2021 11:37:45 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 36prp04tch-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Feb 2021 11:37:45 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 11HBbeKZ008056;
        Wed, 17 Feb 2021 11:37:41 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 17 Feb 2021 03:37:39 -0800
Date:   Wed, 17 Feb 2021 14:37:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Jonathan Kim <jonathan.kim@amd.com>,
        David Airlie <airlied@linux.ie>,
        kernel-janitors@vger.kernel.org,
        Harish Kasiviswanathan <harish.kasiviswanathan@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/amdgpu: fix an error code in
 init_pmu_entry_by_type_and_add()
Message-ID: <20210217113728.GB2087@kadam>
References: <YCwefEWbsHeME7vQ@mwanda>
 <CADnq5_NUk+t46Phbfm6H5wFjaTxkrbM49Hd5py-NtTr+v76vgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnq5_NUk+t46Phbfm6H5wFjaTxkrbM49Hd5py-NtTr+v76vgw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9897 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102170091
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9897 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1011 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102170091
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Feb 16, 2021 at 02:52:55PM -0500, Alex Deucher wrote:
> On Tue, Feb 16, 2021 at 2:35 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > If the kmemdup() fails then this should return a negative error code
> > but it currently returns success.
> >
> > Fixes: b4a7db71ea06 ("drm/amdgpu: add per device user friendly xgmi events for vega20")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c     | 4 +++-
> >  drivers/gpu/drm/nouveau/nouveau_backlight.c | 1 +
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> > index 19c0a3655228..82e9ecf84352 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> > @@ -519,8 +519,10 @@ static int init_pmu_entry_by_type_and_add(struct amdgpu_pmu_entry *pmu_entry,
> >         pmu_entry->pmu.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
> >                                                                 GFP_KERNEL);
> >
> > -       if (!pmu_entry->pmu.attr_groups)
> > +       if (!pmu_entry->pmu.attr_groups) {
> > +               ret = -ENOMEM;
> >                 goto err_attr_group;
> > +       }
> >
> >         snprintf(pmu_name, PMU_NAME_SIZE, "%s_%d", pmu_entry->pmu_file_prefix,
> >                                 adev_to_drm(pmu_entry->adev)->primary->index);
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> > index 72f35a2babcb..3786b1c85182 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> > @@ -274,6 +274,7 @@ nouveau_backlight_init(struct drm_connector *connector)
> >
> >         if (!nouveau_get_backlight_name(backlight_name, bl)) {
> >                 NV_ERROR(drm, "Failed to retrieve a unique name for the backlight interface\n");
> > +               ret = -ENOMEM;
> >                 goto fail_alloc;
> >         }
> 
> This hunk looks unrelated?
> 

That's so weird...  I don't even have any clue how that would happen at
all..  Weee wooo weee woooo  ALIENS!

Anyway, I'll resend.  Thanks!

regards,
dan carpenter

