Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6818AE7627
	for <lists+kernel-janitors@lfdr.de>; Mon, 28 Oct 2019 17:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730711AbfJ1Qa3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 28 Oct 2019 12:30:29 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44866 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391019AbfJ1QaY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 28 Oct 2019 12:30:24 -0400
Received: by mail-pf1-f196.google.com with SMTP id q26so3581606pfn.11
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Oct 2019 09:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=SQuBb1DCXEr8h1ECCdUIOg6XQFl3p+ONu+5Oivf+rCw=;
        b=TZgFUJfk5s8fMqvLgcfoSfoH5/QODG8LGopHISdASnARo4nD5nanqf1siljcA53hK2
         vJV+9nCLl0JOol9OWtGW3dmp1E7ZDBU0UEuiti6O/DqNrFSqJ77V0D3IEYEtKDcnK9Um
         QGEeQDx4e6qmmuWaIINHFTEbknU1vbikTO+mRvMgYxMuy3yZaHEtfeVlJddlIByq/prL
         799VU5HYR/o4NpDliCg+aylRupNiBLgPSypRvBKwYSsE6CRaVMKoaqc8TJNTvyOhaXFE
         EN/RcKC8UUtXz5aJSwfkCKgSnPJuKEFnV3x7+pKGwJXLIWyxJ0k3Rs2Hp/eAWkBEeWeh
         Wj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=SQuBb1DCXEr8h1ECCdUIOg6XQFl3p+ONu+5Oivf+rCw=;
        b=GHni9YgNY3DWDlRa8H+ssyrsfejGZPZPz1KO+nYdj/93rFPL51wSwdxOJhksTjo291
         Mak02n/Uhxmo9B1PvriX6TnvVpqyPnhjjDehpim5+I5pCMIN/YBEUlZaGK1JDN8GfwQ2
         L2NaST8zwEAmLnKHPxgSVPQ8m9pR/lY0OzPVZDI9cVFnkCLh8t49KEOWaKTlawNiOwyK
         d6PeBYd955MrWFYg2f+6UvO0VbVbwF9z3If//LVuaEOTIq96E9xxPGj+qDielYInVR2+
         RBF8zuy05b6z0QvPsmKel5KqXKiXJL/Dzs1GVXybQi1TbD1H083uEW6D+UFDZQPxVT57
         4cCA==
X-Gm-Message-State: APjAAAUEXY6o3iv25eRZAXzUoJBORnq27QXHwqFhxmGOwIIHOjgQdvjK
        O3A36AHmt6PaG0JrUSDNYlBTlsVOynuLeA==
X-Google-Smtp-Source: APXvYqy36OBf3DTn/iAU+tRcnAOHj5pMGpTO3ypHFAqBrCmS9Alu7BSIuIlAMijtuMScIJF29o1VQA==
X-Received: by 2002:a62:8704:: with SMTP id i4mr21102540pfe.15.1572280223335;
        Mon, 28 Oct 2019 09:30:23 -0700 (PDT)
Received: from Shannons-MacBook-Pro.local (static-50-53-47-17.bvtn.or.frontiernet.net. [50.53.47.17])
        by smtp.gmail.com with ESMTPSA id s7sm11329948pgq.91.2019.10.28.09.30.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Oct 2019 09:30:22 -0700 (PDT)
Subject: Re: [PATCH net-next] ionic: Remove set but not used variable
 'sg_desc'
To:     YueHaibing <yuehaibing@huawei.com>,
        Pensando Drivers <drivers@pensando.io>,
        "David S . Miller" <davem@davemloft.net>
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20191028120121.20743-1-yuehaibing@huawei.com>
From:   Shannon Nelson <snelson@pensando.io>
Message-ID: <a9acbf5c-a6d7-0115-2ca9-53368ba12508@pensando.io>
Date:   Mon, 28 Oct 2019 09:30:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028120121.20743-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 10/28/19 5:01 AM, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/net/ethernet/pensando/ionic/ionic_txrx.c: In function 'ionic_rx_empty':
> drivers/net/ethernet/pensando/ionic/ionic_txrx.c:405:28: warning:
>   variable 'sg_desc' set but not used [-Wunused-but-set-variable]
>
> It is never used, so can be removed.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Shannon Nelson <snelson@pensando.io>


> ---
>   drivers/net/ethernet/pensando/ionic/ionic_txrx.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_txrx.c b/drivers/net/ethernet/pensando/ionic/ionic_txrx.c
> index 0aeac3157160..97e79949b359 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_txrx.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_txrx.c
> @@ -402,7 +402,6 @@ static void ionic_rx_fill_cb(void *arg)
>   
>   void ionic_rx_empty(struct ionic_queue *q)
>   {
> -	struct ionic_rxq_sg_desc *sg_desc;
>   	struct ionic_desc_info *cur;
>   	struct ionic_rxq_desc *desc;
>   	unsigned int i;
> @@ -412,7 +411,6 @@ void ionic_rx_empty(struct ionic_queue *q)
>   		desc->addr = 0;
>   		desc->len = 0;
>   
> -		sg_desc = cur->sg_desc;
>   		for (i = 0; i < cur->npages; i++) {
>   			if (likely(cur->pages[i].page)) {
>   				ionic_rx_page_free(q, cur->pages[i].page,
>
>
>

