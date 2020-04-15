Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA9801A990A
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 Apr 2020 11:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895623AbgDOJeq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 15 Apr 2020 05:34:46 -0400
Received: from mail.skyhub.de ([5.9.137.197]:48220 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2895613AbgDOJeo (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Apr 2020 05:34:44 -0400
Received: from zn.tnic (p200300EC2F095B00CCE44E2D0BBEAA22.dip0.t-ipconnect.de [IPv6:2003:ec:2f09:5b00:cce4:4e2d:bbe:aa22])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 688AF1EC023E;
        Wed, 15 Apr 2020 11:34:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1586943280;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=nK8dvKIqVYUhAJd6oqKW6VjurEo84N9556yRIds465Q=;
        b=JvK+aVzGoildkCKgeNpB3lnEIbz1LdtyX6ndyihNEipz6zFuNvzEo2bBYx2GJRt6usUCik
        9Onmjyjy2H0ucWMKvhLGq8odEtnQO+vzkjf5PPlr2xNQgChydpTZOXK4qu/WjiJJTP1agP
        iUepE5JMT9QxaETXcNEK7LAoCwzt5lw=
Date:   Wed, 15 Apr 2020 11:34:35 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Christoph Hellwig <hch@lst.de>, Borislav Petkov <bp@suse.de>,
        Yash Shah <yash.shah@sifive.com>, linux-edac@vger.kernel.org,
        Sebastian Duda <sebastian.duda@fau.de>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] MAINTAINERS: place sifive_l2_cache.c only in SIFIVE
 DRIVERS
Message-ID: <20200415093435.GC31016@zn.tnic>
References: <20200413115255.7100-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200413115255.7100-1-lukas.bulwahn@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Apr 13, 2020 at 01:52:55PM +0200, Lukas Bulwahn wrote:
> Commit 9209fb51896f ("riscv: move sifive_l2_cache.c to drivers/soc") moved
> arch/riscv/mm/sifive_l2_cache.c to drivers/soc/sifive/sifive_l2_cache.c
> and adjusted the MAINTAINERS EDAC-SIFIVE entry but slipped in a mistake.
> 
> Since then, ./scripts/get_maintainer.pl --self-test complains:
> 
>   warning: no file matches F: drivers/soc/sifive_l2_cache.c
> 
> Boris suggested that sifive_l2_cache.c is considered part of the SIFIVE
> DRIVERS, not part of EDAC-SIFIVE. So, we can simply drop this entry, and
> by the sifive keyword pattern in SIFIVE PATTERNS, it is automatically part
> of the SIFIVE DRIVERS.
> 
> Suggested-by: Borislav Petkov <bp@alien8.de>
> Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
> Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
