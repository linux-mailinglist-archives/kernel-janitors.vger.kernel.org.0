Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79E26B9F77
	for <lists+kernel-janitors@lfdr.de>; Sat, 21 Sep 2019 20:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfIUSzs (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 21 Sep 2019 14:55:48 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:60255 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbfIUSzr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 21 Sep 2019 14:55:47 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id A460B2002D;
        Sat, 21 Sep 2019 20:55:42 +0200 (CEST)
Date:   Sat, 21 Sep 2019 20:55:41 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v3] drm: panel-lvds: Potential Oops in probe error
 handling
Message-ID: <20190921185541.GA32133@ravnborg.org>
References: <20190911104928.GA15930@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911104928.GA15930@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=yPCof4ZbAAAA:8
        a=bz466c7j6o7e4iieULIA:9 a=CjuIK1q_8ugA:10
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan.

On Wed, Sep 11, 2019 at 01:49:28PM +0300, Dan Carpenter wrote:
> The "lvds->backlight" pointer could be NULL in situations where
> of_parse_phandle() returns NULL.  This code is cleaner if we use the
> managed devm_of_find_backlight() so the clean up is automatic.
> 
> Fixes: 7c9dff5bd643 ("drm: panels: Add LVDS panel driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v3: Use devm_of_find_backlight().  This version is quite a bit more
>     ambitious, and I haven't tested it so please review carefully.
Looks good.
Applied and pushed to drm-misc-next.

It will hit upstream not at this but next merge window.

	Sam
