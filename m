Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 390DF60212
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Jul 2019 10:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbfGEIYz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 5 Jul 2019 04:24:55 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36020 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbfGEIYz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 Jul 2019 04:24:55 -0400
Received: by mail-lf1-f67.google.com with SMTP id q26so5769545lfc.3
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Jul 2019 01:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9FLSzJ96T/u9vNlRMaRjTA0JNSLf0kIkghtMhBwyp9U=;
        b=lv30PSIq9pW5vgIcjCH4iIU4BZBPHLBgKjqfgeFMmewbZ2luPi2ZZ19NeiI30AvKsF
         tI0xsp6C49tdZhDUj2L284wYugBfJsBUboRnL48ny5bmEVYxpc4v2I7UoXydXnzWep5Z
         rctEB73EmbXa+4nsEDuOETE7Tmr/cRNUZ/22BQ1rIQw76EHFBQu/jFS8IdgQHqTXSD6R
         9UV1/cxwJ9uRyni/jSVXqsLrs0ntF7hgVj8Q26cDf/I/eIKOX4g2xk8hwNJMFNS9DU5T
         TcH0IoT/YuXxrZSHn8xXRK8Oj3vUJta32gJsHlN41ylY6hvgF14UrlzQJydlDE3KEZQN
         9iwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9FLSzJ96T/u9vNlRMaRjTA0JNSLf0kIkghtMhBwyp9U=;
        b=K0E/CkJOKHk7NpicMgxwsoE1iroLWiyuKADTELlibmMDDQ0caqfM+NB7NSR7lX/uO5
         FUPx7EAZDW8Cx7pAaYjlYeueLzjFLQ4VXr/0cgrcM7KMOq+lq2394Pvrq09xVRj3b0Rw
         Et75glECkqyq2P/XF6/s3Dl5Uhs91TT86JYdRCKSR5DiG9nXx5UnceY4VtcvOU1AN8wU
         JvFl91Jr1EIX/FF0DRdfpKxGtAJT+a5zm5YlqRs+SXNEoqCICwdVIrrxJTG0X+29joq8
         IzNwLnMp6RVxnxgd01wTQ7saFpzB7qGPfBzm8WvSV0AXOyBTz4nDl4hyd0Azu4oEu8iB
         u5sg==
X-Gm-Message-State: APjAAAUPZG/TkhTPqiIKLd4rSz75q0hEaDwb7t2IPpahuVBp0iZamqpo
        e43b1m2O3169dalaHQk0qqjDUA==
X-Google-Smtp-Source: APXvYqxQhgzeDSHDGmuSiLnwG+1ig4OZXNqprv4IyRpQeKXZebY0s3QjP/9/qJmA0GStJqJYfa/89A==
X-Received: by 2002:ac2:4243:: with SMTP id m3mr1382863lfl.9.1562315093495;
        Fri, 05 Jul 2019 01:24:53 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4432:513d:ecce:ffd3:f4fa:ae62? ([2a00:1fa0:4432:513d:ecce:ffd3:f4fa:ae62])
        by smtp.gmail.com with ESMTPSA id m28sm1624828ljb.68.2019.07.05.01.24.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 01:24:52 -0700 (PDT)
Subject: Re: [PATCH][next] ubifs: remove redundant assignment to pointer fname
To:     Colin King <colin.king@canonical.com>,
        Richard Weinberger <richard@nod.at>,
        Artem Bityutskiy <dedekind1@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        linux-mtd@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190704222803.4328-1-colin.king@canonical.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b5e7709b-3494-d415-b36c-b19939a15fb5@cogentembedded.com>
Date:   Fri, 5 Jul 2019 11:24:39 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190704222803.4328-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello!

On 05.07.2019 1:28, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer fname rc is being assigned with a value that is never

    rc?

> read because the function returns after the assignment. The assignment
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   fs/ubifs/debug.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
> index 92fe5c5ed78a..95da71e13fc8 100644
> --- a/fs/ubifs/debug.c
> +++ b/fs/ubifs/debug.c
> @@ -2817,7 +2817,6 @@ void dbg_debugfs_init_fs(struct ubifs_info *c)
>   		     c->vi.ubi_num, c->vi.vol_id);
>   	if (n == UBIFS_DFS_DIR_LEN) {
>   		/* The array size is too small */
> -		fname = UBIFS_DFS_DIR_NAME;
>   		return;
>   	}
>   

MBR, Sergei

