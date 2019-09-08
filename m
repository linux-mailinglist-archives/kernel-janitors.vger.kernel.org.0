Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D194EACF98
	for <lists+kernel-janitors@lfdr.de>; Sun,  8 Sep 2019 18:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729216AbfIHQEe (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 8 Sep 2019 12:04:34 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:59506 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727764AbfIHQEe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 8 Sep 2019 12:04:34 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 9642D80549;
        Sun,  8 Sep 2019 18:04:29 +0200 (CEST)
Date:   Sun, 8 Sep 2019 18:04:28 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] drm: panel-lvds: Potential Oops in probe error
 handling
Message-ID: <20190908160428.GA20115@ravnborg.org>
References: <20190904115057.GC4811@pendragon.ideasonboard.com>
 <20190904185507.GA3634@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904185507.GA3634@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=yPCof4ZbAAAA:8
        a=bOQf2eCPNiB_VLlhhUQA:9 a=CjuIK1q_8ugA:10
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan.

On Wed, Sep 04, 2019 at 09:55:07PM +0300, Dan Carpenter wrote:
> The "lvds->backlight" pointer could be NULL in situations were
> of_parse_phandle() returns NULL.  Also it's slightly cleaner to use
> backlight_put() which already has a check for NULL built in.
> 
> Fixes: 7c9dff5bd643 ("drm: panels: Add LVDS panel driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

A much better fix would be to introduce use of devm_of_find_backlight().
Then you do not have to worry about put().

Care to respin a v3 that does this?

	Sam
