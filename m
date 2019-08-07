Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC1F84D73
	for <lists+kernel-janitors@lfdr.de>; Wed,  7 Aug 2019 15:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388250AbfHGNfV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 7 Aug 2019 09:35:21 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:52916 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2388232AbfHGNfV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Aug 2019 09:35:21 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 17918905-1500050 
        for multiple; Wed, 07 Aug 2019 14:35:16 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
From:   Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <156518113518.6198.15252656122354479322@skylake-alporthouse-com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
References: <20190807122832.GA10517@mwanda>
 <156518113518.6198.15252656122354479322@skylake-alporthouse-com>
Message-ID: <156518491397.6198.14048305337074834151@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: Fix some NULL vs IS_ERR() conditions
Date:   Wed, 07 Aug 2019 14:35:13 +0100
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Quoting Chris Wilson (2019-08-07 13:32:15)
> Quoting Dan Carpenter (2019-08-07 13:28:32)
> > There were several places which check for NULL when they should have
> > been checking for IS_ERR().
> > 
> > Fixes: d8af05ff38ae ("drm/i915: Allow sharing the idle-barrier from other kernel requests")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Oops,
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

And pushed, ta.
-Chris
