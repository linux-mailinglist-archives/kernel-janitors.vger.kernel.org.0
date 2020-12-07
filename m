Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C24A52D1443
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Dec 2020 16:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgLGPBw (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 7 Dec 2020 10:01:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgLGPBv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Dec 2020 10:01:51 -0500
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CAD8C06179C
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Dec 2020 07:01:05 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id x15so12456041ilq.1
        for <kernel-janitors@vger.kernel.org>; Mon, 07 Dec 2020 07:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/bBHUQrvjqGZKDRY7e20G9Yb5H//5ix3nl8L9R+aPQo=;
        b=xOilBRukRNJyPZNFY5hLbRzb1Gs9g0uZTueG5TRB8tT3qA70yXcj9q5EDzp4VtcJ+n
         IeqTSkXAcWYtIh9nGk2VgDcaOPEppOJBfSjk+27iM1CvC8aPXqBkRUHetHAQqh1Y38Vk
         mmFAXo0XW4k5dHO+p4bVj8WaD8n0aKh1yCAHaRbKmz7qVXpHtuUiqpLis9dzAXq8YZ4K
         deUWEzNwle5vAbGOSYzZHA272ZVfaw9biImJpTUk5aDH6wDtLwp1NWLMDxRfVmtBmVMV
         jqG2jJO280JfegppbOYkop/MJh86fWHqkwYpQ1T0A9S3jFzsNC36Q0eQVAdsYaE0I9tO
         YLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/bBHUQrvjqGZKDRY7e20G9Yb5H//5ix3nl8L9R+aPQo=;
        b=ULZnZGOQkjVAJXO3wTTKrBKG/fkVaB9YZuPJh2vJAlLiTRhmHSADh2VkZ6WsSqONwf
         FTwDRM/1b3kNHhUwXaYcE3nDOS/TLJZNp0/hKWOVuoOYlrMp0KrWXy+GfBdJxhiP6jPj
         CovpomTVX75KjQaJVumN67l6cF3dqSuZDv2ynPl3pHfa9PvjvkCHgiz3PKbEg1Mmj1OA
         xhKcxCgSzDGYZEMlvsoQSwoAOWDJLFUxGUMC6Pjmk5UwbC0WfDL9elUj9eyxNClC5S22
         q4q5oNO+re8W89s4BiVQuxxgeCwe8gxuikqY2rDlMGrIRgAtQO+V7T56vMHhocklopLY
         o2zw==
X-Gm-Message-State: AOAM530xLrigHRgRa+ZjOPR7N/t9UDha0SU2KzUL8QtDBh0Xuj5yfmEI
        RrgRKgxW9CpuPl4IplzYLq9PVQ==
X-Google-Smtp-Source: ABdhPJwN5OpNgjENZj6A0zQKCw0NcFFJCeOAZN+qvKhKU+taiVRWJ8xDNSifCkbf29h7nas2WJzkcA==
X-Received: by 2002:a92:6512:: with SMTP id z18mr22765471ilb.220.1607353264601;
        Mon, 07 Dec 2020 07:01:04 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id e18sm7455294ilm.77.2020.12.07.07.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 07:01:04 -0800 (PST)
Subject: Re: [PATCH][next] block/rnbd: fix a null pointer dereference on
 dev->blk_symlink_name
To:     Colin King <colin.king@canonical.com>,
        Danil Kipnis <danil.kipnis@cloud.ionos.com>,
        Jack Wang <jinpu.wang@cloud.ionos.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Bart Van Assche <bvanassche@acm.org>,
        linux-block@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201207145446.169978-1-colin.king@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <afd6edda-460c-8488-6e63-438053e88eac@kernel.dk>
Date:   Mon, 7 Dec 2020 08:01:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201207145446.169978-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 12/7/20 7:54 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently in the case where dev->blk_symlink_name fails to be allocates
> the error return path attempts to set an end-of-string character to
> the unallocated dev->blk_symlink_name causing a null pointer dereference
> error. Fix this by returning with an explicity ENOMEM error (which also
> is missing in the original code as was not initialized).

Applied, thanks.

-- 
Jens Axboe

