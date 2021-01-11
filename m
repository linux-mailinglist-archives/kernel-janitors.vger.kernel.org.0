Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB68E2F19BD
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 Jan 2021 16:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732438AbhAKPc1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 11 Jan 2021 10:32:27 -0500
Received: from mga03.intel.com ([134.134.136.65]:15535 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732413AbhAKPc1 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 11 Jan 2021 10:32:27 -0500
IronPort-SDR: bk4Jx4luoo/j1Qc1zNlIl1I3eyl+bB+tf4Y67JMraLijxjgV5Ir/9I9/OAZVrksR8FpiVaM0KO
 /lge4Hji9CUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9860"; a="177974761"
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; 
   d="scan'208";a="177974761"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2021 07:31:44 -0800
IronPort-SDR: mzhR87LQ/ofphbp4CytRntqvT2/ORg/3SCPgdZppthAsqr8l7swXb2WdW0MgZ1MpH4YXmUsj1l
 gbkMEGv2jzXQ==
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; 
   d="scan'208";a="352639387"
Received: from mgabor-mobl1.ger.corp.intel.com (HELO intel.com) ([10.214.242.11])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2021 07:31:39 -0800
Date:   Mon, 11 Jan 2021 17:31:35 +0200
From:   Andi Shyti <andi.shyti@intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mika Kuoppala <mika.kuoppala@linux.intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Matthew Auld <matthew.auld@intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] drm/i915: selftest_lrc: Fix error code in
 live_preempt_user()
Message-ID: <X/xvV6IqusOkKGdD@intel.intel>
References: <161037060292.28181.5373987654669273170@build.alporthouse.com>
 <X/xeIMP16sDekYrh@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/xeIMP16sDekYrh@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On Mon, Jan 11, 2021 at 05:18:08PM +0300, Dan Carpenter wrote:
> This error path should return a negative error code instead of success.
> 
> Fixes: c92724de6db1 ("drm/i915/selftests: Try to detect rollback during batchbuffer preemption")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Thanks,
Andi
