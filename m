Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B55451B0714
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Apr 2020 13:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgDTLN0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 20 Apr 2020 07:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725775AbgDTLN0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 Apr 2020 07:13:26 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2736EC061A0C
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Apr 2020 04:13:25 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id k9so8365995oia.8
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Apr 2020 04:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LKDk9BXhmmw6UQhdLQhRwkwvw4jE2jlH8lx/DDgDCzo=;
        b=kWy8oIXuHQNGrtCjK0rrKc2NvGIR5RPPcuxpJch5SNyUG8LaR8Agr6h4t/4eWOHQVW
         j8K6qeOAa1tPjodzFGsJGizIm3ZAWoBaFIVvEosR/DcSqxCNKjpW7RGVpFH6l8wiU/ID
         PqQsNdq3F2Szw+yXrj/0boev0L18oe4WvuWsc+BRubNcI7urzZi6VX4fjvqJib19Et5W
         RLZrF3ZgeollvisHlmXatQXTQMztyNgsH28K9FV+mEbyNmaAG4Ur8mnn+a29emKjjrgT
         VuIGJpchCrawppRfoDiXg/djtsRPBrZhwfWTpdpcMR7rD/tQp6mklgK4S+J7ibnwWEwM
         1X5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LKDk9BXhmmw6UQhdLQhRwkwvw4jE2jlH8lx/DDgDCzo=;
        b=MxSg4tBcimCIEw8y67jfinywXsv8BqH6/vgR9jjjxibyXtLan70B43R6cwqU0IV6Ne
         GEVwirW6Zq81Dy+aqn37ZQw9qQxpL3OuNOupFR5zPouvAJSFiniyWNvRg6t18OkqxTkW
         MdQYLljN2D+C/zsq35hpjZB1exZI2U5MMhK58PohmsmpPP0blpypfIaaepuK/AAjnTG9
         5dtFxDibXpG3rYDGlPVSA1K7e7mVeCVOZ9oUg8RnEFdN8BABbQV2HWdRn4z9oh1x7jJI
         3Kp7AbqBmgFmIBc5Pxnn5GGPLgjTUMBBO6dqEsODKiK7usdWEVuUe7MoO975jHRH2/Rd
         OIPQ==
X-Gm-Message-State: AGi0PuYUMpbvuDF024DZInK3T49A8phjvXU++dULd82FCYRuMBy3V2Pa
        fgqBB2WYE+IFxGxeiykSNiwnWOtfe0XVRFDaNOJJuSBs
X-Google-Smtp-Source: APiQypKqVZfNV+ZlKRuRRKGguogqgBgg8cleU6xdj4RriUBcB9dPP3Tp2N2CBRX+A2aa5RPo2PoCwbAuJp4BiK0nNd4=
X-Received: by 2002:aca:d50c:: with SMTP id m12mr10490540oig.149.1587381204561;
 Mon, 20 Apr 2020 04:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200407093028.GK68494@mwanda>
In-Reply-To: <20200407093028.GK68494@mwanda>
From:   Jens Wiklander <jens.wiklander@linaro.org>
Date:   Mon, 20 Apr 2020 13:13:13 +0200
Message-ID: <CAHUa44FJZtFpj2FcaYOBShMU5yjXfQmoVe3wJXemnTFDfRsD_Q@mail.gmail.com>
Subject: Re: [PATCH] tee: remove unnecessary NULL check in tee_shm_alloc()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "tee-dev @ lists . linaro . org" <tee-dev@lists.linaro.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Apr 7, 2020 at 11:32 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Smatch complains that "ctx" isn't checked consistently:
>
>     drivers/tee/tee_shm.c:164 tee_shm_alloc()
>     warn: variable dereferenced before check 'ctx' (see line 95)
>
> I audited the callers and "ctx" can't be NULL so the check can be
> removed.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/tee/tee_shm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Thanks, I'm picking this up.

Cheers,
Jens
