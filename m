Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48B5231716B
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Feb 2021 21:31:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232149AbhBJUbI (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 10 Feb 2021 15:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232880AbhBJUbF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 10 Feb 2021 15:31:05 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D245C06174A
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Feb 2021 12:30:25 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id m6so2060674pfk.1
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Feb 2021 12:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PJmyrPMtY2yl3dmSpn8becwEl0NxjN1C6ENVTeSAzlE=;
        b=X7XpCWjvk18kXKw4kgMeu1XUk8U7GbMdhpE5e+l1++YScKxVkxab8MNbcLqNr8wBrr
         ZJZ818OauFIFOg8P7lTA8QQ4ETqmSmWEKzpn0fV3uJFPPt1PO/737jzcipfov7sQK3m0
         SXXOqLOEV46SOP162eAoPlNnq2fEEZr6ePUJuZ3ggRxeuC08BXeJ61psj8R6jcDJqUYy
         +gvEM6tGLocvi2BGtrERzlFYVIAg984r9+5DSJ6uNo1EueaGvzaLwwLhFNU6G60pKHOp
         ie4f7uaIrDinfLIjYZLqb51AVW716iBugIMb+XLb/au/6HDLHquWlyrkTfRDhmb4tCMk
         AEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PJmyrPMtY2yl3dmSpn8becwEl0NxjN1C6ENVTeSAzlE=;
        b=CQUC9onA9XqJsdvAxBnCxKmzG1z7+VQSK/A9qGrglEDlzFwj/3NL9hJGCa/VhlV3JI
         vj/itDtdpT+IXC6lIo0YeWwK9MO5tOcu3Ufv6RDY6rpmE6Q+K3X5nflrIRkK8zSIvQIK
         0JYazLuCZrFd+YYe7kADCJpATIYMcCFxMA6QlVfU84eNV6OgWbAi+AGDCRRI8ZdD60uJ
         Wk5ylWGaQrSRL5D3V3OIiCJB757paOVzvjQ15fz56ZALnVAGsfebu4rd2r96/k8A/RqT
         pgsy74W2Ua5mAvDGcQkbnj69iusaFpRvCESzP2uYEKhrb7yTnP8SuZYTf/Sbpopc0YeR
         JQVg==
X-Gm-Message-State: AOAM531BzdaXnSEOsKS3IXqDkzl4vl10Yg99AFNGVlU7sPPl3dg28gOD
        0dS7vxQOneuKiKeN3oubF+WPHA==
X-Google-Smtp-Source: ABdhPJx/uZo8a0fja85mAj0hfq+nTFT8A2F/S0ELEgZ/8HdLoCv/0e1g8z3yendy4HZ4EAakwBh3rA==
X-Received: by 2002:a63:e54f:: with SMTP id z15mr4664275pgj.247.1612989024640;
        Wed, 10 Feb 2021 12:30:24 -0800 (PST)
Received: from ?IPv6:2620:10d:c085:21c1::194c? ([2620:10d:c090:400::5:a5c1])
        by smtp.gmail.com with ESMTPSA id it6sm2915538pjb.15.2021.02.10.12.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 12:30:24 -0800 (PST)
Subject: Re: [PATCH][next] io_uring: remove redundant initialization of
 variable ret
To:     Colin King <colin.king@canonical.com>,
        Pavel Begunkov <asml.silence@gmail.com>,
        io-uring@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210210200007.149248-1-colin.king@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <7cbce70d-741e-2948-d1c4-9f30a89d029d@kernel.dk>
Date:   Wed, 10 Feb 2021 13:30:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210210200007.149248-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2/10/21 1:00 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.

Applied, thanks.

-- 
Jens Axboe

