Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53EC019CF7C
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 Apr 2020 06:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387945AbgDCEmm (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 3 Apr 2020 00:42:42 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:51582 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725851AbgDCEmR (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 Apr 2020 00:42:17 -0400
Received: from gwarestrin.me.apana.org.au ([192.168.0.7] helo=gwarestrin.arnor.me.apana.org.au)
        by fornost.hmeau.com with smtp (Exim 4.89 #2 (Debian))
        id 1jKE9U-00076f-JE; Fri, 03 Apr 2020 15:41:57 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 03 Apr 2020 15:41:56 +1100
Date:   Fri, 3 Apr 2020 15:41:56 +1100
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Colin King <colin.king@canonical.com>
Cc:     Boris Brezillon <bbrezillon@kernel.org>,
        Arnaud Ebalard <arno@natisbad.org>,
        Srujana Challa <schalla@marvell.com>,
        "David S . Miller" <davem@davemloft.net>,
        Lukasz Bartosik <lbartosik@marvell.com>,
        linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] crypto: marvell: fix double free of ptr
Message-ID: <20200403044156.GB26315@gondor.apana.org.au>
References: <20200401231012.407946-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401231012.407946-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Apr 02, 2020 at 12:10:12AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently in the case where eq->src != req->ds, the allocation of
> ptr is kfree'd at the end of the code block. However later on in
> the case where enc is not null any of the error return paths that
> return via the error handling return path end up performing an
> erroneous second kfree of ptr.
> 
> Fix this by adding an error exit label error_free and only jump to
> this when ptr needs kfree'ing thus avoiding the double free issue.
> 
> Addresses-Coverity: ("Double free")
> Fixes: 10b4f09491bf ("crypto: marvell - add the Virtual Function driver for CPT")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/crypto/marvell/octeontx/otx_cptvf_algs.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
