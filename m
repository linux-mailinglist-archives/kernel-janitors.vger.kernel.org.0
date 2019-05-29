Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D81CB2DD04
	for <lists+kernel-janitors@lfdr.de>; Wed, 29 May 2019 14:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727374AbfE2M2H convert rfc822-to-8bit (ORCPT
        <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 29 May 2019 08:28:07 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:53228 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727372AbfE2M2G (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 29 May 2019 08:28:06 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 16719614-1500050 
        for multiple; Wed, 29 May 2019 13:28:03 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
From:   Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <155912801762.13891.15171740473591714585@skylake-alporthouse-com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Mika Kuoppala <mika.kuoppala@linux.intel.com>,
        Matthew Auld <matthew.william.auld@gmail.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
References: <20190529110355.GA19119@mwanda>
 <155912801762.13891.15171740473591714585@skylake-alporthouse-com>
Message-ID: <155913288011.13891.1426155673802597558@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: selftest_lrc: Check the correct variable
Date:   Wed, 29 May 2019 13:28:00 +0100
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Quoting Chris Wilson (2019-05-29 12:06:57)
> Quoting Dan Carpenter (2019-05-29 12:03:55)
> > We should check "request[n]" instead of just "request".
> > 
> > Fixes: 78e41ddd2198 ("drm/i915: Apply an execution_mask to the virtual_engine")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Oops.
> Reviewd-by: Chris Wilson <chris@chris-wilson.co.uk>

s/Reviewd/Reviewed/
And pushed, thanks for the fix.
-Chris
