Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8211B1E8A
	for <lists+kernel-janitors@lfdr.de>; Tue, 21 Apr 2020 08:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbgDUGDl (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 21 Apr 2020 02:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725904AbgDUGDk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Apr 2020 02:03:40 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7359DC061A10
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Apr 2020 23:03:39 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t9so935885pjw.0
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Apr 2020 23:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q6cPJRXuN2aseU4O71Njq6zpEr8MeM+xwy6CdRmNFGs=;
        b=GXTClrM0Xef14YYO+Wsv0lPyfAZ+8oWUatmmgc94tRA6gmj3b2cSEO+Ec8CtxzuylU
         rNWE1AqAcWIXvzJHVP/XugZlkE0QUpRweu0VOWE8QhNMQ+UcrUmp4K97IGrgHV0OINQV
         7t+BY637qa47LbuklYwrEYxxvHgjSgyj+/qn386Lsg4MT7B0nfXJ/49+LXzPxE+s88GU
         pAYaPch+02X8DBPJqw8o44H4mt9+tBgUQ8Yrli8nf1dqGwkjBMJGA7AUoGPZaB5TXmpM
         /Q3GPwJkoWFq+yJaS8RcvR6mHDzXyqirM1dsW6g8r1aNpKO4bHUxjnkgnL2RJiF/2vK4
         n9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q6cPJRXuN2aseU4O71Njq6zpEr8MeM+xwy6CdRmNFGs=;
        b=HTXpk/9HmYBztbKm+ruzrV3Jk4+zJ8ItkAQGfhFbkD2Fvtq6W6H+ZFK/eZDZ/D3JJZ
         b9KuR3UihGRvKipd77+sIw2N/zKmlGF2fzFriOjXGTxxMAu7aQs471phC3G02OW3aKMu
         Le0aFO5O90ufq7d7ZmaomLIG3kKIhtBXPfb0Lh6mZzWD0jf1eCrCtqHw6JVKzxdzN2+u
         4vnAQhW1xUWvcE1eykCzRB4BL4kdJR+zkVyZ9rURdg+2MBQ2OVKyNdBoldXp2GU/wpww
         kSfHON9aKLSVFApLe44aJPL2H5AvvVXXYskXrHkCpbkAU5KFbCqNVr7Z6Kc3XBBpab8F
         NAxQ==
X-Gm-Message-State: AGi0PuayswJTqlZBi/uNPgM+T4+Kllx/XfRQAbCkPg8gPMTNYYqRzPrU
        3FRBqW/WZlskwNFrwYDs+1obhW8OzNXo
X-Google-Smtp-Source: APiQypILZKe0CW0DyxcFIDHPPUV8NGLoLz5o2QKVAvqdp2IAl1MD+vpps3yPj3zb0YkFpncR2nhcTA==
X-Received: by 2002:a17:902:ac87:: with SMTP id h7mr7740737plr.119.1587449018703;
        Mon, 20 Apr 2020 23:03:38 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6289:7463:c15b:2de1:b77e:d971])
        by smtp.gmail.com with ESMTPSA id c144sm1342511pfb.172.2020.04.20.23.03.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Apr 2020 23:03:38 -0700 (PDT)
Date:   Tue, 21 Apr 2020 11:33:33 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
        hemantk@codeaurora.org
Subject: Re: [bug report] bus: mhi: core: Add support for data transfer
Message-ID: <20200421060333.GB4327@Mani-XPS-13-9360>
References: <20200407135559.GA109574@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407135559.GA109574@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On Tue, Apr 07, 2020 at 04:55:59PM +0300, Dan Carpenter wrote:
> Hello Manivannan Sadhasivam,
> 
> The patch 189ff97cca53: "bus: mhi: core: Add support for data
> transfer" from Feb 20, 2020, leads to the following static checker
> warning:
> 
> 	drivers/bus/mhi/core/main.c:1153 mhi_queue_buf()
> 	error: double locked 'mhi_chan->lock' (orig line 1110)
> 
> drivers/bus/mhi/core/main.c
>   1142          }
>   1143  
>   1144          /* Toggle wake to exit out of M2 */
>   1145          mhi_cntrl->wake_toggle(mhi_cntrl);
>   1146  
>   1147          if (mhi_chan->dir == DMA_TO_DEVICE)
>   1148                  atomic_inc(&mhi_cntrl->pending_pkts);
>   1149  
>   1150          if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))) {
>   1151                  unsigned long flags;
>   1152  
>   1153                  read_lock_irqsave(&mhi_chan->lock, flags);
>                                           ^^^^^^^^^^^^^^^
> The caller is already holding this lock.
> 

This function will be called from multiple places. It needs to have the
chan->lock on its own. I thought about dropping the lock in parse_xfer_event()
before calling this function but that won't really solve any issue since
read_locks are recursive and by doing so we are only making the static checkers
happy.

So I'd consider this bug report as false positive.

Thanks,
Mani

>   1154                  mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>   1155                  read_unlock_irqrestore(&mhi_chan->lock, flags);
>   1156          }
>   1157  
>   1158          read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
>   1159  
>   1160          return 0;
>   1161  }
>   1162  EXPORT_SYMBOL_GPL(mhi_queue_buf);
> 
> regards,
> dan carpenter
