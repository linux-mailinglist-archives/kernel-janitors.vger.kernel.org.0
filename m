Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D032026F886
	for <lists+kernel-janitors@lfdr.de>; Fri, 18 Sep 2020 10:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgIRIky (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 18 Sep 2020 04:40:54 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:57838 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726201AbgIRIkx (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Sep 2020 04:40:53 -0400
X-Greylist: delayed 4302 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 04:40:53 EDT
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1kJApN-0003WP-4u; Fri, 18 Sep 2020 17:29:06 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Sep 2020 17:29:05 +1000
Date:   Fri, 18 Sep 2020 17:29:05 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Tero Kristo <t-kristo@ti.com>, Keerthy <j-keerthy@ti.com>,
        linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] crypto: sa2ul - Fix pm_runtime_get_sync() error checking
Message-ID: <20200918072904.GE23319@gondor.apana.org.au>
References: <20200909094528.GB420136@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909094528.GB420136@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 09, 2020 at 12:45:28PM +0300, Dan Carpenter wrote:
> The pm_runtime_get_sync() function returns either 0 or 1 on success but
> this code treats a return of 1 as a failure.
> 
> Fixes: 7694b6ca649f ("crypto: sa2ul - Add crypto driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/crypto/sa2ul.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
