Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB2D4219046
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 Jul 2020 21:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgGHTPu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 Jul 2020 15:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgGHTPu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Jul 2020 15:15:50 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 207B0C08C5CE
        for <kernel-janitors@vger.kernel.org>; Wed,  8 Jul 2020 12:15:50 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id c16so48220494ioi.9
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Jul 2020 12:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=G6EbXcVyYEsUMBIz14DNe27S0g/BGfSgrd9wkD0hMhM=;
        b=Ec0p9V7lskZAd3VrNhslvTyhOgWGUacuHL9OdOKf59yOIRsT1fOFUXaqtPKbWniOCA
         pcr04q3HZEaOTvUghPPTflbxoTnLJYTLsKRaB9CT6SKLKuKESKWphDO1GlN6EFpnkRkA
         d5/o8ankakO8fSVuq0NwgT8CkyC0Tm/qGgAABhKdn4nwGDsZV1Z0qKWwRLSog0+0Qnbe
         6vXRciAAsjFTcYCsWEk2LLoYRhK948qmI+WRaxITBipDcTVvfuPVunZeQPXtdanZoI4v
         UBXCtUVA2qJFJHDRAROuZ+pv1eJKTFCWlGa0XMvmtSKaLS21xdV3Gai4q//uAGi3QqtF
         PQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G6EbXcVyYEsUMBIz14DNe27S0g/BGfSgrd9wkD0hMhM=;
        b=pfywjL/D6iGFVzt2KkGbmuhTKbvfJYvVlckhUxbGkILjHphSysYm7bymAd4SU/we+d
         19hV0xpGcHCofDxEgvg51NmR4fxd7V9ogwKrqWwdRe9HBJXovVhDqGp2zrJEssdwxnt1
         PWkQn+GShcbJIUux/x8DbiniszIvugYNEHFeIRpVq1SyaimXCXQ1JOr2wMANooT9e5qp
         g0iZkO48ncdnZf2lXI0oF9c+Fio5OUgCFu3SrYzu1NcNyZ3gkAB7ZXHPf7HCj0NXAZYU
         PEMBl3hKbJpiJcPAeQ3iUTL+MluZi8PCkpMjO98WIsm84Z2t38Qhheg7SrlMv4/TGCnF
         EFmA==
X-Gm-Message-State: AOAM532BJisRIHx7BhZKmrqHPMMvFcP9vHbUipE0ZisXj9B3IirVHKqI
        +2wzKeLNv+kJCRwpMQWywnHCghA7tIsTaQ==
X-Google-Smtp-Source: ABdhPJwO/NTsffQFy0va62QN1Tl2qDwwkeZ469kY7yrBfR3+c1hWxw+u7D34MpElyJ3fImdVlRuGbA==
X-Received: by 2002:a6b:8b11:: with SMTP id n17mr38074596iod.155.1594235748854;
        Wed, 08 Jul 2020 12:15:48 -0700 (PDT)
Received: from [192.168.1.58] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id e1sm410263ilr.23.2020.07.08.12.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 12:15:48 -0700 (PDT)
Subject: Re: [PATCH] io_uring: fix a use after free in io_async_task_func()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Pavel Begunkov <asml.silence@gmail.com>,
        linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20200708184711.GA31157@mwanda>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <58b9349b-22fd-e474-c746-2d3b542f5b23@kernel.dk>
Date:   Wed, 8 Jul 2020 13:15:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200708184711.GA31157@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 7/8/20 12:47 PM, Dan Carpenter wrote:
> The "apoll" variable is freed and then used on the next line.  We need
> to move the free down a few lines.

Thanks for spotting this Dan, applied.

-- 
Jens Axboe

