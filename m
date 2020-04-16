Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A29E1ABF64
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 Apr 2020 13:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506043AbgDPLes (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 16 Apr 2020 07:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506033AbgDPLEr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Apr 2020 07:04:47 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47A4CC03C1AE
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Apr 2020 03:53:50 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id q19so7264976ljp.9
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Apr 2020 03:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QgaYHDB+V/P8sJggA7Iblc7jogxqawaSl+yzOQ0/Rn4=;
        b=jU0ibB7dsoTTJYnbq7KJWD85iq65azWfsvxPzehE8nANACAg+Xlc06OrsGr3JWXvou
         +BdxX7QH+4uNZZbRVtz1Sj5e+iyJNk2NR2lC4/RCe86BW3cGHIDvCNTX4J/dPtYe04lf
         6G4J+hPkIZtAxrYdOwtV3czWB9x44QZehux9ei4JpD0kcovDb37m9XVWZZTzjLFfwNz1
         pXypwEZ1sJqzrhLWKG+b6tys3DKV0kCeJ+YEnh9bqHbsd74k+JfGJVnkqjpGTBVdXuYF
         n/RjND8rmIlYPVAQhR1gEvwX1ESXbgBH96blAk4ykcIl0nkMrwLci8W9mA/QX0ri65aj
         hw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QgaYHDB+V/P8sJggA7Iblc7jogxqawaSl+yzOQ0/Rn4=;
        b=G+K5L6UoGlNCc2BhHo5DDyiJdfhpKbpOTkXQDN7wpDAV3SU9VG59kD/Lc8GFAKPqHr
         oIfcDOObbvFg2NdXcc8u+3B/S1F0iozl4sxKAZPmThUYVYvvjUkiOaYZyap0AeqEm7RZ
         Y9l0YFiQyrbtY+nbBxJblQU9cGnzNVLT8i20vRJyq1sfJvFaT+lkiNbRN0p8bVt6PYUf
         J1urvb3UwTECCo4tVti0AOwK9tP5g8Bia1yJ/ZpWBl6EvuciMYZAd62KhSppEPqLvNWW
         jT2WTznl92KQSSTGeEDqVFVNKvIeyMsFgIzYFJz6bqJzsiYMzSoaRWLVjCrOEN6V4YSU
         iueg==
X-Gm-Message-State: AGi0PubqbxPcVeq2Li8YH7byxox86Yg7mlI1HWfzCla1m3ImRHGx3ZDP
        Ilul36d6+1Cx9ZRf3WEgiQ35RcU7lH2TcZ1wdrV5V2Pn
X-Google-Smtp-Source: APiQypK6nkSTANaZW+1a43XoogM3H6sNnq4kMI4xqLyVIWS/PF6q8zPv4riQVVKMftU1hlwobUdBnlrK6GlVZzGsIdU=
X-Received: by 2002:a2e:5048:: with SMTP id v8mr5601989ljd.99.1587034428690;
 Thu, 16 Apr 2020 03:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200408070504.134847-1-yuehaibing@huawei.com>
In-Reply-To: <20200408070504.134847-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 12:53:37 +0200
Message-ID: <CACRpkdYUX5EuRQMj_c+0wJa2pP13MF1jd8T8AjpifeR22kc_pA@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: qcom: Remove duplicated include from pinctrl-msm.c
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Ajay Kishore <akisho@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Apr 8, 2020 at 9:02 AM YueHaibing <yuehaibing@huawei.com> wrote:

> Remove duplicated include.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied.

Yours,
Linus Walleij
