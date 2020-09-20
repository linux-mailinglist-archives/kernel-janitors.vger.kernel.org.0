Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8B3271479
	for <lists+kernel-janitors@lfdr.de>; Sun, 20 Sep 2020 15:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgITNX3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 20 Sep 2020 09:23:29 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:35930 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726306AbgITNX3 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 20 Sep 2020 09:23:29 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1kJzJI-0003uI-DV; Sun, 20 Sep 2020 23:23:21 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Sun, 20 Sep 2020 23:23:20 +1000
Date:   Sun, 20 Sep 2020 23:23:20 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Colin King <colin.king@canonical.com>
Cc:     Thomas Graf <tgraf@suug.ch>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rhashtable: fix indentation of a continue statement
Message-ID: <20200920132320.GA769@gondor.apana.org.au>
References: <20200918215126.49236-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918215126.49236-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Sep 18, 2020 at 10:51:26PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> A continue statement is indented incorrectly, add in the missing
> tab.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  lib/test_rhashtable.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
