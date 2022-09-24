Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6503F5E8A10
	for <lists+kernel-janitors@lfdr.de>; Sat, 24 Sep 2022 10:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233859AbiIXITC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 24 Sep 2022 04:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233878AbiIXISa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 24 Sep 2022 04:18:30 -0400
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83C1521821;
        Sat, 24 Sep 2022 01:17:12 -0700 (PDT)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
        by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1oc0LV-007wdr-6v; Sat, 24 Sep 2022 18:17:10 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Sat, 24 Sep 2022 16:17:09 +0800
Date:   Sat, 24 Sep 2022 16:17:09 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-crypto@vger.kernel.org, Robert Elliott <elliott@hpe.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: revert unintended config addition of
 CRYPTO_BLAKE2S
Message-ID: <Yy69BWxyGPK5MUli@gondor.apana.org.au>
References: <20220914083827.18939-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914083827.18939-1-lukas.bulwahn@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 14, 2022 at 10:38:27AM +0200, Lukas Bulwahn wrote:
> Commit 2d16803c562e ("crypto: blake2s - remove shash module") removes the
> config CRYPTO_BLAKE2S.
> 
> Commit 3f342a23257d ("crypto: Kconfig - simplify hash entries") makes
> various changes to the config descriptions as part of some consolidation
> and clean-up, but among all those changes, it also accidently adds back
> CRYPTO_BLAKE2S after its removal due to the original patch being based on
> a state before the CRYPTO_BLAKE2S removal.
> 
> See Link for the author's confirmation of this happening accidently.
> 
> Link: https://lore.kernel.org/all/MW5PR84MB18424AB8C095BFC041AE33FDAB479@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM/
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  crypto/Kconfig | 21 ---------------------
>  1 file changed, 21 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
