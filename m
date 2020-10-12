Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBEF728BAC7
	for <lists+kernel-janitors@lfdr.de>; Mon, 12 Oct 2020 16:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389691AbgJLOYv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 12 Oct 2020 10:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389613AbgJLOYq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Oct 2020 10:24:46 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFFBEC0613D1
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Oct 2020 07:24:44 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id r10so11252886ilm.11
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Oct 2020 07:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KXjyEZ75Pe4z4wSYrGbLTLW5aWcGXSPk3cloYXZRaQ4=;
        b=rDqNIIj/4RCVrCTL8/M7nsY1rbeEAMaUOaH858YqkKmjLup7HNaJas+bWUE8scDgMY
         WRgvGnWGk9gwIlxRrR1MKsaI1xyQbLtdsyiTaBFxunHI6UD73d/WqpJlABKqG9B8R1GX
         yttwsR7L2CXJ6PmPLUUCC3VNQ3704dbZ+fRx+ZpTJjhIKHGAvPOeKJ+nemH8b8zWVnYm
         AxPjX3mq06Z731A5VzfA2BLMaHqLrtUibfXqQtf32Zh1c7YkNJ/tEApnlk3dfDlTQ82l
         vIiwKheyCCeFVuWiON8Gq9fRnzlG8AziqZW4w/LBoSgyTcVHf6bAm63v6uoixd2JZxSZ
         75kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KXjyEZ75Pe4z4wSYrGbLTLW5aWcGXSPk3cloYXZRaQ4=;
        b=RlI4XPxUP72lBT6CN8gDFtdaLO8tvjTJMuaTfyXZHDNb3UknkM3KZkKlVpp33OHwV8
         eIJ8FIF+0F0Tmst2cKeB0d5CNCfYFpkUDoj2WQpon6rSk2hiJdbsWz4v0j4GU4eZYVzf
         4elZWZ7VeN0OiMxt2YaQf3A8ml5o0OyHAwwD5evazmLdAyVzg7aN1QjNWYfqC1F9Jskx
         EdGaL5oy3Siz/m0t+F7szRhRc6VNx11/p6U9mrYRZcFkQxdXUgYQgl50OPef1X2uFPT/
         SV6HQoXS27SwIxoy+yLuWFoCyg89OQHU44lZHb/SlabNItRWiPoKeqWgOQig9KGX6VFE
         kY4Q==
X-Gm-Message-State: AOAM5306m86x6smaKxcVw9LKBUODuITIFZ8DHqarlY8WNQvhNM/3Hlge
        0ieozAe9ZowgTII+Tmv+xK5JBw==
X-Google-Smtp-Source: ABdhPJznZRNU9a15R8WfJMyAoMmQCUgRYZZ8MpyOl67bGNCEGVilcETpNqOifTaQIWKqwq05Rl0odw==
X-Received: by 2002:a92:ae0a:: with SMTP id s10mr19507476ilh.289.1602512683984;
        Mon, 12 Oct 2020 07:24:43 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id c2sm7405690ioc.29.2020.10.12.07.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2020 07:24:43 -0700 (PDT)
Subject: Re: [PATCH][next] io_uring: Fix sizeof() mismatch
To:     Colin King <colin.king@canonical.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Pavel Begunkov <asml.silence@gmail.com>,
        linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201012140341.77412-1-colin.king@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <871e585c-06ca-17cb-f082-fec576bb75e1@kernel.dk>
Date:   Mon, 12 Oct 2020 08:24:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012140341.77412-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 10/12/20 8:03 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> An incorrect sizeof() is being used, sizeof(file_data->table) is not
> correct, it should be sizeof(*file_data->table).

Thanks, should be a no-op, which is why KASAN didn't complain in my
testing. I'll queue this up, thanks.

-- 
Jens Axboe

