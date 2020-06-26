Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDC920AFD6
	for <lists+kernel-janitors@lfdr.de>; Fri, 26 Jun 2020 12:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgFZKfP (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 26 Jun 2020 06:35:15 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48108 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgFZKfP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 Jun 2020 06:35:15 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B0D892A5859;
        Fri, 26 Jun 2020 11:35:12 +0100 (BST)
Date:   Fri, 26 Jun 2020 12:35:08 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <a.hajda@samsung.com>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/vc4: call ->post_disable() functions in
 vc4_dsi_encoder_disable()
Message-ID: <20200626123508.0a726db3@collabora.com>
In-Reply-To: <20200626103401.GA314359@mwanda>
References: <20200626103401.GA314359@mwanda>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 26 Jun 2020 13:34:01 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The problem is that the iterator is already at the list head so the
> list_for_each_entry_from() loop is a no-op and we don't call the
> the iter->funcs->post_disable() functions.  This should be
> list_for_each_entry() instead.
> 
> Fixes: 033bfe7538a1 ("drm/vc4: dsi: Fix bridge chain handling")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/vc4/vc4_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index eaf276978ee7..f92d0e92fa72 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -754,7 +754,7 @@ static void vc4_dsi_encoder_disable(struct drm_encoder *encoder)
>  
>  	vc4_dsi_ulps(dsi, true);
>  
> -	list_for_each_entry_from(iter, &dsi->bridge_chain, chain_node) {
> +	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
>  		if (iter->funcs->post_disable)
>  			iter->funcs->post_disable(iter);
>  	}

