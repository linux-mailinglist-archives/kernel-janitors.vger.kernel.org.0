Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88B72190873
	for <lists+kernel-janitors@lfdr.de>; Tue, 24 Mar 2020 10:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgCXJGY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 24 Mar 2020 05:06:24 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43290 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbgCXJGY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Mar 2020 05:06:24 -0400
Received: by mail-lj1-f195.google.com with SMTP id g27so8900855ljn.10
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Mar 2020 02:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uXJW3NYqkzBJPg9G4K5LGYBd3XGQpGvoVNtbcm5Oumc=;
        b=LbrZCbzmZx+Kfb1Pm57HvFHXuRgH444WCs3KnlNJ9YLTcdWzcACe0XYOMLFNxSnkVH
         wN88biDhrK+6HtUJj35VD4dFzg9cGhbGQzAhpXmOrRsqZITX0hTej20qj+VRoR4uNBfZ
         3tUJpYkAFikVpIS6Bp8KePAb0Bq5MOTC1YBDjTrdFWYIi4okAdmrkjf7eH+cDjfvswnY
         eNJfCdKTpTYuGH9iE99z6qcWe86ldjM8DxZknJTAJcGlNvFpAvX0Pfg/dQO7bRVTt3WB
         AbQPQpSOS9CCHsoTsEYTkgwyICLIzP9k6ivxee5YATXOa10Axoo/TbZqZvmtGqKAQxpo
         32Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uXJW3NYqkzBJPg9G4K5LGYBd3XGQpGvoVNtbcm5Oumc=;
        b=ZP6wpJU1QaLZl2mGI30V7JSUVia6wh2PVVV6JE2i03i/MQWeH5frYPYc7Ooifd/jJv
         gHk8lzrWGl377zTlmPJhSHiQCwHoIn91Ef0+LcmpgHiucRFYiNeW+13jwEBTXjzdO3ni
         YpHm5AtimHQ53iCSnCsIgQ2P52Jr5C02RCq4y5uRHJn/FQrCeIzZ4CbAWgCq21l9LoHP
         jlxvFCEpSvrZr65+P2084iFQ1sdJQK/45l6mtmaulbYKN/cCQsCK+P9pUY1VH7yN7IC/
         h5GFml2W0y2ihlVcXk43HlR49djxIkV28cSBr5sAd0mP1oG0zEhC5mY5sMntSRZoru/l
         Fr+A==
X-Gm-Message-State: ANhLgQ3o9ha76oo5/x3LBbQZrFAohXjXe2LNeT524c6JcN+z66uj9194
        oXP83Z/xR8VoqtTgNToZMlmiqkLk5T87iBH8vLepwg==
X-Google-Smtp-Source: ADFU+vsS0Vgh95i3gLQkXN72OAT1r7M91nH8bLgfI97o39Kb3z7Gj4YEOvUgl0V1KX45mkYxQ/82vB1+XBwxrugyzW4=
X-Received: by 2002:a2e:8ecf:: with SMTP id e15mr17140251ljl.223.1585040782184;
 Tue, 24 Mar 2020 02:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200323184501.5756-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200323184501.5756-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 Mar 2020 10:06:10 +0100
Message-ID: <CACRpkdYUURewhao=uDbKOmn2OnhBN6G6qnjUXgN2OBH_w_u2Qw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust entry to ICST clocks YAML schema creation
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Mar 23, 2020 at 7:45 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 78c7d8f96b6f ("dt-bindings: clock: Create YAML schema for ICST
> clocks") transformed arm-integrator.txt into arm,syscon-icst.yaml, but did
> not adjust the reference to that file in the ARM INTEGRATOR, VERSATILE AND
> REALVIEW SUPPORT entry in MAINTAINERS.
>
> Hence, since then, ./scripts/get_maintainer.pl --self-test complains:
>
>   warning: no file matches \
>   F: Documentation/devicetree/bindings/clock/arm-integrator.txt
>
> Update the file entry in MAINTAINERS to the new transformed yaml file.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Thanks!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
