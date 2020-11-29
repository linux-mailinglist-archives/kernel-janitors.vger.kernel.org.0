Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76CCC2C7B96
	for <lists+kernel-janitors@lfdr.de>; Sun, 29 Nov 2020 23:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgK2WFA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 29 Nov 2020 17:05:00 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:40902 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgK2WFA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 29 Nov 2020 17:05:00 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 1EF4120034;
        Sun, 29 Nov 2020 23:04:12 +0100 (CET)
Date:   Sun, 29 Nov 2020 23:04:11 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "Dea, Edmund J" <edmund.j.dea@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/kmb: Remove an unnecessary NULL check
Message-ID: <20201129220411.GG1162850@ravnborg.org>
References: <20201117072137.GB1111239@mwanda>
 <BY5PR11MB4182EBE4FD5F42AC625945998CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
 <20201120082146.GA314029@ravnborg.org>
 <460740bc-ffb8-91c1-47ec-94a38dd2308d@suse.de>
 <BY5PR11MB4182170E428502EF005B27E48CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR11MB4182170E428502EF005B27E48CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8
        a=e5mUnYsNAAAA:8 a=yPCof4ZbAAAA:8 a=-5daY3v0RUpMMgDoOU4A:9
        a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
        a=Vxmtnl_E_bksehYqCbjh:22
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Anitha,

On Fri, Nov 20, 2020 at 05:28:59PM +0000, Chrisanthus, Anitha wrote:
> 
> 
> > -----Original Message-----
> > From: Thomas Zimmermann <tzimmermann@suse.de>
> > Sent: Friday, November 20, 2020 12:34 AM
> > To: Sam Ravnborg <sam@ravnborg.org>; Chrisanthus, Anitha
> > <anitha.chrisanthus@intel.com>
> > Cc: David Airlie <airlied@linux.ie>; Dea, Edmund J <edmund.j.dea@intel.com>;
> > kernel-janitors@vger.kernel.org; dri-devel@lists.freedesktop.org; Dan
> > Carpenter <dan.carpenter@oracle.com>
> > Subject: Re: [PATCH] drm/kmb: Remove an unnecessary NULL check
> > 
> > Hi
> > 
> > Am 20.11.20 um 09:21 schrieb Sam Ravnborg:
> > > Hi Anitha.
> > >
> > > On Fri, Nov 20, 2020 at 01:19:06AM +0000, Chrisanthus, Anitha wrote:
> > >> Looks good to me.
> > >
> > > Can we get either an "Acked-by:" or "Reviewed-by:"?
> > > Then we can use this while applying.
> Sorry, forgot that.
> Reviewed-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>

Thanks, patch is now pushed to drm-misc-next.

	Sam
