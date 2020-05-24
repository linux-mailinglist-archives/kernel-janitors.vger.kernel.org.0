Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 511211DFD4F
	for <lists+kernel-janitors@lfdr.de>; Sun, 24 May 2020 07:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgEXFZw (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 24 May 2020 01:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgEXFZw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 24 May 2020 01:25:52 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADAA8C061A0E
        for <kernel-janitors@vger.kernel.org>; Sat, 23 May 2020 22:25:51 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id h4so12450157wmb.4
        for <kernel-janitors@vger.kernel.org>; Sat, 23 May 2020 22:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nYK03Zf8A4QRGvYjq1J/JbVV9Q191m3stlB7yaE8mBM=;
        b=ZYkeA13KjOyG/l4nP/+hNatH99lolT/Hocmkrr98p5EqFjm0l8+ss8o0DtXQ93+lEI
         r3FXi8N7+7XbXefNY65pp74fGPgKpJ0iCY48lNu7JohJe8XdMZgVkSrHroFOVWnVuUl8
         3XsSQ1XZdabfhtofLT2qsyZFC4eGab9DQDy4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nYK03Zf8A4QRGvYjq1J/JbVV9Q191m3stlB7yaE8mBM=;
        b=T84oN8ii6YbcAc5UQK4hik+Xd1GNdJCbhRo02nlInxSTGLRQdqCGfA0dX7orkIYQL5
         tiwKpaddlcMFtnAtMLSNjI07kq1kncPa1SEf9Uh+F5yd0AdSmGx0xpJveB1Wo9pLhFgQ
         AOdiGBbg7g3PKG/79Vk34pOI+7zBakfyCKUGPUMI0QddTB6R7TLf+HsP6VJ/ZI8RKeCC
         9XG3vJBJh5N2EQidXh6lkQeqO31VpELTmmOkRzd+HBKJkwSfo5IzVtPj7HJpgj+26WZq
         lwu47zYw7YpVvt6E6T5U2+i0ha0382z2wUEv686zjn0zVC/j5kmZrKYolADaN2jp1gRv
         R+zA==
X-Gm-Message-State: AOAM530XxNMifToWWD6papY1s426WPkEMfh2kL+vErfGVEPzt5/V0sOA
        u2TuHGaIbCzyiAYTgJhv/Rtxdg==
X-Google-Smtp-Source: ABdhPJztxOW+CvCyvjjJK2kKG3kRgTOymqG/BpGG71EsVIeax5dwD3kAbI+S333HEhbFU/CSZJlalQ==
X-Received: by 2002:a1c:1f41:: with SMTP id f62mr2016853wmf.84.1590297949874;
        Sat, 23 May 2020 22:25:49 -0700 (PDT)
Received: from noodle ([192.19.250.250])
        by smtp.gmail.com with ESMTPSA id m6sm13498083wrq.5.2020.05.23.22.25.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 23 May 2020 22:25:49 -0700 (PDT)
Date:   Sun, 24 May 2020 08:25:42 +0300
From:   Boris Sukholitko <boris.sukholitko@broadcom.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Edward Cree <ecree@solarflare.com>, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] __netif_receive_skb_core: pass skb by reference
Message-ID: <20200524052540.GA11080@noodle>
References: <20200522101553.GA41044@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522101553.GA41044@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On Fri, May 22, 2020 at 01:15:53PM +0300, Dan Carpenter wrote:
> Hello Boris Sukholitko,
> 
> The patch c0bbbdc32feb: "__netif_receive_skb_core: pass skb by
> reference" from May 19, 2020, leads to the following static checker
> warning:
> 
> 	net/core/dev.c:5256 __netif_receive_skb_core()
> 	warn: 'skb' was already freed.

IMHO, the static checker is wrong in this case. Please see below.

> 
> net/core/dev.c
>   5230          }
>   5231  
>   5232          if (pt_prev) {
>   5233                  if (unlikely(skb_orphan_frags_rx(skb, GFP_ATOMIC)))
>   5234                          goto drop;
>   5235                  *ppt_prev = pt_prev;
>   5236          } else {
>   5237  drop:
>   5238                  if (!deliver_exact)
>   5239                          atomic_long_inc(&skb->dev->rx_dropped);
>   5240                  else
>   5241                          atomic_long_inc(&skb->dev->rx_nohandler);
>   5242                  kfree_skb(skb);
>                                   ^^^

Notice how the *ppt_prev is *not* being set in the drop case, when we
are freeing the skb.

> 
>   5243                  /* Jamal, now you will not able to escape explaining
>   5244                   * me how you were going to use this. :-)
>   5245                   */
>   5246                  ret = NET_RX_DROP;
>   5247          }
>   5248  
>   5249  out:
>   5250          /* The invariant here is that if *ppt_prev is not NULL
>   5251           * then skb should also be non-NULL.
>   5252           *
>   5253           * Apparently *ppt_prev assignment above holds this invariant due to
>   5254           * skb dereferencing near it.
>   5255           */
>   5256          *pskb = skb;
>                 ^^^^^^^^^^^^
> Freed and also used in the caller.
> 

Although the skb may be freed at this point, the callers have their pt_prev
being set to NULL. Therefore none of them will try to use the bad skb.

Thanks,
Boris.

>   5257          return ret;
>   5258  }
> 
> regards,
> dan carpenter
