Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0513A13286D
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Jan 2020 15:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbgAGOFb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Jan 2020 09:05:31 -0500
Received: from mail.fireflyinternet.com ([109.228.58.192]:55201 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727658AbgAGOFb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Jan 2020 09:05:31 -0500
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 19796537-1500050 
        for multiple; Tue, 07 Jan 2020 14:05:29 +0000
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
To:     "Souza, Jose" <jose.souza@intel.com>,
        "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
From:   Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <04c2960a11f5361288d7d3a8a3bd16301b05c5e5.camel@intel.com>
Cc:     "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
References: <20200107130322.gdk5b6jurifr26c2@kili.mountain>
 <04c2960a11f5361288d7d3a8a3bd16301b05c5e5.camel@intel.com>
Message-ID: <157840592663.2273.15929240102084093971@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH] drm/i915: fix an error code in
 intel_modeset_all_tiles()
Date:   Tue, 07 Jan 2020 14:05:26 +0000
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Quoting Souza, Jose (2020-01-07 14:01:40)
> On Tue, 2020-01-07 at 16:03 +0300, Dan Carpenter wrote:
> > There is a cut and paste bug so we return the wrong error code.
> > 
> > Fixes: a603f5bd1691 ("drm/i915/dp: Make sure all tiled connectors get
> > added to the state with full modeset")
> 
> Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
> 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed. Thanks for the patch,
-Chris
