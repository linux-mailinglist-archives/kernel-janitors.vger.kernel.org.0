Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC1C1EC38E
	for <lists+kernel-janitors@lfdr.de>; Tue,  2 Jun 2020 22:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728202AbgFBUQO (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 2 Jun 2020 16:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727794AbgFBUQO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 2 Jun 2020 16:16:14 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73B6C08C5C0
        for <kernel-janitors@vger.kernel.org>; Tue,  2 Jun 2020 13:16:13 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id y123so35846vsb.6
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Jun 2020 13:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=KhsfJG4oCqsoI9GIRhKRpIjrp+9Zk74mdmmp8aCuq2a1hgIQ/UEuenme9wTW2SXfXm
         1/XPNUzOuTTbgBxplftFl0LAjy45v8lJBqTnN2qMlWRC6O+QVF3q+VGOlS6VSxtm8DBB
         qv8HQFKA8f/Dkn6T68mdKjvpc314PmcVLN85M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=l3YgPu8AEPqVYck4aKUWc24ddWkdgB3UbHlcJLj/rly84GDD55n3C5mJUKVao7Gg9o
         930iyhqHtaY/zwEUDZcKxr93eZJT3cZ6rEtQyFVUbkj8sTxD0qVp8ESTbwziPTZRZHQw
         +MablOgQ1tOky3O/sxBVn0X/8Tl2znVxf7lPjMcEHEILe38RHfdf8IlQ8r7AkCU45p4A
         648y6uzKrpnBFdm0vn4SCpWwnvT7y5B4pGPjD/uLKUfo+QuZTowdQV3EFQJz/OkOycBv
         Zp1iv7yXvvmIDAJf/EVW7PXTC2Zqx39rzsNtH00grd7KLbY4K2vtipj7jLYvbt8stAw/
         49dQ==
X-Gm-Message-State: AOAM530QlVQ5gzTrOcZPOtZAUpgU24L8FyLfgF1UeeCkcY5cVcPFn8wf
        sTjw5NVl91OgmKfCWZRNBuyeyk6DUlyzaV0zce1wKA==
X-Google-Smtp-Source: ABdhPJwWxSm48xu2IYedE3HjBxqBh3jhrLAkDus9F6Z+pbc6ymhCS+e1o72yry/mjVZJVupAG6T+jS2ABjv5v1psG+w=
X-Received: by 2002:a67:22c1:: with SMTP id i184mr6737005vsi.119.1591128972715;
 Tue, 02 Jun 2020 13:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200602052104.7795-1-lukas.bulwahn@gmail.com> <828311d2-61ea-42cb-1449-a53f3772543d@roeck-us.net>
In-Reply-To: <828311d2-61ea-42cb-1449-a53f3772543d@roeck-us.net>
From:   Julius Werner <jwerner@chromium.org>
Date:   Tue, 2 Jun 2020 13:16:01 -0700
Message-ID: <CAODwPW_oxDxF_5-icRs0eaRVLgtP+bDc_OSKa=EcfeSp=c6Fag@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: rectify entry in ARM SMC WATCHDOG DRIVER
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Julius Werner <jwerner@chromium.org>,
        Evan Benn <evanbenn@chromium.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Reviewed-by: Julius Werner <jwerner@chromium.org>
