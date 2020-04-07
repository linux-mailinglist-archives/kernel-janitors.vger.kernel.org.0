Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3D71A0F4D
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Apr 2020 16:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729205AbgDGOdM (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Apr 2020 10:33:12 -0400
Received: from mail-pf1-f170.google.com ([209.85.210.170]:40078 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729196AbgDGOdM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Apr 2020 10:33:12 -0400
Received: by mail-pf1-f170.google.com with SMTP id c20so884691pfi.7
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Apr 2020 07:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=k3mdrzv8ov6qNww8wQI2y8I8f4cWafSu+jyJH6lIzWQ=;
        b=ucXpfMyZVUiIB1zisShFYsnfM1jJ70pSDdmoevo5IX4FPFuSCcy5szhQWtqbBylwDh
         xWj/HM2Q7IKyNo0NtdsK8X2NZzal157uwdff6v22eLC3ZGM+NMcicvLVTx3kD8woc/EP
         EXiFQAkVsYzUn7gVPJccda5ah5Q8vvtpWIIhq7oMSizR8N9QbQnIVmTnnoF7Zs/YelZd
         CB4rIwo28flQpMysLQDWaLXcojbeWs1W356L+h1sRuAZyAQN7Tuzlr2MPVOT0Zmz+6EU
         eiCOkRGSV8qGMiVyFuAjGP4VakWUTPXFGoGZg7PeTVfXh9bT0gqE0Zwokt3QIh2epeJh
         44TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=k3mdrzv8ov6qNww8wQI2y8I8f4cWafSu+jyJH6lIzWQ=;
        b=VfK22ngJeqhL1bTTxfqAA10dhQfJutXZJnD1bxp8oEQPMNh9ii938J36zojVj+OzqC
         pcvjbTEiO9OMeOQmBGlbQL/hxdWEaSlLj2JlFgZtDN4pSP8mM2j2MBujPm2Wfu8KE7CE
         vmF3Qg1dXXgq3h5XUQoHG1G2gdBktLowzToPI2BVy82ujATXMuFW1QLfWResMS3dy7uZ
         0Z4do7zoeQrKd9CkHobXJg90F4AGRQ6mo45z1+RD2WPGDb0CRzpsSCYdpD5G3LgxVSTt
         kR35HPO0e8RLqxZ57Bwn3+ycnlv8qJxnQi32zCz9deHSnVyXHEr5zHZSHwSBgaQsg3lJ
         W8ug==
X-Gm-Message-State: AGi0Pub2ZWAxh5J8zWkE3ThLQuAp0diKPihjPEfNGdGupJjCTlwS7jnq
        iR3GEgA3jV3jBM4Mn94VJtFV
X-Google-Smtp-Source: APiQypKxGfjAvQPF8Pqz6aw+byBjxReHnXAvelraYGqfRlAC5VmBFb5x+qvNFukCSMZm1NRD2mr1lQ==
X-Received: by 2002:a62:7911:: with SMTP id u17mr2763619pfc.305.1586269989757;
        Tue, 07 Apr 2020 07:33:09 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e86:d03b:65ee:cb40:6d79:8376])
        by smtp.gmail.com with ESMTPSA id w63sm3922904pgb.5.2020.04.07.07.33.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 07:33:08 -0700 (PDT)
Date:   Tue, 7 Apr 2020 20:03:04 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] bus: mhi: core: Add support for data transfer
Message-ID: <20200407143304.GH2442@Mani-XPS-13-9360>
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

Hmm. We have one internal user of this function and that's where the locking
has gone wrong. Will fix it.

Thanks for reporting!

Regards,
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
