Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D288C22A140
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Jul 2020 23:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728832AbgGVVSu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 22 Jul 2020 17:18:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgGVVSt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 22 Jul 2020 17:18:49 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A57C0619E1
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Jul 2020 14:18:49 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id k1so2153421pjt.5
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Jul 2020 14:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/NCA8bXI3zfZYAohLjznoM/f/0f70sPbB/+ypwTdYwc=;
        b=SHf1JmGTnB3dAO02ZCUI+6CakGm0Ef6Boq9u7eNpki+17Ha09xS2ZLBYWpY3VMzFT3
         u+7lxgl5oNVZvC0wFhSwysOqeqyKoI7jJIip6qgnkiWglcOa6GlBXxdWE+BMgA/PMGTq
         wx4TzANPIFUFMO5iOGVq9/MJNTNzyYw/GTftAaKhd0iydIvRpoEwwhWXlf8cLPHp30TB
         sbaXemgDpu1SkwiwBU1Hl2v003Sf6nVysUcoJnIFqYlKFi8qkRvHDdhsNFJMAW93yETa
         5yNBOnrao3i9q6rZ63DqUtfWqx/DFAtRhx0/1ifYorhLdjAcBsfiLIraRTpmbF2fQj8y
         1kQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/NCA8bXI3zfZYAohLjznoM/f/0f70sPbB/+ypwTdYwc=;
        b=ltmguc5gm2XtskUhIUrVc0HoLW6i/KRN9WHX2aemfUpn9zbyl1d1THWzCJRnlFB6/8
         xPukymbWhuzKXStJaMzXbgBcEUcx7XcyceRMToB0iBE352e++W4UHm5nwclWA/VRyVNN
         i5DwG0BGm9/SZIk7WLNIdI9kSTP9hJ1QMscdNxEGQ6vGS/AHfQtJb+jwY2qRvkJoy6/+
         7DJURLm/z+3OmKFXxbTerTFtU1KaQ5FRMXSnceRW5cLeSNMjKsJ4Nbvo9NGiy1glDQyi
         wIwzDrFFW26JlQYYbH5FmU0jSJ4tgj1DK7bjNRgLCvxiYtgKvjSOvYEmiU44n3PsnW+9
         mMKg==
X-Gm-Message-State: AOAM533KBNpF4AvwIwj/EEjs6N9RDmdZx3aNXhk7aUhFOM9GgHv02pRi
        QGZLfaeZQ1VQzY1REJaeYesc/w==
X-Google-Smtp-Source: ABdhPJzosbYETKUk0ThWbWyDitsjMwfz7haDDCSEljXg5g94MYNfHgTQ89Bodw/QHDKiLlW78A78Gw==
X-Received: by 2002:a17:90a:c592:: with SMTP id l18mr1236663pjt.119.1595452728690;
        Wed, 22 Jul 2020 14:18:48 -0700 (PDT)
Received: from Shannons-MacBook-Pro.local (static-50-53-47-17.bvtn.or.frontiernet.net. [50.53.47.17])
        by smtp.gmail.com with ESMTPSA id 207sm566591pfa.100.2020.07.22.14.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 14:18:47 -0700 (PDT)
Subject: Re: [PATCH][next] ionic: fix memory leak of object 'lid'
To:     Colin King <colin.king@canonical.com>,
        Pensando Drivers <drivers@pensando.io>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200722174003.962374-1-colin.king@canonical.com>
From:   Shannon Nelson <snelson@pensando.io>
Message-ID: <e0e428cf-3bef-9b57-2a7f-5a2381587085@pensando.io>
Date:   Wed, 22 Jul 2020 14:18:46 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722174003.962374-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 7/22/20 10:40 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently when netdev fails to allocate the error return path
> fails to free the allocated object 'lid'.  Fix this by setting
> err to the return error code and jumping to a new label that
> performs the kfree of lid before returning.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: 4b03b27349c0 ("ionic: get MTU from lif identity")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/net/ethernet/pensando/ionic/ionic_lif.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_lif.c b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> index 7ad338a4653c..728dd6429d80 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> @@ -2034,7 +2034,8 @@ static struct ionic_lif *ionic_lif_alloc(struct ionic *ionic, unsigned int index
>   				    ionic->ntxqs_per_lif, ionic->ntxqs_per_lif);
>   	if (!netdev) {
>   		dev_err(dev, "Cannot allocate netdev, aborting\n");
> -		return ERR_PTR(-ENOMEM);
> +		err = -ENOMEM;
> +		goto err_out_free_lid;
>   	}
>   
>   	SET_NETDEV_DEV(netdev, dev);
> @@ -2120,6 +2121,7 @@ static struct ionic_lif *ionic_lif_alloc(struct ionic *ionic, unsigned int index
>   err_out_free_netdev:
>   	free_netdev(lif->netdev);
>   	lif = NULL;
> +err_out_free_lid:
>   	kfree(lid);
>   
>   	return ERR_PTR(err);

Thanks!

Acked-by: Shannon Nelson <snelson@pensando.io>


