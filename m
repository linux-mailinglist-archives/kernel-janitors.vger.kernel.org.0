Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97E9C5BA7C8
	for <lists+kernel-janitors@lfdr.de>; Fri, 16 Sep 2022 10:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbiIPIHn (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 16 Sep 2022 04:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbiIPIHc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 16 Sep 2022 04:07:32 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C53C402DD
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Sep 2022 01:07:28 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso928922pjq.1
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Sep 2022 01:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=efUD2Cuze1s5fu9A1+CyDLPrdcU/1Kt0bMyNsDXEONY=;
        b=Jn15m+vFx5hwwmK/xwXR0sCWR0XgV3QsV7ccaNanOuS/M5Ti8PPipPZMdKd5Y+zJPm
         GgXlNWlpvOr8dd+Nb4+atVVBoPlkS/Z0RcXfqXlur5FPEaxE9Aot2NLQkXBkqR5fxknU
         qcmU1d4BLDOM6yeo8L7ir66kaxwPHgSV4WzQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=efUD2Cuze1s5fu9A1+CyDLPrdcU/1Kt0bMyNsDXEONY=;
        b=OpbTQURf/f84fNMtDuaX2bM1zLR1S9SAToblXD2WUPxrKeRGxjM0P9Rs6GLIAmsb8/
         w6XNZezs/wsWdAuHnVSI1hvQS6aeHPUYHS5KdeG23cGr3Tk42XzphbXrXoU3yZYszZEm
         zhWQNgXVTWthKLaXLPo9IdKFl8QMgUMlC4Vqw+qX0zPOikiSqpBGjMHHXXzi4WyNGRMq
         D8SqB/dUUzn2H1Atjvcs/0eLHARKe2QoQYVhUT9gycVMkoc19PAxh60Z8Drc/K5lm4pO
         DmTcf6my8TJaJTg/XpPxXCnFl3I2bVFE0DX3pUZ0BRVSQ8j/WYhNuBVBeTK2By5WukUI
         m+Vg==
X-Gm-Message-State: ACrzQf3jaCwh/pRpRe4nddS83lqEGv5Uta+sh2YCUQEGImfoVjApIQFZ
        f4zNI4ecJRBhF4JInOKaRuuZ1A==
X-Google-Smtp-Source: AMsMyM4/znlazRwzEOVAPXReEX1A/RlzXSzwHTL4q0v6nu4NImq0p3KAUU2ExLKgahX4HV+lsKBNJA==
X-Received: by 2002:a17:90b:3a8e:b0:200:5585:4099 with SMTP id om14-20020a17090b3a8e00b0020055854099mr15554975pjb.70.1663315647392;
        Fri, 16 Sep 2022 01:07:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e1-20020a17090301c100b0017828ae6310sm11876407plh.2.2022.09.16.01.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 01:07:26 -0700 (PDT)
Date:   Fri, 16 Sep 2022 01:07:25 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: harden i2c_mux_alloc() against integer
 overflows
Message-ID: <202209160101.2A240E9@keescook>
References: <YyMM8iVSHJ4ammsg@kili>
 <YyMt2cWtHC2SeG62@work>
 <YyMyKQnWgu0SL6jj@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyMyKQnWgu0SL6jj@kadam>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 15, 2022 at 05:09:45PM +0300, Dan Carpenter wrote:
> It would probaby be useful to mark passed data as explicitly unsafe for
> integer overflows.  Smatch already tracks user data.  And if the user
> data has been capped to an unknown value.  But this would be a
> completely separate flag which says that "this value came from
> size_add/mul()".

I really want a __must_check_type(size_t) attribute or something for
functions, so we can get a subset of -Wconversion warnings, etc.

> drivers/char/tpm/eventlog/tpm2.c:57 tpm2_bios_measurements_start() warn: using integer overflow function 'size_add()' for math
> [...]
> drivers/net/ethernet/intel/ice/ice_flex_pipe.c:2070 ice_pkg_buf_reserve_section() warn: using integer overflow function 'size_mul()' for math

I see size_add() and size_mul() here. I would have expected some
size_sub() opportunities too? Did nothing pop out?

-- 
Kees Cook
