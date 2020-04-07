Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8F5A1A0F40
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Apr 2020 16:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729256AbgDGObj (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Apr 2020 10:31:39 -0400
Received: from mail-pf1-f175.google.com ([209.85.210.175]:45002 "EHLO
        mail-pf1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729177AbgDGOba (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Apr 2020 10:31:30 -0400
Received: by mail-pf1-f175.google.com with SMTP id b72so874590pfb.11
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Apr 2020 07:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ObtKnGJjYoZHLBqwiwGrDa+oVtYXQeCpEq1Q63Vw3uI=;
        b=J61iobuOT3KxSXf2lVDP59Whdf2VZCzfFg8GzEownHBXohoUE8Oo3cCYXvvr+bpdCL
         HXUWc63iVsnCoKYc2hnhQB5Tumay+hNyILNC1pwn++B95+4BUzShOUaMiuPBTVLOUiJg
         RI6/OV1cfiQ/ZCR40IvBio1q8hJfE9/yc7wU/Iy36NjTDPSEII328RS7Eno4xCA9/bA/
         Tu+VihTpEhBrOfkHSui2PQMSbYC1bIBfgD3rtBJuFCzvVFe6UlHWhl9t9yIwMKH6ECiH
         c1k1bVjKvvkZ7W7TljaFEM7/7+EUL3oXM038R4gMsJAxSLeqiKaiuse6UHTr+OODHkk9
         FjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ObtKnGJjYoZHLBqwiwGrDa+oVtYXQeCpEq1Q63Vw3uI=;
        b=uXbZqnvGulsxg2ESm1ssFiFLpflfVMslB78w4Hp0ebfq3S4ofLXS7Ndtk2VqVIN75z
         RU8awgBgCY58g192+Dd/OY94+Zyrl02hTz2Mi1G1OJiDef9qRmGwlLR5/99Sh3kbrYsd
         TNh0q1cvzy+P0w/k4iXMAa/iCuJZZKZseBda5oYTplZAh3rfhNL0dIFhlZcHtYmeliBt
         rsbw9oxOkfuI4j8dV0fL1CYje9Z0rWe4meeQvziplDTqkOA9wGMEQ62oL5NyBHyL3wF1
         zpc/1GPWmQjjWDlD+SoP9ES/Mx+e9c9A2U8D95PAQJP5RVmLQiyymArUnTM0kYj93M0e
         ECWg==
X-Gm-Message-State: AGi0PuZHN7/2n1bynWhQb+Mp4TpOByYajmhWEgNMS/gHeRckY7Udmk3f
        ftX6ga9OVhVWgVBkKFbzZqMw
X-Google-Smtp-Source: APiQypId3Wv91Ue+ozaCDAqGgsYFNYotdlxOgISEAQAtSlE6CH4Md140oM0mnUS+KUDyLL56nKxaaQ==
X-Received: by 2002:aa7:9a8e:: with SMTP id w14mr2848652pfi.113.1586269889523;
        Tue, 07 Apr 2020 07:31:29 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e86:d03b:65ee:cb40:6d79:8376])
        by smtp.gmail.com with ESMTPSA id c4sm5506754pgg.17.2020.04.07.07.31.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 07:31:28 -0700 (PDT)
Date:   Tue, 7 Apr 2020 20:01:23 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] bus: mhi: core: Add support for data transfer
Message-ID: <20200407143123.GG2442@Mani-XPS-13-9360>
References: <20200407135608.GA109647@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407135608.GA109647@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On Tue, Apr 07, 2020 at 04:56:08PM +0300, Dan Carpenter wrote:
> Hello Manivannan Sadhasivam,
> 
> The patch 189ff97cca53: "bus: mhi: core: Add support for data
> transfer" from Feb 20, 2020, leads to the following static checker
> warning:
> 
> 	drivers/bus/mhi/core/main.c:1093 mhi_gen_tre()
> 	warn: bitwise AND condition is false here
> 
> drivers/bus/mhi/core/main.c
>   1088  
>   1089          ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
>   1090          if (ret)
>   1091                  return ret;
>   1092  
>   1093          eob = !!(flags & MHI_EOB);
>                                  ^^^^^^^
> This is zero.  Was BIT(0) intended?
>

Darn. The `enum mhi_flags` is supposed to start with 1. I'll fix it
with your Reported-by tag.

Btw, which static checker you are using? I did try sparse and W=2.

Thanks,
Mani
 
>   1094          eot = !!(flags & MHI_EOT);
>   1095          chain = !!(flags & MHI_CHAIN);
>   1096          bei = !!(mhi_chan->intmod);
>   1097  
>   1098          mhi_tre = tre_ring->wp;
>   1099          mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);
> 
> regards,
> dan carpenter
