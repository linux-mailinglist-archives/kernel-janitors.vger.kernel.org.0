Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D47221C9F69
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 May 2020 02:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgEHAES (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 7 May 2020 20:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726476AbgEHAER (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 May 2020 20:04:17 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E80AC05BD09
        for <kernel-janitors@vger.kernel.org>; Thu,  7 May 2020 17:04:17 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 59so3633109qva.13
        for <kernel-janitors@vger.kernel.org>; Thu, 07 May 2020 17:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2thaB8NuEajRNyAZPfj2ahshuNntoNHnFvdss0W1UZM=;
        b=krVrVHtWCPse14460tvZqXI94GbqW0s1ZjlGaNIV8uuD3N0NDhrRxkCvBWqjQNqLA0
         jCqs/OSu603ANt/nKyfGRwpC73aKWiiqQRWSUrnCZTSYcJxROvp59SUOaK1XOGv1nibj
         qoKZyYKqV8BZQw4hZt21PouoKPldpY4dQXhtxJmbqCZ1kfcgcuMBo3E4fXDMFtI9iIq5
         qjOgQtU5jpp9lmbUdZXhSmvSVXolkYzi8uJ2DxStsVWo2FLQ0n5GkO6eTsbmDykYy099
         3+vNanYafLz59aXcO5q3gIx9wDDuDkc6WH4JEN8vYPLE+hX7JIKuYADwCnHOdTWy7kPa
         u9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2thaB8NuEajRNyAZPfj2ahshuNntoNHnFvdss0W1UZM=;
        b=bTmykgSXwNqtoEL+hOUXAyOPmpqeLATtnL6B/sbFhmIV9ueCVCljTG9bQt11Vmbp1S
         kUHw85aZpXKrK4j21LjQSTZPew8IuI3GX+vzq5bqTgND8zlavwkICN05u4Z4v3ihH4a8
         3FWBdMPOyES1ujTkFFY1vdwktcb/8Aqnb6Lz9VJgabNRyk0+xwGZ0Iq8KeLaUYTxi7RA
         LN1n7f6gkJCP3FNeCm2I2+MRD8S3/J6YZllZdgif4BeibG8u/632//5d/ojuhwAgteQ8
         xB4/gWqwxLdurHghxwazEqBb429bcmePhyfCaYisYLteX+KB+lbNtfvuXSkEuPsICTOB
         e57A==
X-Gm-Message-State: AGi0Puas8mnMfUVf5GKB3Gaq8llWudZf1R63t1Vvwx9mY9Yuhofu3IUa
        mJAv46JaGFqhXk0iMbLR1U5wSA==
X-Google-Smtp-Source: APiQypIOWSUwEdj/qgeHNzM9aQNKP6cGb0OMtCYmu0sroLLZqUodgxtmJH26nuxT1g/GP20i0tP1mw==
X-Received: by 2002:ad4:42c9:: with SMTP id f9mr118700qvr.228.1588896256353;
        Thu, 07 May 2020 17:04:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id h188sm5476567qke.82.2020.05.07.17.04.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 17:04:15 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jWqUx-0001Ul-Ah; Thu, 07 May 2020 21:04:15 -0300
Date:   Thu, 7 May 2020 21:04:15 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Colin King <colin.king@canonical.com>
Cc:     Leon Romanovsky <leon@kernel.org>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] RDMA/mlx5: remove duplicated assignment to
 variable rcqe_sz
Message-ID: <20200508000415.GA5704@ziepe.ca>
References: <20200507151610.52636-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507151610.52636-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, May 07, 2020 at 04:16:10PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable rcqe_sz is being unnecessarily assigned twice, fix this
> by removing one of the duplicates.
> 
> Addresses-Coverity: ("Evaluation order violation")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Leon Romanovsky <leonro@mellanox.com>
> ---
>  drivers/infiniband/hw/mlx5/qp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to for-next, thanks

Jason
