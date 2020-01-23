Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B48CB146CC9
	for <lists+kernel-janitors@lfdr.de>; Thu, 23 Jan 2020 16:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728665AbgAWP2l (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 23 Jan 2020 10:28:41 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45609 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727296AbgAWP2l (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Jan 2020 10:28:41 -0500
Received: by mail-lj1-f196.google.com with SMTP id j26so3860107ljc.12
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Jan 2020 07:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Qr9BdbkkgkuLaABxg1maqPFbi8IH41Lo7L1VxAqiyw=;
        b=iGZFnSn+vi28+z3do2lW+WbQQJIwuMVk+nTR6JGwyfDav1RKSSd7CcJ6KK6LcpVCo2
         0fiNppfjuAfjdpSLuQenKgpCS4QV+Vufpcl2FY4z+ARDLnP0QoKMSlqBVFoiIMk4AcaP
         lY10C7psqauI55WjsxDwb5YlBe6knaX/slmuyLZvhmUMmFDoRBFAadi1km59bjfF5J4d
         kWzkfEIo6Hyh8axepy05Q0Y0SukHwLD8Y5KSTFVXhwDfNAMU65YRWb91H4NB0tbBm1YZ
         /lXTng/W2mJRJ1Q/Wi2BdLzvpkQQ6oKyIgnKelSCPWF84hqCw0+9+1BojMj7gyxKItx7
         jPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Qr9BdbkkgkuLaABxg1maqPFbi8IH41Lo7L1VxAqiyw=;
        b=XHPJOt30C2BfsATReOxXWZ4EWNYhj6OjDvmTkvJccgO/1Ysz4KEK0A9zZ454zMgM46
         xvmYPLS95yi5Cl6ksM0f1EaGGtDhssMoxy3uLOFs9ku1dAey2gDLWt95pcxSk6etJs5B
         bx27Jo1+akUCYwCxQjEA5MCx5KAn+FLFuNxOsOrOUWpx9wqn5F7Gppdz3VFt7EvC2mV/
         XswltWZyORsfwRH9NdGr9eh94mq5ofFioIdhrx8zZKrIuxd2OimPqA8iMCec69Ui0CJ2
         bE/urUavx5tcGdXHBnxKUzRVKQya2c10IrTYHgdHbXaFmZ1FUybIgVzlKRv7wRFyf5ZR
         AX+w==
X-Gm-Message-State: APjAAAW28jK5PX/0ByP1V1Ss+1OmMet6yNDa8AkubfvFMX0/nxJMJ9XX
        4tXYqu4PfXHKghXodYuQiAfOfJ1e9/YhrFl8j+lD/w==
X-Google-Smtp-Source: APXvYqz9aT6DBqL1eSjmsf3APA52AKWR+11VI/tOJBRr1Zl3oa9tmU2n9K3uxQplpdd8BuXZX19EDE3gZHHtzgDtTcc=
X-Received: by 2002:a2e:81c3:: with SMTP id s3mr23654693ljg.168.1579793319446;
 Thu, 23 Jan 2020 07:28:39 -0800 (PST)
MIME-Version: 1.0
References: <20200121161757.1498082-1-colin.king@canonical.com>
In-Reply-To: <20200121161757.1498082-1-colin.king@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jan 2020 16:28:28 +0100
Message-ID: <CACRpkdYzd13xu9ETj_a4eWrm4FMrVnF1NQ5G+=d_Ch=6SzRoxA@mail.gmail.com>
Subject: Re: [PATCH][next] iio: st_sensors: handle memory allocation failure
 to fix null pointer dereference
To:     Colin King <colin.king@canonical.com>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio <linux-iio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jan 21, 2020 at 5:18 PM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> A null pointer deference on pdata can occur if the allocation of
> pdata fails.  Fix this by adding a null pointer check and handle
> the -ENOMEM failure in the caller.
>
> Addresses-Coverity: ("Dereference null return value")

That's a weirdo tag, but I suppose you have aligned with the maintainers
about this.

> Fixes: 3ce85cc4fbb7 ("iio: st_sensors: get platform data from device tree")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
