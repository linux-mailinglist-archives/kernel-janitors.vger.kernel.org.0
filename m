Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 919AD4A7B5
	for <lists+kernel-janitors@lfdr.de>; Tue, 18 Jun 2019 18:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729865AbfFRQ51 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 18 Jun 2019 12:57:27 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:42259 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729319AbfFRQ50 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jun 2019 12:57:26 -0400
Received: by mail-io1-f65.google.com with SMTP id u19so31404486ior.9
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jun 2019 09:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xrJsxZ/IfKMP1AFfySPNnocTESP3c3IM1WrlKO+7sJo=;
        b=LRLHdT3Zc0vxsuSpsMh7E6xAiPxdYfHeiWb7tew+JOx8kBFp0kWayPKaQFnGUTr2UR
         sQ4zZxKO4lf17j7Et3Er6szcshZ8xZvpJ/dubyd9UwN5nuTqgZJ+Oe+aDOwpResrEs5I
         X20R0Ukbi7TYIax2IcOCn7p5yLF+xhCssXWp0wNLuIJl7Blfzqtk+31WT0glFpzcaEhw
         rcRwWIIzWVpqCK5iOguSh4ruorGDmM/YWwIWQIacgaqTPbDxiOLExFEQIWangupFPsKW
         AdqiOKnMzmcDPhRqqHFH7XI/nyX2LflNeH6119EsYU+BPfEjGjlEYDyP0npDFxH76fRC
         VS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xrJsxZ/IfKMP1AFfySPNnocTESP3c3IM1WrlKO+7sJo=;
        b=embAFsM1JTSbNyHIssY9Yd7DCrNcdBuBbAZzUprBaBSvlcWcYTkq3WFz2u0j7bmTaN
         Uxmb9Ij5S/A2MVeTsOZhPxjL2s5S1rOxOQ3Q8S/K3Kk9uqVK9dBqP/7ygw30DVmiqEKw
         Qtlp3p4hrtewgp093piVw9MutByWvcLcztuyUzAJLmHaZFjWZQoISQePv2pg1S4MwjOS
         WWM+KcAwZHVqeKeILJZKxXrHwgoKes1wRJWlZSa6+iC4LKgl8V3Hmo0e8/ny9ibzGrwp
         SSTvfY2DrZVVTCz8kGCSN3EyAoxYxJ2Liy4MFX+0axh+R0ZastE+oOsfTv+kFQQnJq0H
         HzYg==
X-Gm-Message-State: APjAAAXd2/79F8iy2qQrqJ2ZmVZ1GnsicsPihuQtCm2DhylHPVSu1HHG
        VAPbzpPcstFQZER5xjFKsulitftJG5Zfpw0ebsB8jg==
X-Google-Smtp-Source: APXvYqyMZYgvkSgpjFYOYSD97Cjv1smwGOaNuCjsiFCWLy9P3EJDPKS7jGPSryG4ENqREkBd2GGzHG5tw909R8LYTNI=
X-Received: by 2002:a02:7642:: with SMTP id z63mr3888157jab.36.1560877046081;
 Tue, 18 Jun 2019 09:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190615104440.94149-1-weiyongjun1@huawei.com> <20190617092253.167231-1-weiyongjun1@huawei.com>
In-Reply-To: <20190617092253.167231-1-weiyongjun1@huawei.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 18 Jun 2019 10:57:14 -0600
Message-ID: <CANLsYkyQMB5q9kavLLBwGjhq7sXLNBPPpWaaEip+6DnRahA4oQ@mail.gmail.com>
Subject: Re: [PATCH -next v2] coresight: replicator: Add terminate entry for
 acpi_device_id tables
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 17 Jun 2019 at 03:15, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Make sure acpi_device_id tables have terminate entry.
>
> Fixes: fe446287ec9f ("coresight: acpi: Support for platform devices")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-replicator.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 542952759941..b7d6d59d56db 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -300,6 +300,7 @@ static const struct of_device_id static_replicator_match[] = {
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id static_replicator_acpi_ids[] = {
>         {"ARMHC985", 0}, /* ARM CoreSight Static Replicator */
> +       {}

Applied - thanks

>  };
>  #endif
>
>
>
