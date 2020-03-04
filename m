Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 783D4179806
	for <lists+kernel-janitors@lfdr.de>; Wed,  4 Mar 2020 19:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730059AbgCDSgj (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 4 Mar 2020 13:36:39 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:45018 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725795AbgCDSgi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Mar 2020 13:36:38 -0500
Received: by mail-qk1-f193.google.com with SMTP id f198so2636011qke.11
        for <kernel-janitors@vger.kernel.org>; Wed, 04 Mar 2020 10:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BTZGkR5oJbEVIGvYgx8yo/76DyQUafIlIN4hqBpP97M=;
        b=OjnU5uVrfIPDZs47K0nAL/eBE/nD5yfzsJrdujAUAEZcfHOxLjR2q5tjKvwGOuyzhL
         rATMCnRPtkUfYzns52w36tXGs6cNTeA1FUh/ZONJjzjtZ+j+VHppGG7UtNyPnksZ2ELF
         gYlNGHqJRU038L7+GoUXabYJbp71QMwWFYjAbDvn9nVuzPWDKp1N4Uc24GYh122RkZEJ
         aoP8icI/jaIPPbHA46okbonqnhBt5f6BkswyYCY6EDpcp6C1Iah2bk0degti+sWoU4Ah
         ut4X96UCj3ZocInP2p11AK+YF9jnpKNeTX1pVnmY/Qw1lXmMYHk4qnaKeAlmhmltptX7
         1+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BTZGkR5oJbEVIGvYgx8yo/76DyQUafIlIN4hqBpP97M=;
        b=U5Ew06GRqqMrtOo9+J25ozuxNrf+ZMhuZCo0mcmXYyoFSl99uMmWQvPxV+rlYIhEL0
         zDX9rIY8o9JdscC7xQN/CoN4IFs1+ZW4sB4PdyWA7VrigawzgQVY9zovVZsEpw+BcmM+
         Edwr4nuFWNhbrckzUQeh5becEuFAbQp5e/CCQtClKto9W3TPAisyqCJKWbhDErt3xoan
         ApGOLVhGZ6WoZY6ltabG9fjb32fwBFuWVEHRXiflUhF1+op9spRFRacYscflTVh6yf0k
         G93BMQzSqf+P0nL58vlyR/GBErBnScvCRnBiuJfu8aHN5HzU1mnWJRNQ6eSLIWInZZ3r
         nh3A==
X-Gm-Message-State: ANhLgQ1+WTYyvaZyP3D+mCHHdXcwX48NRvu0vjmwTP3XZ8e7Xd7bVsRG
        TpLCfNZR6YCERztS2fIcYB0IXS6ox/G9wA==
X-Google-Smtp-Source: ADFU+vv3IY/dEewbZ3PVzTR22dzcBCye571kokXxK2nB/kL3DOI7LkFGdmEpCqtLU9gFGOacLPQ1ng==
X-Received: by 2002:a05:620a:13a9:: with SMTP id m9mr4368318qki.359.1583346997748;
        Wed, 04 Mar 2020 10:36:37 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id w13sm7822900qtn.83.2020.03.04.10.36.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Mar 2020 10:36:37 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1j9Ysm-0003Tw-QC; Wed, 04 Mar 2020 14:36:36 -0400
Date:   Wed, 4 Mar 2020 14:36:36 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Colin King <colin.king@canonical.com>
Cc:     Lijun Ou <oulijun@huawei.com>, Wei Hu <xavier.huwei@huawei.com>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] RDMA/hns: fix spelling mistake "attatch" ->
 "attach"
Message-ID: <20200304183636.GA13359@ziepe.ca>
References: <20200304081045.81164-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200304081045.81164-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Mar 04, 2020 at 09:10:45AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in an error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_qp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next, thanks

Jason
