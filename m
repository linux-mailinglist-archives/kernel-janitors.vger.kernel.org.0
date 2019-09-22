Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5360BA39E
	for <lists+kernel-janitors@lfdr.de>; Sun, 22 Sep 2019 20:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388382AbfIVSV2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 22 Sep 2019 14:21:28 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35381 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388240AbfIVSV2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 22 Sep 2019 14:21:28 -0400
Received: by mail-pf1-f194.google.com with SMTP id 205so7616577pfw.2
        for <kernel-janitors@vger.kernel.org>; Sun, 22 Sep 2019 11:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=xbjhe9p7ihX/LhWFDLHIoBHjGYW3pvzMntXfhITxjEM=;
        b=txE2yt0Rmf5IlC2Zs/dwezsK13nRZqMERzjkCdLKfMjva1GAVIMx5iDFHV8T9AhYRO
         sHRYpZiqNFseq33Ggkbb2zXK4Flf5wz37bFOlBqqeADlKKXCcBlGCFGHYipK7KmsAumH
         QvGH9tZRPElRBHZ6jsW/7qm3+B9qOtLL9O9eivBrI5G4dXepvHWBw9wIOVtA4vTbugWH
         FQ31p4xsGxAqISiWsXyKN50vyZ6P06fUuDqA767pndUvOBSJH997Dj64icJHvZ6zqNqK
         Z6afrWj2ELoGLkUxnPCXTZGRWFGZaKUzwg3Ydx5+onA4ZKhrmQUu8EhhHX1ei1EHv0gM
         PyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=xbjhe9p7ihX/LhWFDLHIoBHjGYW3pvzMntXfhITxjEM=;
        b=ZIgTVX1rqkBu9jdBYGB4K+0OBMqJ8pWOAmNae6dwzRBY1zjrVGkWJeq2Ja5WXfVHBv
         cN1fsoiCjhzCuhQGpB7BxL88hx2x0qe4wMII5+twFIA23PYHGOGap/B6P4yxxQUfTkhA
         Y9l6PYBY9TeHFrwj1qpHSE1UMZfbgNnPEmB/gY1mNTzow0oBvrh6bNH4jaWd/BBzXxrn
         XycNp04iJ7wJQbG0Vdx2KJ4ZyAdH3KKptgN/3hCIPnpnErDHutJm+cWUPzhRQC6nO5Fm
         5yMIGyYhor9C/N5nXyEE/ExAZu3BC6M/PcOM17H5JG11tWZJFTvwXdD5xkk795zX+PNw
         1hyg==
X-Gm-Message-State: APjAAAVg4Xk8/lM/9Kr2i38bWayrXZROSooCLIvbFtz5fnhEwnFRj++6
        3LhIJ1FArCWo3mhSR2M2uMxqNuWn/3kV3Q==
X-Google-Smtp-Source: APXvYqxr2+93cit3nFL6iFGEpSqCkYBinAEKMovpu/+XMMDoZVqJzqP5lfj9tWIk4jRh8MPMlqlUYA==
X-Received: by 2002:a05:6a00:8c:: with SMTP id c12mr28584631pfj.200.1569176486014;
        Sun, 22 Sep 2019 11:21:26 -0700 (PDT)
Received: from Shannons-MacBook-Pro.local (static-50-53-47-17.bvtn.or.frontiernet.net. [50.53.47.17])
        by smtp.gmail.com with ESMTPSA id x68sm11509436pfd.183.2019.09.22.11.21.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Sep 2019 11:21:25 -0700 (PDT)
Subject: Re: [PATCH net] ionic: Fix an error code in ionic_lif_alloc()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Pensando Drivers <drivers@pensando.io>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20190921055926.GA18726@mwanda>
From:   Shannon Nelson <snelson@pensando.io>
Message-ID: <d878a0d8-7458-0a7d-3bf9-8a8a06e5d6a9@pensando.io>
Date:   Sun, 22 Sep 2019 11:21:24 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190921055926.GA18726@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 9/20/19 10:59 PM, Dan Carpenter wrote:
> We need to set the error code on this path.  Otherwise it probably
> results in a NULL dereference down the line.
>
> Fixes: aa3198819bea ("ionic: Add RSS support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/net/ethernet/pensando/ionic/ionic_lif.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_lif.c b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> index db7c82742828..72107a0627a9 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> @@ -1704,6 +1704,7 @@ static struct ionic_lif *ionic_lif_alloc(struct ionic *ionic, unsigned int index
>   					      GFP_KERNEL);
>   
>   	if (!lif->rss_ind_tbl) {
> +		err = -ENOMEM;
>   		dev_err(dev, "Failed to allocate rss indirection table, aborting\n");
>   		goto err_out_free_qcqs;
>   	}

Thanks, Dan.

Acked-by: Shannon Nelson <snelson@pensando.io>


