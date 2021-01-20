Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E8E2FD59F
	for <lists+kernel-janitors@lfdr.de>; Wed, 20 Jan 2021 17:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391466AbhATQ1Y (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 20 Jan 2021 11:27:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404050AbhATQ0v (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 20 Jan 2021 11:26:51 -0500
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8805C0613CF
        for <kernel-janitors@vger.kernel.org>; Wed, 20 Jan 2021 08:26:10 -0800 (PST)
Received: by mail-vk1-xa30.google.com with SMTP id f3so1722398vkf.5
        for <kernel-janitors@vger.kernel.org>; Wed, 20 Jan 2021 08:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VA3sevNOG9LLzIdGtexh/+cDQStXz1NVLJUbTaa/OpI=;
        b=XqHtcC1Cu+MW2ZiMfGVlGOQfR0LPyWWzi5zKLqS01utd6G69mhKg9C0CV4ZI0McEbv
         CSg7aZXht+OcOyeAmNPQMaBsN2VzhaPNVYuP5qT4pckI9GKBN60qMdtolLmElgTe5Xol
         633w5+Z4SJCMYCOPmES8Zy3+SQdgwmdr/qrXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VA3sevNOG9LLzIdGtexh/+cDQStXz1NVLJUbTaa/OpI=;
        b=bdpz2XZ3BF/eYzszkF3vjmTGss1WAGOEF6fNAD22FSkCdJOzVLhOrFSsA73uX/DmUW
         WBxbhqWdWwT2sWaVcwwxsjCS0ZQAt2JSoJ7TqNtDToJPhnj2lzyhODoDeoJWukN41Lp1
         5cWUem5YN2Zt5WuCI85mwQCTZ1q4o3ZOQfUx6oY/1LZaWo2Dsa5keTFy0pe1V+K2Etsg
         z4MILicPDKfT8SYsAyBZtT+mVoa8E7YdymwVZOrjox0U4FVhG4ttc/w32QIs//X8zomn
         J0vreFje+GJ3ani9z4ibtr6VL1Iwsbxf0MGq2SV3Solf5ABqoyzAbL6eI6g9KgNOavFz
         hGxw==
X-Gm-Message-State: AOAM533ZPaDVwtQzEFgxSDNMZWxwxQEu/P/B91cElzFnUi+zu/A2JMdf
        jknFYRw1Nub8uieO9+vTKiTyrfYNQ8LReg==
X-Google-Smtp-Source: ABdhPJzPKaD9Lr0iIymcElAW4UrpeTEM/8GL4VbNyViGrTycuCos+QyWwO6f8MeU7AT9Fqj8BzK9LA==
X-Received: by 2002:a1f:9e83:: with SMTP id h125mr7655598vke.18.1611159969691;
        Wed, 20 Jan 2021 08:26:09 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id b20sm87802vsr.31.2021.01.20.08.26.07
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jan 2021 08:26:08 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id g13so576620uaw.5
        for <kernel-janitors@vger.kernel.org>; Wed, 20 Jan 2021 08:26:07 -0800 (PST)
X-Received: by 2002:ab0:6454:: with SMTP id j20mr6909033uap.0.1611159967277;
 Wed, 20 Jan 2021 08:26:07 -0800 (PST)
MIME-Version: 1.0
References: <20210118113651.71955-1-colin.king@canonical.com> <YAf+o85Z9lgkq3Nw@mwanda>
In-Reply-To: <YAf+o85Z9lgkq3Nw@mwanda>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 20 Jan 2021 08:25:54 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XMxHCs5bvjPGjENL2Sty=AD6CS3jYnESDG+qKJdiMU+Q@mail.gmail.com>
Message-ID: <CAD=FV=XMxHCs5bvjPGjENL2Sty=AD6CS3jYnESDG+qKJdiMU+Q@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: socinfo: Fix an off by one in qcom_show_pmic_model()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On Wed, Jan 20, 2021 at 1:58 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> These need to be < ARRAY_SIZE() instead of <= ARRAY_SIZE() to prevent
> accessing one element beyond the end of the array.
>
> Fixes: e9247e2ce577 ("soc: qcom: socinfo: fix printing of pmic_model")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/soc/qcom/socinfo.c | 2 +-
>  1 file changed, 1 insertions(+), 1 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
