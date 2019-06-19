Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A50FD4B1BD
	for <lists+kernel-janitors@lfdr.de>; Wed, 19 Jun 2019 07:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbfFSF6U (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 19 Jun 2019 01:58:20 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46479 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbfFSF6U (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Jun 2019 01:58:20 -0400
Received: by mail-wr1-f65.google.com with SMTP id n4so1839808wrw.13
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jun 2019 22:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=v4Lzw69YqCGNT6d2yGg/IWB5HqmTYETWg/4G3e5GhcM=;
        b=E6zaAPAk1Z4K4tmdwrtkSOWC8nlnur95mxOoftmD56qCT5EXSvT6ycZbg/68lt02Db
         ANOwmUrYS8w8CEoIGQyyTc12+p7JBLChyKkAGMBvUm8921rg/86HOIoKnjA/G/R8389n
         OoRBu8SGvOjLJEhFA5uz6sPHwF/dhWNcH3R0aTlwJJfsHcOcmikrhYmCu1usEJe4lyTZ
         xN3ITGXrDBQodz+8qRz101FS4z+SouBbcBG9U+21yiSi6xIqsHcDAxzY3T1rlTCMg0y8
         ZGVDqtC6xipnmbNjTRJy0KVXGSMHUadcSXGoWZ7EkPIigPG06rZDh1hvsXAdJMmzfXJ2
         CxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=v4Lzw69YqCGNT6d2yGg/IWB5HqmTYETWg/4G3e5GhcM=;
        b=rpKFPl3PsQlOwb3DqVSHnUkEo0c47l6Y+R+py06udB4sqm2J3K4e9v2vknNgXjV/gm
         FHrpW/TLaxwKS10nlIpR6DPWl5RyYysATpM5op3AvqA1CFko82734pSkNpTxk4rl61x1
         BhLWeWI0Ne9RhoRpcuQKqpMJ5+Pej0nFnl3ytI7VrpPfgObg7Yde4D/Zf4f5AQ5rI5h5
         UgAGaEKu3c2Y6kbLGpN/OzTnEHdD0Nqno0sRnoTDTVtxYaqKcVnCBzpgRM7lgOUKGwL0
         CjcblfbVAvIn/txQjD7GyF/ijA1b8PSBr19kOwS2/UgY3xnFKL4VS3R2nnMnJA99JIGr
         jmhw==
X-Gm-Message-State: APjAAAVWDIiy0QmNSVTkVdGyvW8GX371YDAxK/02y7ez8L6E780rDhow
        kPomCSlJrcxEaqaUqN4vE5JAqA==
X-Google-Smtp-Source: APXvYqwCLJB9gv/cQEHgS6YpUkbFLxhQLp+LQAxMubEfU+V09+07SkfNFDSXxJ+QjUIfsER9MWzsng==
X-Received: by 2002:a5d:4950:: with SMTP id r16mr39947594wrs.136.1560923898554;
        Tue, 18 Jun 2019 22:58:18 -0700 (PDT)
Received: from dell ([2.27.35.243])
        by smtp.gmail.com with ESMTPSA id o126sm592028wmo.1.2019.06.18.22.58.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 22:58:18 -0700 (PDT)
Date:   Wed, 19 Jun 2019 06:58:16 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mfd: stmfx: Fix an endian bug in stmfx_irq_handler()
Message-ID: <20190619055816.GF18371@dell>
References: <CAHk-=wgTL5sYCGxX8+xQqyBRWRUE05GAdL58+UTG8bYwjFxMkw@mail.gmail.com>
 <20190617190605.GA21332@mwanda>
 <20190618081645.GM16364@dell>
 <CAHk-=wghW+AKvRGevUiVWwTqWObygSZSdq6Dz2ad81H73VeuRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wghW+AKvRGevUiVWwTqWObygSZSdq6Dz2ad81H73VeuRQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 18 Jun 2019, Linus Torvalds wrote:

> On Tue, Jun 18, 2019 at 1:16 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > > Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> >
> > Ideally we can get a review too.
> 
> Looks fine to me, but obviously somebody should actually _test_ it too.

Amelie, would you be so kind?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
