Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442982BA481
	for <lists+kernel-janitors@lfdr.de>; Fri, 20 Nov 2020 09:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgKTIVv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 20 Nov 2020 03:21:51 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:58746 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726172AbgKTIVv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Nov 2020 03:21:51 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 239E420021;
        Fri, 20 Nov 2020 09:21:47 +0100 (CET)
Date:   Fri, 20 Nov 2020 09:21:46 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        David Airlie <airlied@linux.ie>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "Dea, Edmund J" <edmund.j.dea@intel.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/kmb: Remove an unnecessary NULL check
Message-ID: <20201120082146.GA314029@ravnborg.org>
References: <20201117072137.GB1111239@mwanda>
 <BY5PR11MB4182EBE4FD5F42AC625945998CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR11MB4182EBE4FD5F42AC625945998CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=isEt3gtejD-aSxsmFxgA:9 a=CjuIK1q_8ugA:10
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Anitha.

On Fri, Nov 20, 2020 at 01:19:06AM +0000, Chrisanthus, Anitha wrote:
> Looks good to me.

Can we get either an "Acked-by:" or "Reviewed-by:"?
Then we can use this while applying.

Any news on gettting commit access yourself?
If not, then try to ping on the open ticket.


	Sam
