Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1F82FD799
	for <lists+kernel-janitors@lfdr.de>; Wed, 20 Jan 2021 18:58:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728542AbhATR46 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 20 Jan 2021 12:56:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390855AbhATR4c (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 20 Jan 2021 12:56:32 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF87C061786
        for <kernel-janitors@vger.kernel.org>; Wed, 20 Jan 2021 09:55:50 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id v3so14583375qtw.4
        for <kernel-janitors@vger.kernel.org>; Wed, 20 Jan 2021 09:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H362xI0GtWa0hOIoSQ+pekpVy6ezMEffCM7UWNAOymc=;
        b=veCH8tNEKxgqYEzpRP8IcBFLfAMCml/hf44I9sYxqhnjOr10ZOvNISY7A4IJZsawvV
         HCiGOVH7W4/slNrK9mSPMBLcbjWs0yms/XICtsTlYdco9/qMS/xjAeTirOzLycM98iI9
         TBFSqPw2DOSeal6gVNnc01qD1b3MsVPVPrt8NwsU6qV3qr0NT2QQMFTsnO9aeU61kfhn
         Bb77vE/Z9/wQcZzI6/eMit/LVrAx72FIydTRTqcUfkM7Fz+2TAhm2sB/MqsY7OKvVKjp
         WcLwj2cRGgh7/bWbDH6P/Sa7qeY1EOordXmuJcxCTbR09DQKgFG47JO7JyMerl8Hj24v
         Ksxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H362xI0GtWa0hOIoSQ+pekpVy6ezMEffCM7UWNAOymc=;
        b=E0jm7ycisf67S8850imbw/R3+b76Ns9zwHdTQTeuJBFtaX2fpLXU14u0Ra74soWyYU
         6RRvO3iZIqpsJZf+HiiEEtZL7upZUjMz1AK3O9/5vyswSETbaj+YvmQVi9/XOM1j/dnT
         sW1DMsAAtuXZkOwk06sliXuYv8feSpRaDOmHxUnkSQ7ojlfuWRkgB/m54CtOlym8ZwOj
         ccXwH98WxSKQgcv+iQIyMQMLt3XlkO0xWNBhW0Yumf7y6c2UKPe+DaVTY/rdaUjG+Buy
         +PLfFhG6mEQ8r/cpcDAJ57hseRQxSNXO51WTHjSuoGxNsWsVv0iLaFh+zqx2C6tRwrio
         NPEA==
X-Gm-Message-State: AOAM531g9G5pfwrl6eAoLz/G6FWcG7+Gx8yFPiKwOg3SPRFo9sgmoaaH
        s5DbNJqtMAZn+rPIJaEPyTQSsyiYTJFS+CiEqeAYyw==
X-Google-Smtp-Source: ABdhPJyom6O/x/vLdy+hF+kS63EhbC6UqvXwgbwn32Nmb+M6GlijwFxjc32b1qOPGGxqZxd8k9NXhzZfiTIKcBYsx5A=
X-Received: by 2002:a05:622a:14e:: with SMTP id v14mr10088141qtw.298.1611165349302;
 Wed, 20 Jan 2021 09:55:49 -0800 (PST)
MIME-Version: 1.0
References: <20210118113651.71955-1-colin.king@canonical.com> <YAf+o85Z9lgkq3Nw@mwanda>
In-Reply-To: <YAf+o85Z9lgkq3Nw@mwanda>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 20 Jan 2021 20:55:38 +0300
Message-ID: <CAA8EJprP4xm=15Ss540uf0VW1-oXA0Sjr6pmTv_deXvjOqL4tg@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: socinfo: Fix an off by one in qcom_show_pmic_model()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 20 Jan 2021 at 12:58, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> These need to be < ARRAY_SIZE() instead of <= ARRAY_SIZE() to prevent
> accessing one element beyond the end of the array.
>
> Fixes: e9247e2ce577 ("soc: qcom: socinfo: fix printing of pmic_model")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
