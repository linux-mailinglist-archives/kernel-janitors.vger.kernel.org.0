Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1740DCC3B5
	for <lists+kernel-janitors@lfdr.de>; Fri,  4 Oct 2019 21:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730340AbfJDTpH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 4 Oct 2019 15:45:07 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44924 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727978AbfJDTpH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 4 Oct 2019 15:45:07 -0400
Received: by mail-lf1-f66.google.com with SMTP id q12so322662lfc.11
        for <kernel-janitors@vger.kernel.org>; Fri, 04 Oct 2019 12:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ig2bd75GnHMToY2Lt27CYgTDtNYbuy1gGc25rUD2An4=;
        b=AMunfFNpKE+8jkSxgQ+CmomwXobKVHz4DqW5IBbefEKK+erUajn7p/Qm7dt9Z6mmZH
         0rS++FlqOof4RDzziQob9sz9zzPwzTrhE5GkE/x/F/amWFcehLUSVXRSDjYCdfXwUTW/
         PjBIO1alDROA7ICvUJGxxWOuIDhf6j8kKt13KavYOw2GzeIx7vtMEVZXN2uFx3XibqkS
         Owe1ULicJr+Qh8sKAuDQNjH+SP+37Cj4LnCGNgq0n9LLSGr8c/aILBVaPH98cpusnlLn
         VOfZa4DSPWHoEJ22H301f8oPbFYOUdFDPY7xDoXHuPXgWcApGpW1pmFQuNvVXwu3KYTu
         1lfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ig2bd75GnHMToY2Lt27CYgTDtNYbuy1gGc25rUD2An4=;
        b=MpmJovcXsUOp+6ljl65pYSpv1oCc5FQgNuzcxLMwZxzDyzw+pxCDbijbse4NLQZ+Xp
         Pflz2XhmxoQ4kUH44eF2jsq9HEX0eiUuWELJMBwYyf7PAstdTLn2Df99GU16IzZkTTtu
         c7dz/YPJ4ang/I5aKqCvqXABz+PDwhUgv4R+jDm7ZbVvsxY8Sc/kcN8qBCbs6xhLtDzO
         T2cO1jCNbVZXqK8W3uitIRnyP1zj66El8N9wIS9ttexnncdnKSrw5Kho1V6y4GY8+sMU
         S+uUD9z7OtofXEYSJpaSU+rM/dgVdEsHNg8ibbWsQ/rUschI5Hnc6cKAiv8jp/k6HBMe
         wLxA==
X-Gm-Message-State: APjAAAXBfhLGrO0SkLF+daQ2VrDBc7mFWCHYacL3EKuKiblZbrH4w8ep
        NhSxuUfNKlzBDdSGZST53URZt32E+/n0jZhLnO40Ig==
X-Google-Smtp-Source: APXvYqyfDJMQJRS/zQ6t2yMjF09Dcf72KV0t+O+BMP8nioJ5Z9vrYI6QxASJCmiz1bsPY3Z4HKU2ONkNeMD7WhAvZho=
X-Received: by 2002:a19:117:: with SMTP id 23mr9983798lfb.115.1570218304825;
 Fri, 04 Oct 2019 12:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <b17404cd-294f-fe2f-e8a3-2218a0dae14f@web.de>
In-Reply-To: <b17404cd-294f-fe2f-e8a3-2218a0dae14f@web.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 21:44:52 +0200
Message-ID: <CACRpkdbgUVm_6MdHw+6MJBc-oHYp-MA7_3jM3buQtKJEtEMtnA@mail.gmail.com>
Subject: Re: [PATCH] sata_gemini: Use devm_platform_ioremap_resource() in gemini_sata_probe()
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-ide@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Himanshu Jha <himanshujha199640@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 18, 2019 at 8:34 AM Markus Elfring <Markus.Elfring@web.de> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Sep 2019 08:28:09 +0200
>
> Simplify this function implementation by using a known wrapper function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Looks correct.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
