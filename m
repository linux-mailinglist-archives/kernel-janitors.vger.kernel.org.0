Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBDD22D7472
	for <lists+kernel-janitors@lfdr.de>; Fri, 11 Dec 2020 12:06:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389369AbgLKLCz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 11 Dec 2020 06:02:55 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:49336 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729457AbgLKLCs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Dec 2020 06:02:48 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id D061180672;
        Fri, 11 Dec 2020 12:01:58 +0100 (CET)
Date:   Fri, 11 Dec 2020 12:01:57 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/panel: khadas: Fix error code in
 khadas_ts050_panel_add()
Message-ID: <20201211110157.GA527186@ravnborg.org>
References: <X9NEfmgGilaXJs2R@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X9NEfmgGilaXJs2R@mwanda>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=yPCof4ZbAAAA:8 a=7gkXJVJtAAAA:8
        a=LgsML8mqMRuCtKI92vIA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

I assume your nice tooling found this buggy.
Nice!

On Fri, Dec 11, 2020 at 01:05:50PM +0300, Dan Carpenter wrote:
> There is a copy and paste bug so it didn't return the correct error
> code.
> 
> Fixes: b215212117f7 ("drm: panel: add Khadas TS050 panel driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Neil, I assume you will take this via next-fixes, which I think is the
right tree at the moment.

	Sam
