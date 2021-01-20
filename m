Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6602FDA43
	for <lists+kernel-janitors@lfdr.de>; Wed, 20 Jan 2021 20:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbhATSnJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 20 Jan 2021 13:43:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404523AbhATSdk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 20 Jan 2021 13:33:40 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2200C0613CF
        for <kernel-janitors@vger.kernel.org>; Wed, 20 Jan 2021 10:32:44 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id md11so2703487pjb.0
        for <kernel-janitors@vger.kernel.org>; Wed, 20 Jan 2021 10:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=8c+9ajqGNyuEOzCDkVwNBb94YS/VsoSEZ7DQMmpNsTA=;
        b=I5tYk215vcOaTnqxqDl1qlp4RJxNPrjJycdTL6dIkpVjDgB9CMBLhlo0Pa7NaHGBaC
         osjFLATyMFXIFH2IKRr0oYL5GtljuPhfXhGnatI2dRPSv7bcZYgWhJxGFx7BuesRwXB7
         ocig8bvmAiBB9pvp171SeMfWxTVhAIiDFHjbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=8c+9ajqGNyuEOzCDkVwNBb94YS/VsoSEZ7DQMmpNsTA=;
        b=gMFghoyNzjyQYZWfhwK4w/0KdXCii23It5koKqOkVK8d+fKipkwrBIgVngKA8fFQ0M
         bkkvwlqpSpXHHRMl/Fi2mccj8+pMoqIsHppi2C7mUfHdVoJJjG9k+BuuExBplNjaPvPw
         SWybsfVhUKSEy2N8GM0t9L5xpAzBNy2h1mQhKpfHdjq/2L/NB8sU/b0UtZocJNNszw4j
         kGQ8UpP8lepmn1f+dqATP0c+e1fkRv4ih9s8I79faq3nRehM2sclcX7kWunfMIyYsR/N
         lP7gRcBdwkzuA9tkYpd7cAZh06/77WNbFDBTTHE4YRaNa8wt6bHXtHDm8DVvxFghuikf
         UZDQ==
X-Gm-Message-State: AOAM532Na3Pz8OqjbhsWlijDcdWPqMzoUOGHs4WGQin/E2nFe7yhHYdu
        7Lo/yz2JB1S2o8rXEGQq/SFs+Q==
X-Google-Smtp-Source: ABdhPJwnEgMjqq4KvvEbYOuovvQRQQlTWVHcpeH+sc6TWBydOg6QQQJk2igpk0oqKOx/EerP/YEXBg==
X-Received: by 2002:a17:90a:b010:: with SMTP id x16mr7022862pjq.74.1611167564283;
        Wed, 20 Jan 2021 10:32:44 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id 4sm3408494pjn.14.2021.01.20.10.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 10:32:43 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YAf+o85Z9lgkq3Nw@mwanda>
References: <YAf+o85Z9lgkq3Nw@mwanda>
Subject: Re: [PATCH] soc: qcom: socinfo: Fix an off by one in qcom_show_pmic_model()
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 20 Jan 2021 10:32:41 -0800
Message-ID: <161116756167.3661239.9611045261884718600@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Quoting Dan Carpenter (2021-01-20 01:57:55)
> These need to be < ARRAY_SIZE() instead of <=3D ARRAY_SIZE() to prevent
> accessing one element beyond the end of the array.
>=20
> Fixes: e9247e2ce577 ("soc: qcom: socinfo: fix printing of pmic_model")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
