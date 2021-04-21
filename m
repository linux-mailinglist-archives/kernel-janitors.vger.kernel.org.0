Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2229366EE6
	for <lists+kernel-janitors@lfdr.de>; Wed, 21 Apr 2021 17:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236710AbhDUPQ2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 21 Apr 2021 11:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240773AbhDUPQ2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Apr 2021 11:16:28 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51ED8C06138B
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Apr 2021 08:15:55 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id i81so42744549oif.6
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Apr 2021 08:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=43BM1RWeXNmeeSS9PVJMPj0AxRoQfR0CMNvFedQdo6g=;
        b=2MP4GxATv8z+lbdocPj1QM5XxbECXHXeXv5daIIZR4d+LiPzLg0o2HV3aeOybsUM8M
         x1qeuLTLWE95xVzJUx0XJd3VZp/1cLAQs02Dtev12EzxMOX8bq8+927CLJQl/D8LFOrT
         7XzgbISnulEdJRfehkk8bXbBSv/4MhgH1tDpFJFv8lb3Aif2m1/MNPwaUpMyoI2qbumh
         xrEGGqXOEtBp4zbvhDlcfdWZ2vCjEaf0yuHSn2+w8hmHQqIZHy7zuexaj1bVSFhSIprq
         yIFQDQqP9OxfK3kYIXjtPZ5xas1cuv2H8n3n8MZ0OJTVwffG5yth599VbAZ7rqbnDJQj
         dkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=43BM1RWeXNmeeSS9PVJMPj0AxRoQfR0CMNvFedQdo6g=;
        b=SgnyyXu4VY9pF7ATu7jwwoRXhzj+N3ZKTGNYG0gyxPzMEd2IqB+pQ2s0yl+RcGHFYM
         hSldbuwuAAlG0k8hu8xuL6M6qYcDB/NO/3xAeeGl+ATzjRHB3eKsikc3fPu8AyTRp3Mf
         fDBpz57YjVHdl+h1ZBFJ7zYE/TJ5t/yZFlPfzlZzJQTtooOv/MpeOpeCHjnn+nzk5TO5
         fCqBUpJmtG22ev0e/3tnfA3SgVMiPEBwDhQObqksuKlG/zJ1FhbotZXmiHDBxRkOGXSs
         EL6y2/kKuSptstxTh0rZRUcl69YUvrG/Ywdtkv6uWTS0+cH2qRgiowTkxl9pTq4Hw2S6
         uLNg==
X-Gm-Message-State: AOAM532f1WNQMOYeiX6MXWbZML2WicPizLPfLHQJ5vPJ5QwS0KsVfMsy
        ZvF0K7YYFnxkyha4RSV9XyyBrPj/wkjCKg==
X-Google-Smtp-Source: ABdhPJzfGy4O/+HA1Ao/Zzf6QlxmxboWQrb3BWm9jVakgb+joZP/bP3rf5nkvDoHQEz/Ij+2f0gS3g==
X-Received: by 2002:aca:4c08:: with SMTP id z8mr6884712oia.67.1619018154583;
        Wed, 21 Apr 2021 08:15:54 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.233.147])
        by smtp.gmail.com with ESMTPSA id z25sm571624otm.34.2021.04.21.08.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 08:15:54 -0700 (PDT)
Subject: Re: [PATCH 1/2] ataflop: potential out of bounds in do_format()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Christoph Hellwig <hch@lst.de>
Cc:     linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YH/7+65JruUO/wsg@mwanda>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <3f79a1f7-8b7c-420c-0e70-d3b5880222bf@kernel.dk>
Date:   Wed, 21 Apr 2021 09:15:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YH/7+65JruUO/wsg@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 4/21/21 4:18 AM, Dan Carpenter wrote:
> The function uses "type" as an array index:
> 
> 	q = unit[drive].disk[type]->queue;
> 
> Unfortunately the bounds check on "type" isn't done until later in the
> function.  Fix this by moving the bounds check to the start.

Applied this and 2/2, thanks Dan.

-- 
Jens Axboe

