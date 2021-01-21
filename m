Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF78B2FE63A
	for <lists+kernel-janitors@lfdr.de>; Thu, 21 Jan 2021 10:22:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728577AbhAUJV0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 21 Jan 2021 04:21:26 -0500
Received: from mail.fireflyinternet.com ([77.68.26.236]:62881 "EHLO
        fireflyinternet.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728545AbhAUJU5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 21 Jan 2021 04:20:57 -0500
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 23657456-1500050 
        for multiple; Thu, 21 Jan 2021 09:19:47 +0000
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
In-Reply-To: <87h7namz5w.fsf@intel.com>
References: <YAkaBa22zvbXKd4E@mwanda> <87h7namz5w.fsf@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dp: Fix a logical vs bitwise OR bug
From:   Chris Wilson <chris@chris-wilson.co.uk>
Cc:     David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        intel-gfx@lists.freedesktop.org,
        Wambui Karuga <wambui.karugax@gmail.com>
To:     Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Date:   Thu, 21 Jan 2021 09:19:46 +0000
Message-ID: <161122078664.32666.16504061212673044761@build.alporthouse.com>
User-Agent: alot/0.9
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Quoting Jani Nikula (2021-01-21 09:12:27)
> On Thu, 21 Jan 2021, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > This was supposed to be | instead of ||.
> >
> > Fixes: 522508b665df ("drm/i915/display: Let PCON convert from RGB to YCbCr if it can")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks, but we already have the fix [1] for this that I thought was
> pushed by now [2].
> 
> Chris?

6b20b734bbf1 ("drm/i915/display: Bitwise or the conversion colour specifier together")
in
  remotes/drm-intel/drm-intel-next
  remotes/drm-intel/for-linux-next
should be visible.
-Chris
