Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64FB41E387A
	for <lists+kernel-janitors@lfdr.de>; Wed, 27 May 2020 07:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbgE0FtX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 27 May 2020 01:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgE0FtW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 27 May 2020 01:49:22 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F23DBC03E96F
        for <kernel-janitors@vger.kernel.org>; Tue, 26 May 2020 22:49:20 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z18so27346873lji.12
        for <kernel-janitors@vger.kernel.org>; Tue, 26 May 2020 22:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Ey3RUpCGa5Aox52KZ5G497GPuu8CFMaGOEj0YfbRCE=;
        b=IHURO0exP8ThsysvtvUVDN5cTBjZW1A5ogekeUUqLNeYB2FGz4d/s/pWf9IREZvWh9
         6f3oUSCkM5uanpvYDqHX3Mm1dW6YEvprJ2NdjOmDgkcMox49wszIokbgRyhNb/ash0mu
         qYG2m30mWdIbE6HauFvsy7lUAeG0MY1Cm+vBQsDVjJpR9COGe8J5mWSqMVoOZlsvr2IP
         oU15BvzZaVmPzyM5p78RnO4P8b+XQ8wJv69PMeJ0ggxtY8eq28DwZ3LeT+ptx8vU9z0A
         KVTOsFtyrGmTzfq1xSBTHeSDuo80Ah7EpSzJJflNND68IyDuCgHx9iUdQKy9CgFuAM0I
         +6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Ey3RUpCGa5Aox52KZ5G497GPuu8CFMaGOEj0YfbRCE=;
        b=YDz6+X6Q9BAPO/5E2IvZEpCuFwVPjldnswFwJnF+d/ojgGxXAkUiRCyiuadIB3IXrt
         8ec/2wnvkm0CRRzdxXOoWJ038kzb+H8aJS+GiuHFWtOnyVZv/AbYw0BV87sL7W5+0fbr
         fzVSOQxkWg3HyyvRhVUzVONjlI/sdtGOxgGsuETPWBdHRWGZ1fWXiGiZqrMF+ZEi2hjS
         wB+dUThZemae+QL3cpBg3OPXVnwo4bOV0NIVAuBL3QjK0ZFeLj1qNpI/VMe1OpTqMOhr
         NuFgiM5SMx9GPQhMypKnfGBnE22M90PwiK2Mseq8KFz7o3bvkBQd9hXs0b+Pom69mZOO
         AJDg==
X-Gm-Message-State: AOAM5318GQLfHjRASMM49Y0k24MyPEQdN0f7NOMior3Zg7TfwMn94Wg3
        88wssVisvKydrY1qcvUaCgNS5PQ5cnrBKl6gwOCXGQ==
X-Google-Smtp-Source: ABdhPJwnO7GDTOtyL2kiFe3jVfkqBAg7nq2J7SDhBgiLgtUefNePgtYaoje9dfB2Zk33EfyfNamq1jgS7Fz6Jg4SKys=
X-Received: by 2002:a2e:8e91:: with SMTP id z17mr2117948ljk.144.1590558559281;
 Tue, 26 May 2020 22:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200526224116.63549-1-colin.king@canonical.com>
In-Reply-To: <20200526224116.63549-1-colin.king@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 May 2020 07:49:08 +0200
Message-ID: <CACRpkdb7s77aOnQxMQ=Gi9zcy_fz37PZ5E3+vk0=P5N8wjA6sw@mail.gmail.com>
Subject: Re: [PATCH] clk: versatile: remove redundant assignment to pointer clk
To:     Colin King <colin.king@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, May 27, 2020 at 12:41 AM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The pointer clk is being initialized with a value that is never read
> and is being updated with a new value later on. The initialization
> is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
