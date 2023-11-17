Return-Path: <kernel-janitors+bounces-315-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E887EF1AC
	for <lists+kernel-janitors@lfdr.de>; Fri, 17 Nov 2023 12:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8B9F1C20A63
	for <lists+kernel-janitors@lfdr.de>; Fri, 17 Nov 2023 11:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1496C2FE30;
	Fri, 17 Nov 2023 11:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED7DD5F;
	Fri, 17 Nov 2023 03:24:12 -0800 (PST)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1r3wx5-000dL3-JK; Fri, 17 Nov 2023 19:24:00 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 17 Nov 2023 19:24:07 +0800
Date: Fri, 17 Nov 2023 19:24:07 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ciunas Bennett <ciunas.bennett@intel.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Adam Guerin <adam.guerin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Damian Muszynski <damian.muszynski@intel.com>,
	Tom Zanussi <tom.zanussi@linux.intel.com>,
	Shashank Gupta <shashank.gupta@intel.com>,
	Tero Kristo <tero.kristo@linux.intel.com>, qat-linux@intel.com,
	linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] crypto: qat - prevent underflow in rp2srv_store()
Message-ID: <ZVdNV87FWjlCmHYf@gondor.apana.org.au>
References: <3fb31247-5f9c-4dba-a8b7-5d653c6509b6@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fb31247-5f9c-4dba-a8b7-5d653c6509b6@moroto.mountain>

On Tue, Oct 31, 2023 at 11:58:32AM +0300, Dan Carpenter wrote:
> The "ring" variable has an upper bounds check but nothing checks for
> negatives.  This code uses kstrtouint() already and it was obviously
> intended to be declared as unsigned int.  Make it so.
> 
> Fixes: dbc8876dd873 ("crypto: qat - add rp2svc sysfs attribute")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/crypto/intel/qat/qat_common/adf_sysfs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

