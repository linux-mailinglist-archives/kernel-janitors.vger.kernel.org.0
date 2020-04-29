Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 051481BE012
	for <lists+kernel-janitors@lfdr.de>; Wed, 29 Apr 2020 16:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbgD2OEw (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 29 Apr 2020 10:04:52 -0400
Received: from mga17.intel.com ([192.55.52.151]:59789 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727869AbgD2OEv (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 29 Apr 2020 10:04:51 -0400
IronPort-SDR: BGYYkXQSkgPS05d8ELP8XvwPSy0Gwm88SJKVxOrZgnTutLobINtHdQrJSNHBFoWHMWnzlsdLKU
 NDrChQMo63Jg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 07:04:51 -0700
IronPort-SDR: SE2f6Txtq1iZn02sLHrtoUgjQlCr8E8HxVcZdIPDSOr4FAJbg0FCgI/4uaA5nuhcZKAUWuGo6U
 v0W9rushVC8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; 
   d="scan'208";a="405046929"
Received: from jncorcor-mobl.ger.corp.intel.com (HELO intel.com) ([10.252.22.42])
  by orsmga004.jf.intel.com with ESMTP; 29 Apr 2020 07:04:44 -0700
Date:   Wed, 29 Apr 2020 17:04:43 +0300
From:   Andi Shyti <andi.shyti@intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Mika Kuoppala <mika.kuoppala@linux.intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Matthew Auld <matthew.auld@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/selftests: fix error handling in
 __live_lrc_indirect_ctx_bb()
Message-ID: <20200429140443.GC5168@intel.intel>
References: <20200429132425.GE815283@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429132425.GE815283@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On Wed, Apr 29, 2020 at 04:24:25PM +0300, Dan Carpenter wrote:
> If intel_context_create() fails then it leads to an error pointer
> dereference.  I shuffled things around to make error handling easier.
> 
> Fixes: 1dd47b54baea ("drm/i915: Add live selftests for indirect ctx batchbuffers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Thanks,
Andi
