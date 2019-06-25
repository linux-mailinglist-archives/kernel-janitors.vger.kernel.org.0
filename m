Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9592555C22
	for <lists+kernel-janitors@lfdr.de>; Wed, 26 Jun 2019 01:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbfFYXRv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 25 Jun 2019 19:17:51 -0400
Received: from zeniv.linux.org.uk ([195.92.253.2]:40888 "EHLO
        ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfFYXRv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 Jun 2019 19:17:51 -0400
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hfugr-0002az-F9; Tue, 25 Jun 2019 23:17:29 +0000
Date:   Wed, 26 Jun 2019 00:17:29 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm: return -EFAULT if copy_one_buf() fails
Message-ID: <20190625231729.GK17978@ZenIV.linux.org.uk>
References: <20190618125623.GA24896@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618125623.GA24896@mwanda>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 18, 2019 at 03:56:23PM +0300, Dan Carpenter wrote:
> The copy_to_user() function returns the number of bytes remaining to be
> copied, but we want to return -EFAULT.  This function is called from
> __drm_legacy_infobufs() which expects negative error codes.
> 
> Fixes: 5c7640ab6258 ("switch compat_drm_infobufs() to drm_ioctl_kernel()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This goes through Al's tree and not through drm.  Presumably this patch
> will just get folded into the original.

Wha..?  The original has been in mainline since v4.13, so it's a bit too
late to fold anything into it...
