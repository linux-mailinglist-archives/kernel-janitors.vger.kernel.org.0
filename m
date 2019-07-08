Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24A36625F1
	for <lists+kernel-janitors@lfdr.de>; Mon,  8 Jul 2019 18:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388834AbfGHQQm (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 8 Jul 2019 12:16:42 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35785 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727592AbfGHQQm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 8 Jul 2019 12:16:42 -0400
Received: by mail-io1-f68.google.com with SMTP id m24so27071002ioo.2
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Jul 2019 09:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7tw0R1rFMCD1i4r7LuNeYKjhPcjJjHVgqiG2ggUkFmA=;
        b=Jg78YVBBeZqrqneqx3nONAoF4GkNLjxyjwwf8AjCFQUdlWP1dNKhAJXiF22a3KzwIw
         4N8ABLfR99iGqrDfd1NKQk8xrJFFzfLXSw+ZctmwpQ4vxIAtOCtNda+BNpflXcmmz+yA
         teOMSe/4fKptDXUxzoPdAcJIXJzqnNUYTAvW6F90CtVGStIBFvvNUQ3rcUpbhff2G1TW
         9qUuD/Det7AQKuh4COh7xnRrG/gm+vY1og269gZmuYtcT+G0zYI4yi7e+aNS3P1iDJa9
         MNrZAbSSbvP7LPxqHipt4w6Qi1GCKZCIPa5C7y/AYPR0btMvq8womaaTesgPAsJgFd+B
         egFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7tw0R1rFMCD1i4r7LuNeYKjhPcjJjHVgqiG2ggUkFmA=;
        b=jP7wnbDbZ+nHx5gJxc8PFk/lgmm54oqyfEvHRCxgz4pNSEsr9HOb01Wf9xV+UuBhDb
         4Z0zBzQsD1jf9Tuz2hh5hJRyV0dlIl0ACupPP+V6S/pTZACllz6+k/1kUJxag7Auzt4M
         DuRRV6OYMa5uAHUUMHvHO7QpjbpjRmb4VQaRWcE6fbVrIqjqj9sE7Zsxs2Uzhk0eN0iX
         6EKKAsj9KR+pK+AXc/BYCEOUVGZhWybTn8MtAPhLUgLm0mAi1p5J2DHc7OqvQVxegfMZ
         uidApQemWg6f0EOWll7urPHgUJY5jDCCi6REcvx5YXpuSmXx7wycajspSlXnhw/d1yBu
         cDbA==
X-Gm-Message-State: APjAAAXQKF//XweS3mZRATIQtQ/fZXYf4TTe5OO09YuTyCBGbHp2OIgP
        HPz+RYldLzDKi+9+1fz5TEccp/E0PrPNJZx7cpVmeg==
X-Google-Smtp-Source: APXvYqzMhreahvLSaTzvfscpJMJE88pqa13LJ/bcpTvySglD81gzHf0MAYFs52rE/Xn4yIJlW15bP7pWQwhONzedP/k=
X-Received: by 2002:a02:b609:: with SMTP id h9mr15223976jam.36.1562602601187;
 Mon, 08 Jul 2019 09:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <172e04b2-65a5-4007-8464-cc7701e76e36@web.de>
In-Reply-To: <172e04b2-65a5-4007-8464-cc7701e76e36@web.de>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 8 Jul 2019 10:16:30 -0600
Message-ID: <CANLsYkxxe58r10aodp+Cdi8MBbidk_UDgFEbuO3WVZCu8k9uNQ@mail.gmail.com>
Subject: Re: [PATCH] coresight: etm4x: Two function calls less
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 5 Jul 2019 at 11:40, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 5 Jul 2019 19:33:26 +0200
>
> Avoid an extra function call in two function implementations
> by using a ternary operator instead of a conditional statement.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index a0365e23678e..219c10eb752c 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -296,11 +296,8 @@ static ssize_t mode_store(struct device *dev,
>
>         spin_lock(&drvdata->spinlock);
>         config->mode = val & ETMv4_MODE_ALL;
> -
> -       if (config->mode & ETM_MODE_EXCLUDE)
> -               etm4_set_mode_exclude(drvdata, true);
> -       else
> -               etm4_set_mode_exclude(drvdata, false);
> +       etm4_set_mode_exclude(drvdata,
> +                             config->mode & ETM_MODE_EXCLUDE ? true : false);
>
>         if (drvdata->instrp0 == true) {
>                 /* start by clearing instruction P0 field */
> @@ -999,10 +996,8 @@ static ssize_t addr_range_store(struct device *dev,
>          * Program include or exclude control bits for vinst or vdata
>          * whenever we change addr comparators to ETM_ADDR_TYPE_RANGE
>          */
> -       if (config->mode & ETM_MODE_EXCLUDE)
> -               etm4_set_mode_exclude(drvdata, true);
> -       else
> -               etm4_set_mode_exclude(drvdata, false);
> +       etm4_set_mode_exclude(drvdata,
> +                             config->mode & ETM_MODE_EXCLUDE ? true : false);

Looks good to me - I will add this to my next branch when we have a new 5.3-rc1.

Thanks,
Mathieu

>
>         spin_unlock(&drvdata->spinlock);
>         return size;
> --
> 2.22.0
>
