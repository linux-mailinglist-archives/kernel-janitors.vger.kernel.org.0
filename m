Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A44F86051
	for <lists+kernel-janitors@lfdr.de>; Thu,  8 Aug 2019 12:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732116AbfHHKoh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 8 Aug 2019 06:44:37 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:56930 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731054AbfHHKoh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Aug 2019 06:44:37 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 17928851-1500050 
        for multiple; Thu, 08 Aug 2019 11:44:23 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Xiong Zhang <xiong.y.zhang@intel.com>,
        Zhenyu Wang <zhenyuw@linux.intel.com>
From:   Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190808103236.GB30506@mwanda>
Cc:     David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        intel-gvt-dev@lists.freedesktop.org,
        Zhi Wang <zhi.a.wang@intel.com>
References: <20190808103236.GB30506@mwanda>
Message-ID: <156526106102.20411.17520131390381233492@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: Use after free in error path in
 intel_vgpu_create_workload()
Date:   Thu, 08 Aug 2019 11:44:21 +0100
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Quoting Dan Carpenter (2019-08-08 11:32:36)
> We can't free "workload" until after the printk or it's a use after
> free.
> 
> Fixes: 2089a76ade90 ("drm/i915/gvt: Checking workload's gma earlier")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

That's the simpler patch,
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
