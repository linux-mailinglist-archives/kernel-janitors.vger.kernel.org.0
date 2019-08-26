Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 111EB9CFF9
	for <lists+kernel-janitors@lfdr.de>; Mon, 26 Aug 2019 15:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbfHZNBy (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 26 Aug 2019 09:01:54 -0400
Received: from smtp.domeneshop.no ([194.63.252.55]:60360 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfHZNBy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Aug 2019 09:01:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org; s=ds201810;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=H3jtYoxQ3XbExd4HXxnlQvVgu8Q+804xJ3Zv6QomKsc=;
        b=QcPt9n10uj1n1YO1WbjMh9PgJkNhqP834sq4Y+F1CcoMwuV3L1/USnK95lBTe/rYf9AfQ6ICYnr5E9Zp8bZijzp6A6F4/92fmKGaBw+SJ7jtFwSD3JYXpkEmt9M4SKQ9FPib8x9ZjTotjBUn3O0GGqJAL4Pprfk1Dn4iAgQkbmFvWmkwvoFQ/KIMI46fNSyF0gXSRV0ytrNsRephR8hKeHNUGwdjBINyMtKFll8qtWVlTtPp1sRdEu60y4Goh3RAzT5A8RtTqf/P4rMzhcK/mDPxRhhsb0OSO8pRLwxowa4uIuLkYnDVNVaGoBrJIh3IGBAkNyYLiRmJTe6E4KcHsQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:57660 helo=[192.168.10.173])
        by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.84_2)
        (envelope-from <noralf@tronnes.org>)
        id 1i2Ed5-0003H5-Vb; Mon, 26 Aug 2019 15:01:51 +0200
Subject: Re: [PATCH] drm/tinydrm: fix a loop in debugfs code
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20190821072456.GJ26957@mwanda>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <9718fea0-49f0-34d4-b1fc-f69e99b7a690@tronnes.org>
Date:   Mon, 26 Aug 2019 15:01:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821072456.GJ26957@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



Den 21.08.2019 09.24, skrev Dan Carpenter:
> This code will likely crash if we try to do a zero byte write.  The code
> looks like this:
> 
>         /* strip trailing whitespace */
>         for (i = count - 1; i > 0; i--)
>                 if (isspace(buf[i]))
> 			...
> 
> We're writing zero bytes so count = 0.  You would think that "count - 1"
> would be negative one, but because "i" is unsigned it is a large
> positive numer instead.  The "i > 0" condition is true and the "buf[i]"
> access will be out of bounds.
> 
> The fix is to make "i" signed and now everything works as expected.  The
> upper bound of "count" is capped in __kernel_write() at MAX_RW_COUNT so
> we don't have to worry about it being higher than INT_MAX.
> 
> Fixes: 02dd95fe3169 ("drm/tinydrm: Add MIPI DBI support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Thanks Dan, applied to drm-misc-next with adjusted title:
-drm/tinydrm: fix a loop in debugfs code
+drm/mipi-dbi: fix a loop in debugfs code

Noralf.
