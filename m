Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D951109E59
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Nov 2019 13:53:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727533AbfKZMxM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 Nov 2019 07:53:12 -0500
Received: from mail.fireflyinternet.com ([109.228.58.192]:52620 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727519AbfKZMxM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Nov 2019 07:53:12 -0500
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 19343900-1500050 
        for multiple; Tue, 26 Nov 2019 12:53:05 +0000
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
To:     Bruce Chang <yu.bruce.chang@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
From:   Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191126125003.zpczouqpyr7njwha@kili.mountain>
Cc:     David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20191126125003.zpczouqpyr7njwha@kili.mountain>
Message-ID: <157477277885.15944.15314564966394699342@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH] drm/i915: unmap the correct pointer in
 i915_error_object_create()
Date:   Tue, 26 Nov 2019 12:52:58 +0000
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Quoting Dan Carpenter (2019-11-26 12:50:03)
> We should be unmapping "page" instead of "s".  This code originally used
> kmap_atomic() before it was changed to kmap().  The two mapping
> functions are different which leads to this common mistake.
> 
> Fixes: 3e749f5199e1 ("drm/i915: Avoid atomic context for error capture")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Caught by bae21dacd7b7 ("drm/i915: Switch kunmap() to take the page not
vaddr")

Thanks for smatch!
-Chris
