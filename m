Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A66C77EEB
	for <lists+kernel-janitors@lfdr.de>; Sun, 28 Jul 2019 12:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbfG1KA2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 28 Jul 2019 06:00:28 -0400
Received: from mail-lf1-f47.google.com ([209.85.167.47]:41207 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfG1KA2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 28 Jul 2019 06:00:28 -0400
Received: by mail-lf1-f47.google.com with SMTP id 62so35093852lfa.8
        for <kernel-janitors@vger.kernel.org>; Sun, 28 Jul 2019 03:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M5pBCLZQz90BrGcUD2I4KEUNjM1YGzNjZn8GbrFYE54=;
        b=s4gmEPa+MSse8G/JQ3TVW6Wq7NmcNzaUl6/rZymOwbWBLSQqL7jA2FDZWocTsV0eB2
         wIX0YfUEq2E8JUVl3WCTfiAZmRXRl/gzyDQM84i8T3B92WOTOUhZ21dJk/M97mXx4apw
         tMYrxvXJibhZCztKD2Rj/8Hc/OfA4YajHY1W9D/D6nTmUsRBnvf2MaiVaaPzPcVu1Br/
         0wU4J/K+Zxia5WR307Lbl0o6efQ0liqjW6dT/Pi6i2qYtfrZFGOaY8tgEZFBvHpDSJDl
         8RYHkXfsufIYgIQEnZPcpAk04Q6AQnQfT+plBspfWyZlrAScyYsR6gWGgN+sZVUqv6dj
         Ug7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M5pBCLZQz90BrGcUD2I4KEUNjM1YGzNjZn8GbrFYE54=;
        b=pr0Mh0ltey55Htw0j/SjTb06lwSsLRDFLw7DgZhugRmegEOeOGwfHKFhcHWNGbkoOQ
         20ru+ot8igZFyhzfTMeXwhGgbVFHpR0h4F8IxdANXp3RQGfQUyppmkBmXv7vfqxOMk+5
         b3Xc4jF4bvYFuXp/rBLdQA0tvv/GwhihCp6Dnl2dCiWZojQe/rHbwPTC+JN+M4QhDvOS
         3Jy4ZZJpasXq6qKL/VPYLBg99wUWheGpljh+xVtFXl+LVxJ/CdN1Tm/37zV3XJ1FF+qK
         dJML89GC2lxyS4Cra/YVP5OZgifLyItrVVr6MaN+sFKGZEhtP09Ti8xa49Qgnq3tamoM
         BD7w==
X-Gm-Message-State: APjAAAU5syywf49A1xNyRF2pwlB55YnVpwF/Cbl2bTu4Z09KQ6pG6KMG
        L7ILvfVPZD60NQphWVm0ZPQF/P+0R7goGFYGH9bQIw==
X-Google-Smtp-Source: APXvYqxBERF293e15i4oX5SWRbPMOfqKEJuOzLHoaUrl9EoMvgRMl7sq8s8LAW8jZQcqDMBCNmWB002/Dgpd16Pyzww=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr47219184lfh.92.1564308025871;
 Sun, 28 Jul 2019 03:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190629123306.12519-1-colin.king@canonical.com>
In-Reply-To: <20190629123306.12519-1-colin.king@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 28 Jul 2019 12:00:14 +0200
Message-ID: <CACRpkdYaVT_j5Ky-nd8_1F0mG3yqBWaQ_ju8g2zSb1O+565ozw@mail.gmail.com>
Subject: Re: [PATCH][next] gpio: bd70528: remove redundant assignment to
 variable ret
To:     Colin King <colin.king@canonical.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Jun 29, 2019 at 2:33 PM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> Variable ret is being initialized with a value that is never read
> and ret is being re-assigned a little later on. The assignment is
> redundant and hence can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.

Yours,
Linus Walleij
