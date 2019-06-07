Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E079393C1
	for <lists+kernel-janitors@lfdr.de>; Fri,  7 Jun 2019 19:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731081AbfFGR5c (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 7 Jun 2019 13:57:32 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:46355 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730881AbfFGR5b (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 7 Jun 2019 13:57:31 -0400
Received: by mail-qt1-f194.google.com with SMTP id h21so3246357qtn.13
        for <kernel-janitors@vger.kernel.org>; Fri, 07 Jun 2019 10:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5MddV+Sg45RFyPQPwq6EPVm3wo3sSDcpYJ17hnXLFXU=;
        b=dosAQ2Nn0ydTmNOgvwFg2l+msfvRcAS1U5jrslXA9t4l6S08L+U1MG5oxZ2FqUa23+
         Kaf6kSeuQh7xc3qFnNyZtsUz67X5rbCIVZcfaDn0VDdpzvFwgWSbwkV0B+jNAstC1my2
         0LUJy5bvOU9ehS6dRjgtWFiq1MybK4xEgdwWtgVwqr6KWf1ahvQ5ZutRw0cbsfzb2hBo
         usV1pW8EeyEk2wC6IQ5s1qvYEXhP+KHVkIBVGyxgo3hkOeeJKMRLxDs9b1NkatMC2bCT
         DUwG96H4WkaqFfH5e86F0PwtPrMNb41hU3OtZ/7qYqgzvjXPrxKk/EZKuEJkIqhG6I0r
         JyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5MddV+Sg45RFyPQPwq6EPVm3wo3sSDcpYJ17hnXLFXU=;
        b=ZZSa72o/9nRYr6JZLM+rXWog5saDtOHZXOl7OfTLVpr8VuA3GA3gRm3FRZQBxQXB7k
         MbTfXoE9nZdzrwy1/MHUKKDhUgl9fuVSXZkBolfIgyH8CU1n2TqjUPFT3fzdFm4te9zc
         pxQci166WLoeNfkNtAkw0zxq3Ul56GuIeXfogiP4of9MTnHH2Vq8WC1WbTFMQDxwY2eI
         yM44WWw9MsKGOVVXp+Yhh+mAM0aw2BEdCTyac/ByHqG4LDgITcEGqb3IZnIjYVBHi8yc
         uAi3ZNeUlUsYxjSMrS236+79JR5kS0fbJdBaWKBJIPTa/6D24U1iW8UJbJdqPX1lZqzr
         4yAQ==
X-Gm-Message-State: APjAAAWgx7+EADHpu+L44xwL3Yza55t8zlQrvnj3PDFcdKAQL0lWt3dw
        S0eiLMxgZmyOm1yQ0Hw/dwlxJQ==
X-Google-Smtp-Source: APXvYqyW1TURwevhvnQxF+uKcNumtSWbviKcgyMAha8x4HHbW8bvgpah7hMJTZx+6UyXiYV4aAHxdw==
X-Received: by 2002:ac8:43d8:: with SMTP id w24mr47116757qtn.25.1559930250734;
        Fri, 07 Jun 2019 10:57:30 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id v72sm702497qkb.0.2019.06.07.10.57.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 10:57:30 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1hZJ7J-0006WW-Pg; Fri, 07 Jun 2019 14:57:29 -0300
Date:   Fri, 7 Jun 2019 14:57:29 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Colin King <colin.king@canonical.com>
Cc:     Lijun Ou <oulijun@huawei.com>, Wei Hu <xavier.huwei@huawei.com>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2][next] RDMA/hns: fix inverted logic of readl read and
 shift
Message-ID: <20190607175729.GA25014@ziepe.ca>
References: <20190531092101.28772-1-colin.king@canonical.com>
 <20190531092101.28772-2-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190531092101.28772-2-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 31, 2019 at 10:21:01AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> A previous change incorrectly changed the inverted logic and logically
> negated the readl rather than the shifted readl result. Fix this by
> adding in missing parentheses around the expression that needs to be
> logically negated.
> 
> Addresses-Coverity: ("Logically dead code")
> Fixes: 669cefb654cb ("RDMA/hns: Remove jiffies operation in disable interrupt context")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_hem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next, thanks

Jason
