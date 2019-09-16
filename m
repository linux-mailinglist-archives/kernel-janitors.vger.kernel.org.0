Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2080B3C02
	for <lists+kernel-janitors@lfdr.de>; Mon, 16 Sep 2019 16:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388254AbfIPOAt (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 16 Sep 2019 10:00:49 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:34299 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388202AbfIPOAt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 16 Sep 2019 10:00:49 -0400
Received: by mail-qk1-f193.google.com with SMTP id q203so58879qke.1
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Sep 2019 07:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0fqYDlxr0N5uVIkkaGGnEEYiGH2WIRzI/5NcWh0y3w0=;
        b=L/2doCf0astVHUJLnwTi6wtOwayW2zOox9g4ymEojf7QWssFRtvD/Pw/LXP/pHMM2a
         qi/IK76Z5NEMGbVOzfUcNqoF8tVBFEvKvfzeKYudMEGqpk4uSUzWVMDIW6pR0T4Lqgpw
         z73SeLDbtyzQ9QGMR8sc3NkLGN8TJI4KC++oOAZ2TGe5SfZDujfncgWD2Ws6mmaYDvfB
         fBzuuOK+v+thMVPpcFsCxyJhcJdguY+le2GxBggAaYLYl2o867oHKsXW58UbuVXGNysf
         1SgO8V2745rN/m2MgyGeDlq57bHlNu49Yciww4zaGDUW4aGuVYJ1Bw2NGA1LL2Ft8huJ
         u4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0fqYDlxr0N5uVIkkaGGnEEYiGH2WIRzI/5NcWh0y3w0=;
        b=QXIZW3f587HmUXb72KTuTHEs3UGJEzJLUS4bACW4oCjduLol4ARi4MZjPKRLSMc+jQ
         Bq+68wdLWbWvBaSHlHjSDnMd7FgvbEp6ehIQAeHefTEjUV7U3Jm4NdUQl+VinWKtsRHJ
         opKjVuXV/uQNNUH8hDEvHv7Lv+C1I6af1VWWUjXrhKw+50mvYEuNGe8vUnDvwDzxb5kX
         bu5RfSK6jLwwlMSydI9u9f/B9hl54e7MbacmAamZBJPMwFLrK4so+7414EtAJniqEyP+
         OmnccyNBsCenXUvRYsFlMrzDv5sUiXZ/ooQc8Co1YmGu/LiTO0pKXOD68ZrMz0Pz7ZSM
         6bTQ==
X-Gm-Message-State: APjAAAV0UfQSYueD/6FDBW4AhjllruClGSlRmObIGZPxGhgSTSCZZXr5
        78iirmaVwrElL0NEOPDlqy9bAw==
X-Google-Smtp-Source: APXvYqxxB3zBTqNVBTFNdr7OQD6ICS1BkiBLFKIZmh86Es3HLPuJb96ZUnqJM48IjKPlU5hha4ShGg==
X-Received: by 2002:a37:a3d0:: with SMTP id m199mr51483qke.492.1568642448678;
        Mon, 16 Sep 2019 07:00:48 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-223-10.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.223.10])
        by smtp.gmail.com with ESMTPSA id b130sm18702024qkc.100.2019.09.16.07.00.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2019 07:00:48 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1i9rYd-0001b8-Kn; Mon, 16 Sep 2019 11:00:47 -0300
Date:   Mon, 16 Sep 2019 11:00:47 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Colin King <colin.king@canonical.com>
Cc:     Selvin Xavier <selvin.xavier@broadcom.com>,
        Devesh Sharma <devesh.sharma@broadcom.com>,
        Somnath Kotur <somnath.kotur@broadcom.com>,
        Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RDMA/bnxt_re: fix spelling mistake "missin_resp" ->
 "missing_resp"
Message-ID: <20190916140047.GA6108@ziepe.ca>
References: <20190911092856.11146-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911092856.11146-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 11, 2019 at 10:28:56AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a literal string, fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/bnxt_re/hw_counters.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next, thanks

Jason
