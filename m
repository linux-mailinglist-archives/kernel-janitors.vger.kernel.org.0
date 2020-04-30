Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 550C31BF280
	for <lists+kernel-janitors@lfdr.de>; Thu, 30 Apr 2020 10:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgD3ITD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 30 Apr 2020 04:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgD3ITD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 30 Apr 2020 04:19:03 -0400
X-Greylist: delayed 181 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 30 Apr 2020 01:19:03 PDT
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5300::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A030C035494
        for <kernel-janitors@vger.kernel.org>; Thu, 30 Apr 2020 01:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1588234741;
        s=strato-dkim-0002; d=chronox.de;
        h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=N/X1yHgcAwzpNEaixXj7pjLLUEtCJYiXYX1zXTZkYl8=;
        b=hU+jwibDf6tio92BI7I0THvusA22vHqTbreTYaYtev5ifC4TtLN3P0eH7Qn4N+yR6P
        EHEwihvMf7pfR3wjcDcBlod36vm0fz/Fwc0pLtHCa2r1aQWq+y4gkBdvXppRjtjlkOyZ
        VLtwq3k1oMInSRGgkMOeMHAUce9fJ/jRdQotae87LpyRQfVp/thJctFxRNyUM35Vh6aw
        dbYtmcJOcY0/WC+6GKvAF/zwgngG75gtWflt/an7Uif56C5PcekThWuZBjbLX5w/brzJ
        WB1Ra+LwnVaRpYpcG/s6CfyY+5E+iQ+jfTl7e4dxvpyAuOoqRLQ+TvXLg4z22AygC93S
        uCRw==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzGHXPaJfSfJdtJ"
X-RZG-CLASS-ID: mo00
Received: from tauon.chronox.de
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id u08bf3w3U8FujWg
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 30 Apr 2020 10:15:56 +0200 (CEST)
From:   Stephan Mueller <smueller@chronox.de>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] crypto: drbg - fix error return code in drbg_alloc_state()
Date:   Thu, 30 Apr 2020 10:15:56 +0200
Message-ID: <4688335.RcRiWGvq7B@tauon.chronox.de>
In-Reply-To: <20200430081353.112449-1-weiyongjun1@huawei.com>
References: <20200430081353.112449-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Am Donnerstag, 30. April 2020, 10:13:53 CEST schrieb Wei Yongjun:

Hi Wei,

> Fix to return negative error code -ENOMEM from the kzalloc error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: db07cd26ac6a ("crypto: drbg - add FIPS 140-2 CTRNG for noise source")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  crypto/drbg.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/crypto/drbg.c b/crypto/drbg.c
> index e57901d8545b..37526eb8c5d5 100644
> --- a/crypto/drbg.c
> +++ b/crypto/drbg.c
> @@ -1306,8 +1306,10 @@ static inline int drbg_alloc_state(struct drbg_state
> *drbg) if (IS_ENABLED(CONFIG_CRYPTO_FIPS)) {
>  		drbg->prev = kzalloc(drbg_sec_strength(drbg->core->flags),
>  				     GFP_KERNEL);
> -		if (!drbg->prev)
> +		if (!drbg->prev) {
> +			ret = -ENOMEM;
>  			goto fini;
> +		}
>  		drbg->fips_primed = false;
>  	}

Thank you

Reviewed-by: Stephan Mueller <smueller@chronox.de>

Ciao
Stephan


