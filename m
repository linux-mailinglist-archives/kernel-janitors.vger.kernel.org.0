Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D42E30CBB
	for <lists+kernel-janitors@lfdr.de>; Fri, 31 May 2019 12:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfEaKkd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 31 May 2019 06:40:33 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:54113 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726002AbfEaKkd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 31 May 2019 06:40:33 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 16746809-1500050 
        for multiple; Fri, 31 May 2019 11:40:31 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
To:     Colin King <colin.king@canonical.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Matthew Auld <matthew.auld@intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
From:   Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190531103201.10124-1-colin.king@canonical.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190531103201.10124-1-colin.king@canonical.com>
Message-ID: <155929922781.27302.13050993726222660588@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH][next] drm/i915: fix use of uninitialized pointer vaddr
Date:   Fri, 31 May 2019 11:40:27 +0100
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Quoting Colin King (2019-05-31 11:32:01)
> From: Colin Ian King <colin.king@canonical.com>
> 
> The assignment of err is using the incorrect pointer vaddr that has
> not been initialized. Fix this by using the correct pointer obj instead.
> 
> Addresses-Coverity: ("Uninitialized pointer read")
> Fixes: 6501aa4e3a45 ("drm/i915: add in-kernel blitter client")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed and pushed, thanks for the fix!
-Chris
