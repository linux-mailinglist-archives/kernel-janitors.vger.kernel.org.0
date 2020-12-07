Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 354502D1448
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Dec 2020 16:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgLGPD1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 7 Dec 2020 10:03:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgLGPD0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Dec 2020 10:03:26 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BABC061794
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Dec 2020 07:02:46 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id ga15so19928291ejb.4
        for <kernel-janitors@vger.kernel.org>; Mon, 07 Dec 2020 07:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y5an9IpqP76fFEfITqq2IfrQNyjf5flDTbngmDsa0e0=;
        b=b0PNzOJCtcJg4O6coaXXwXy4BPnkF0lQigfsuS/Eux90pqnc8vuLYlLzaDrAzL4nw9
         8ur8vzz9e0suu4AP8UKavHCm2e3dUXKMAQ+Tc51lywhBH29uIOzdjn8I/YAVi4lFtrYC
         351Alkx/e3g3OBRpwWukHX2WrZtnbdW6tfqqwu6uU+f0XBu0m7lsi1zFFihHPapOT8wF
         Qo6gxm1kLhBuCb7sPzgKvRtuqZWVaQ5NgRQucwzG7mCRbB7yBBsgF6k5V9j39Kw8JrqL
         HLoOu8mwLaoKlDMHrzCuS69mqtOFzCDk8s/FocrZNzZeRjzGQSfybRgb8G9Zzzvi6swq
         ogOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y5an9IpqP76fFEfITqq2IfrQNyjf5flDTbngmDsa0e0=;
        b=bxiErIgRfRHWRb2jKtw4TxoUihs9E1+i9wJ0Nc/6jT1PDeos3TKV+ERqi21OKv4f3G
         n5myq/7w+eSNjxFk3QdnkEsqqNW/EqAY9XSaUf/JjeVT/uIym6TwER9DmgKBrOo0VRRP
         +JwUG7CZFIs9S7mmcJLISuqY5zxReFsLMuE1IhRn4eLUW/vJNOBciKAr+fwa9+8vNvrd
         O3/qjqeJi5VMMHonuHC7O9UhNTfyrH5NPFlz3f3rN3fC73FINe03v0sor+dgcA4Brrjf
         MUcaBzKJImfHdDNGM7AQelw3NIasIv2wbG30D9FkaGgKSM7eaFWq60+SF0Y5U44zmVO4
         xN+w==
X-Gm-Message-State: AOAM532j7u5GKqjT7105O7QpWJIP0hRsv/UGxD/8gHnru2WPEolpyu1r
        YUkbafldEXCm8l/Tb5QQa3XVt91JTxvp54GFsPyzVg==
X-Google-Smtp-Source: ABdhPJyjHAk4PRj3OIAv9j3xOZdDWo4qndoe9LdmKf3qEzqcDgfah7gXM5L/AoRSiabQqEhraV7b8RX0+RG4TP2SwEE=
X-Received: by 2002:a17:906:9452:: with SMTP id z18mr19468443ejx.389.1607353365047;
 Mon, 07 Dec 2020 07:02:45 -0800 (PST)
MIME-Version: 1.0
References: <20201207145446.169978-1-colin.king@canonical.com> <afd6edda-460c-8488-6e63-438053e88eac@kernel.dk>
In-Reply-To: <afd6edda-460c-8488-6e63-438053e88eac@kernel.dk>
From:   Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date:   Mon, 7 Dec 2020 16:02:34 +0100
Message-ID: <CAMGffEmKW=wa3_UiJA9+SLKcB0q9WmOMThQwoe0pc9oQQ62phA@mail.gmail.com>
Subject: Re: [PATCH][next] block/rnbd: fix a null pointer dereference on dev->blk_symlink_name
To:     Jens Axboe <axboe@kernel.dk>, Colin King <colin.king@canonical.com>
Cc:     Danil Kipnis <danil.kipnis@cloud.ionos.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Bart Van Assche <bvanassche@acm.org>,
        linux-block <linux-block@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Dec 7, 2020 at 4:01 PM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 12/7/20 7:54 AM, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently in the case where dev->blk_symlink_name fails to be allocates
> > the error return path attempts to set an end-of-string character to
> > the unallocated dev->blk_symlink_name causing a null pointer dereference
> > error. Fix this by returning with an explicity ENOMEM error (which also
> > is missing in the original code as was not initialized).
>
> Applied, thanks.

Thanks Colin for the fix, and thanks Jens for taking care of this.

Jack Wang
