Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B273F7B43AD
	for <lists+kernel-janitors@lfdr.de>; Sat, 30 Sep 2023 22:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbjI3U5S (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 30 Sep 2023 16:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231197AbjI3U5Q (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 30 Sep 2023 16:57:16 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0267CF
        for <kernel-janitors@vger.kernel.org>; Sat, 30 Sep 2023 13:57:14 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1c724577e1fso52327025ad.0
        for <kernel-janitors@vger.kernel.org>; Sat, 30 Sep 2023 13:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696107434; x=1696712234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F8ShV6E/8QsJOCzMhx8IRO8TVLv4FnaEtvtGItg5wE4=;
        b=cZxRnjs8xuLe22cyUvJKz48zZ5sPRdbdfhyzq0BhREf8IvBWNBPqtoPu7mW8mTNoyS
         eHQpHlytoAy+PUhOgmr2UIRIL1X/MsCvfcj5ghkT5XLG7h7hYAV9buucE/BvVC6+ERPR
         UDs59KQ5ia3ikpBcm8LMWfuNLypcd6LfCyh4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696107434; x=1696712234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8ShV6E/8QsJOCzMhx8IRO8TVLv4FnaEtvtGItg5wE4=;
        b=K1EveLNiuncyKmh8Wmxnq+50/lwg1BVF/z1eng5IU32T8T6oh4s8gYA81ETIVVTFWy
         lRC/m/V406MBMbjtPjhhz84OHqVm/ZsLo3rfATugiVzfZIkHexvA3iy9HWClrR6KtDQw
         6qv6uh35aZ+5dtQAVp+Qh57AciJHwaGcU55937BXahXhMwbVfSAXoqtbiR5cPbpk7mOU
         IJuSKYg79citPaOVG+bhNCifsybyWJrqamo8e+3X1fKKS4+yrE73FCmM3xklRfcXvqcC
         JQcLcEQPNG0KNCTVpiKr6TZdUBouktlDwVCrwLmhc0KN8+XfHG8LNg2W9W6nStK7BBiC
         lD5g==
X-Gm-Message-State: AOJu0YxVEwanDD3WYZjcSQWeKjQfzjzxwloJAnBc5jxoEUaXX5veQJYU
        T1PeJdJUsHg4p0hm3qcBfgbQC9KekkR31IU+2Nk=
X-Google-Smtp-Source: AGHT+IF0qsPtMg/V1LWALu0KMhdTxitqAJp89szdV7WijDpDZ83pa5U+dzDtHVCD8w4avxADg/CUcw==
X-Received: by 2002:a17:903:1247:b0:1bf:8779:e045 with SMTP id u7-20020a170903124700b001bf8779e045mr9024419plh.50.1696107434169;
        Sat, 30 Sep 2023 13:57:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b12-20020a170903228c00b001bbb7af4963sm19102341plh.68.2023.09.30.13.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 13:57:13 -0700 (PDT)
Date:   Sat, 30 Sep 2023 13:57:09 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Ian Abbott <abbotti@mev.co.uk>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-hardening@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH] comedi: Annotate struct comedi_lrange with __counted_by
Message-ID: <202309301342.5B5BED40A1@keescook>
References: <5c3b7459b820e22e2ac6ce892d4aadcc119cc919.1696065263.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c3b7459b820e22e2ac6ce892d4aadcc119cc919.1696065263.git.christophe.jaillet@wanadoo.fr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Sep 30, 2023 at 11:14:47AM +0200, Christophe JAILLET wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is part of a work done in parallel of what is currently worked
> on by Kees Cook.
> 
> My patches are only related to corner cases that do NOT match the
> semantic of his Coccinelle script[1].

Nice!

struct comedi_lrange {
        int length;
        struct comedi_krange range[];
};
...
static const struct comedi_lrange range_rti800_ai_10_bipolar = {
        4, {
                BIP_RANGE(10),
                BIP_RANGE(1),
                BIP_RANGE(0.1),
                BIP_RANGE(0.02)
        }
};

I'm struggling to come up with a way for Coccinelle to find this kind of
thing in other places...

> In this case, it is been spotted because of comedi_alloc_spriv().
> All other usages of struct comedi_lrange seem to be static definition of
> the structure that explicitly set the .length field.

Ah-ha, I found it in drivers/comedi/drivers/das16.c das16_ai_range():

                lrange = comedi_alloc_spriv(s,
                                            struct_size(lrange, range, 1));

I was also able to find this:

union jr3_pci_single_range {
        struct comedi_lrange l;
        char _reserved[offsetof(struct comedi_lrange, range[1])];
};

Which looks a lot like DEFINE_FLEX:
https://lore.kernel.org/linux-hardening/20230912115937.1645707-2-przemyslaw.kitszel@intel.com/
But that above for stack varaibles rather than globals. But I'm way off
topic now. ;)

Reviewed-by: Kees Cook <keescook@chromium.org>

> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> ---
>  include/linux/comedi/comedidev.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/comedi/comedidev.h b/include/linux/comedi/comedidev.h
> index 0a1150900ef3..c08416a7364b 100644
> --- a/include/linux/comedi/comedidev.h
> +++ b/include/linux/comedi/comedidev.h
> @@ -633,7 +633,7 @@ extern const struct comedi_lrange range_unknown;
>   */
>  struct comedi_lrange {
>  	int length;
> -	struct comedi_krange range[];
> +	struct comedi_krange range[] __counted_by(length);
>  };
>  
>  /**
> -- 
> 2.34.1
> 

-- 
Kees Cook
