Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AABB65944
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Jul 2019 16:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728424AbfGKOpf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 11 Jul 2019 10:45:35 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:33628 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728102AbfGKOpf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Jul 2019 10:45:35 -0400
Received: by mail-vs1-f68.google.com with SMTP id m8so4385659vsj.0
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Jul 2019 07:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oI6s4h9Ci668lvSxyq2hz/qLjBjWeQuXGiONcZqHFE0=;
        b=Nn2M0Yv2ODpcauKK3n4EJfE5dKw48QkRs4hNtkLN7uo80fQ4h3B20bqnFBI+dGmfcE
         itUWVqykd6B110aYvyMbCTcx0kZscHPaOFP8Vc5cyMzo7M7s8jJLQ/NW0txoO6ngfxhK
         SKDDC4rVROoamXWXSpA3a5j6GBzw1zxl2ARabgbw0w1sTHl8Bjum6aV5rUlA8xBHLcwC
         UtzJxUMHAv2Jaw78r9nby+oAIUvZ5SaCGOgsBLDmlTidjEvPkvuLQ9caMKKqPBOuY9Lp
         G1f59f6BjPeKN/GH/rElv3wCApgNVmgjwotrzqD+5jMRkRcsynji6q7SulvYyFCldLdK
         lDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oI6s4h9Ci668lvSxyq2hz/qLjBjWeQuXGiONcZqHFE0=;
        b=SzkQXaIMkZBJv/mrBc25IndGivK4Gs036HCHBYoffUBnobP0AyBaWH0LLrZj0zvNHZ
         ZVYqomCW7hfNtkrLPf9GoZyKzedmFDHjjLgVknWUpKApxAEtfC1mM2uzy/Fuamaqu9zc
         qKQEX07vP/G9sTLCpa+rGN7h8i6pxNfyK3zrjFofOpajG1gkMWTdGJjcBqksm4X+rzIR
         3LU6SUKPYnfdDscURFLQUNrDOmaSQN8iY4qLyZRN4+H7urZdYhkU1PZFLhVZfukSI4ZY
         /JdypSmUcawQ6doU2yQnLH9aKgOjCGHwEQ40xrwXdgaG1L0K4pC1GgnQ3NhfQOJvcL+Z
         fH7Q==
X-Gm-Message-State: APjAAAXwcADYuikFDTmZZBJN5CSMCnEIUBFaVxnqNWXWyyhh6TWXFlXX
        AoDQQvQW+sKL/qbl/9jLucyXOw==
X-Google-Smtp-Source: APXvYqydl2JUzM4cAKn9EQUJeP6czlM8+03B+QWXg8CB5dnq9/pjDnipKFe+VcDdMSL9R4xnToDI0A==
X-Received: by 2002:a67:8d8a:: with SMTP id p132mr4738792vsd.103.1562856334318;
        Thu, 11 Jul 2019 07:45:34 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id s12sm2296626vkh.51.2019.07.11.07.45.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 07:45:33 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1hlaKD-0002V8-6h; Thu, 11 Jul 2019 11:45:33 -0300
Date:   Thu, 11 Jul 2019 11:45:33 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Mao Wenan <maowenan@huawei.com>
Cc:     bmt@zurich.ibm.com, dledford@redhat.com,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] infiniband: remove set but not used variables 'rv'
Message-ID: <20190711144533.GB25807@ziepe.ca>
References: <20190711135930.132501-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711135930.132501-1-maowenan@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jul 11, 2019 at 09:59:30PM +0800, Mao Wenan wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/infiniband/sw/siw/siw_main.c: In function siw_create_tx_threads:
> drivers/infiniband/sw/siw/siw_main.c:91:11: warning: variable rv set but not used [-Wunused-but-set-variable]
> 
> It is never used since introduction in bdcf26bf9b3a ("rdma/siw: network and RDMA core interface")
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
>  drivers/infiniband/sw/siw/siw_main.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

This was already fixed, thanks

Jason
