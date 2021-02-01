Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D5630AFE1
	for <lists+kernel-janitors@lfdr.de>; Mon,  1 Feb 2021 19:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhBAS6A (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 1 Feb 2021 13:58:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbhBAS56 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 1 Feb 2021 13:57:58 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA85C06174A
        for <kernel-janitors@vger.kernel.org>; Mon,  1 Feb 2021 10:57:17 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id 16so18569200ioz.5
        for <kernel-janitors@vger.kernel.org>; Mon, 01 Feb 2021 10:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Jsv3vyZa66t7tee4Ufeuta3p2dV9PPOMykNPk31Fui0=;
        b=wQ2QRoCO68p2wvluwHKbXJ6kLWJoj6ZH7pf/zK/jkpEgm5yfvk+ZAwQG7cpB4/Bm0A
         b00A7EpJFWe8gVjM+szFwdmoO2uaQDqT0jX+Zobj12gzdGangcguN7lm6V58g6GsOi4g
         Zj0WtG1ZYgKc7HtP93da+85GQPQCHx8GW4BNWJodBBL9yu6TuDzT1rfSiTE8/p9uXExg
         UdKYR5ahJ4h4mrkSa9rRYpJSBU6XC1OGcuazmbkdRjB2F19240mnM++fbHiQHmDAgcQT
         lN7cT/15dbzYAcC1OR6wQJFQC+71Fdi4oHcmRxwf8wIlmtY9/0iEBzPl9uaOHllPjMId
         TTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Jsv3vyZa66t7tee4Ufeuta3p2dV9PPOMykNPk31Fui0=;
        b=QpWXXHCwsdXgh+S6cwcD6f8ZPD/N1BATBCVwHzn53XorXdRQ9UnFHud/OXA1u+2lsf
         6Fdv/dbWoJUxPFIv2bnuv7LqIhNOfQXZZ2Qljf4PSs6u5yQmhQGi01uXhx7E0d5dObt8
         jhiJjYz9U8EBfh7CkmRalNOUoFPCtDo2jx3LemRVqjCU+9c2M9aM9O+9qDCCnwkTb4V1
         za3xrZvgToskXwyAIOOwROCwwEVyUWfniKe/hrXPjts3EO1TjDXXR0dUvQ7QaYzQBPrn
         fMoBKEt6FNOuLXwEIJME4KeLKwYY6mG27twU0fNQ0aoXjrdT5sJVJdqClWjaoOldlAcO
         jwJg==
X-Gm-Message-State: AOAM530lgII4qbG4mXAm3AEXK/S4AWSAMPVxN8Pkib6f9nfYtb/HMtNl
        a5wGJezsjJWZm4w7VeY7vAvWujAHgM6l5vVd
X-Google-Smtp-Source: ABdhPJwggjUj4DBGEfKTj9stcq2mP3nHEIL5MQZGiiZyPsO/XHyrxXdLCFhNcnmwmidHVkecucwp3Q==
X-Received: by 2002:a05:6638:42:: with SMTP id a2mr6674489jap.99.1612205837221;
        Mon, 01 Feb 2021 10:57:17 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id n7sm860569ile.12.2021.02.01.10.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Feb 2021 10:57:16 -0800 (PST)
Subject: Re: [PATCH] io_uring: Fix NULL dereference in error in
 io_sqe_files_register()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Bijan Mottahedeh <bijan.mottahedeh@oracle.com>
Cc:     Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YBfyzmcP1N6jpDjo@mwanda>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <76165fad-a61a-a59c-6b6f-d8ae151bed86@kernel.dk>
Date:   Mon, 1 Feb 2021 11:57:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YBfyzmcP1N6jpDjo@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2/1/21 5:23 AM, Dan Carpenter wrote:
> If we hit a "goto out_free;" before the "ctx->file_data" pointer has
> been assigned then it leads to a NULL derefence when we call:
> 
> 	free_fixed_rsrc_data(ctx->file_data);
> 
> We can fix this by moving the assignment earlier.

Applied, thanks Dan.

-- 
Jens Axboe

