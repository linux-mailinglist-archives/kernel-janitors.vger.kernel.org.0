Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1EC110084C
	for <lists+kernel-janitors@lfdr.de>; Mon, 18 Nov 2019 16:33:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfKRPdM (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 18 Nov 2019 10:33:12 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:39122 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726748AbfKRPdM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 18 Nov 2019 10:33:12 -0500
Received: by mail-il1-f195.google.com with SMTP id a7so16362385ild.6
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Nov 2019 07:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YS184bGN6J9aePOBe16ozqbDzE/B0ihMCWCOanLvA5g=;
        b=vLpgu5v+D2olah9Wi43FZ6HK8MhA2Y5rf8HIDP/s70aP9Efbrd3heTA6s4ZlNIKs0n
         ISkSRgR1l9H9wH/43ehcjXj+w70RoyMQAXC0w2YEgZm5mOifEXGN/tzKyx82wGIuCyZ3
         L0BoWn/J9hW+h3sL+pKDbyk9J0HjIFBfir1gt6y/LWvik3ojjsSo9NysNFfNB0SL2OAu
         mlma09eTHtOtokmu0DyHw6mHxQnlZWHr7UxcJOmXH0VK4KTtSur4B5+Y2D5WjXxlUISJ
         3SFUNXvZNnyXedpAm5by+A9KzSpew63ijEEdTBWbNN0fMvWU3BUTjD3MvIR5aC9IoE5F
         Rr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YS184bGN6J9aePOBe16ozqbDzE/B0ihMCWCOanLvA5g=;
        b=JElMW97F25rBhYhyiwnfIXRRtip2iG9uXeKgMBFdddxy0wLS71PlDBWcOaPo5he/4q
         XsJxwUmFHmJGyiJkMq6k95rz1NRHQaEBgWayGne+xWbBK3bZPZ6wYZRJZ3PszoW+14R0
         s2Be8lFiga7cantU2JOC0uYK53XAoY5cMfKrjHl2z6nt3hrGAFx2A1qw2h5Makzk7F7R
         OUuPV/aG9RVHAiShpq36kqv5+o0+UFGfJHRr/s4ptHtpwFadfAYrn7aTGjtk4z9Uv2/9
         Do5wgqP49Ix/NfA6nUFcaew6f31VFt4hBJtln0jOcbadsxOBheGfByIeLx1FevdCu22+
         2gbw==
X-Gm-Message-State: APjAAAUuMUqSnniETqx4MM17IUFfn7yOxyBO8yyhCELJ5DLRyQ35CMVv
        k+2n4nbIgmaXGrp2noHe/VQHLHuUiM4=
X-Google-Smtp-Source: APXvYqzwsBX5JB5z9XzVfjupL4dDEpkaqvxBhu+HScemh7bwuROVhXdNmpSWX/fjlI/hINiwDg/PcA==
X-Received: by 2002:a05:6e02:d92:: with SMTP id i18mr15984126ilj.20.1574091191085;
        Mon, 18 Nov 2019 07:33:11 -0800 (PST)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id z69sm4547097ilc.30.2019.11.18.07.33.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Nov 2019 07:33:10 -0800 (PST)
Subject: Re: [PATCH -next] scsi: sd_zbc: Remove set but not used variable
 'buflen'
To:     YueHaibing <yuehaibing@huawei.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     linux-scsi@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
References: <20191115131829.162946-1-yuehaibing@huawei.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <321d25d4-2216-dae2-268b-ca225c5e5caa@kernel.dk>
Date:   Mon, 18 Nov 2019 08:33:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191115131829.162946-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 11/15/19 6:18 AM, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/scsi/sd_zbc.c: In function 'sd_zbc_check_zones':
> drivers/scsi/sd_zbc.c:341:9: warning:
>   variable 'buflen' set but not used [-Wunused-but-set-variable]
> 
> It is not used since commit d9dd73087a8b ("block: Enhance
> blk_revalidate_disk_zones()")

Applied, thanks.

-- 
Jens Axboe

