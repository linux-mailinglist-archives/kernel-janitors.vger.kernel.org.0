Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4703460BCC
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Jul 2019 21:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbfGETfY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 5 Jul 2019 15:35:24 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40694 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbfGETfY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 Jul 2019 15:35:24 -0400
Received: by mail-pl1-f196.google.com with SMTP id a93so5030954pla.7
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Jul 2019 12:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4bSubNqyienkWnWrDMGIEHexMg/cFriBlSA9U4DgJH8=;
        b=Qah/4KC9Glb/RspWVIJ7/PkxkCKwY3ATxv6v83YsyAYpO+THFV1vWDcp3rFQOr1nPy
         Y0kcKJO+0L/irYJd9LC0WFFjclHhNc1q2ayZZ9Dn/btp0hx3wqwJOVPC21Q2tcKZX9T+
         FN6WgRBEkn8AHP5sSoTPzSr+aTdYIIpGgh7QVUEnSm31DJpBWwBEjVrqO3nchL1ll4E0
         90ce7meOqoapV4NTAUs9KxpwdGSJ4z2lzcnSdPjvY6j2aNwkT6vaRj4myuhjGCOZVcLv
         royHls8zxSxLjhFYHM34LRla+3jkuS0M1qWCpwiIeh8u7ePLjNjb512pBx6HNwtJYtSj
         bqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4bSubNqyienkWnWrDMGIEHexMg/cFriBlSA9U4DgJH8=;
        b=ovGF5SJM8d3lqdSfJyq9Vz+Q16WmGu4BkNtxKaUIJU2ibGUJqttp2KGlklYvj9vOlh
         VBqx7CZGLsbNlCd0Gt5XT7485PYAxWSCkvxFeqDQhywebjrjo9EmOrGFukn10AUiehOy
         YcYNuJe8+6udMLqtepg2A3Eu0RCCLxZURLvgIQHqU5w3YY/rweyac/d48u2LjloCQ3Nt
         uLrJ2g5Qf8I5LFgkC6/IwQ75TqT5nmzgK/ZFFsa5EgCWYbob+xqoE97rztMnIPuPsiju
         jazllrC66PlwODYBng9WPehm+zaixkPB0cJ7MtUBOW+EKuwDPM7V94wmUt3vH3JdjVjZ
         TBfg==
X-Gm-Message-State: APjAAAX5QIvDkEjGSSwuHXhengxkTW1s7t1jCs/iKLrASk9iD3pd7hwb
        J+qS8H5SuCOi6gqKvIAm5lPSGvAe8fL1XA==
X-Google-Smtp-Source: APXvYqzyLHdbpM33znlkvuVOmqCw2yyINW1GGFdSFEpFOdg12P1oMSy/NgDAbEVazvLSHgD80xoJ7w==
X-Received: by 2002:a17:902:ab83:: with SMTP id f3mr7540538plr.122.1562355323416;
        Fri, 05 Jul 2019 12:35:23 -0700 (PDT)
Received: from [192.168.1.121] (66.29.164.166.static.utbb.net. [66.29.164.166])
        by smtp.gmail.com with ESMTPSA id t32sm10145274pgk.29.2019.07.05.12.35.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 12:35:22 -0700 (PDT)
Subject: Re: [PATCH] nvme: One function call less in nvme_update_disk_info()
To:     Markus Elfring <Markus.Elfring@web.de>,
        linux-nvme@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
        Keith Busch <kbusch@kernel.org>,
        Sagi Grimberg <sagi@grimberg.me>
Cc:     kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
References: <38f864df-9c90-31a3-d78d-7aaf2d726e4f@web.de>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <b701a461-4c89-3860-bc99-0662db2382c2@kernel.dk>
Date:   Fri, 5 Jul 2019 13:35:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <38f864df-9c90-31a3-d78d-7aaf2d726e4f@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 7/5/19 1:15 PM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 5 Jul 2019 21:08:12 +0200
> 
> Avoid an extra function call by using a ternary operator instead of
> a conditional statement.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/nvme/host/core.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index b2dd4e391f5c..73888195bdb2 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -1650,10 +1650,7 @@ static void nvme_update_disk_info(struct gendisk *disk,
>   	nvme_config_discard(disk, ns);
>   	nvme_config_write_zeroes(disk, ns);
> 
> -	if (id->nsattr & (1 << 0))
> -		set_disk_ro(disk, true);
> -	else
> -		set_disk_ro(disk, false);
> +	set_disk_ro(disk, id->nsattr & (1 << 0) ? true : false);

Let's please not, the original is much more readable.

-- 
Jens Axboe

