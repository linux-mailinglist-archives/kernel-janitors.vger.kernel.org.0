Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F094DD0106
	for <lists+kernel-janitors@lfdr.de>; Tue,  8 Oct 2019 21:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730106AbfJHTNg (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 8 Oct 2019 15:13:36 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:41481 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729602AbfJHTNe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Oct 2019 15:13:34 -0400
Received: by mail-qk1-f193.google.com with SMTP id p10so17829355qkg.8
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Oct 2019 12:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=t6oyuMaPUmyNVT7v4DLW2+8p5dzVhG7Z1YsODEnTYJc=;
        b=Ahx2xM/Ka2OvT+Z8TrK2ZtgnFwLp3ML09vr39yCsPXewB9cSBKn8r2C75aPi6CSdgT
         hID2DzhcFNBPTAB1iBCdlYNlRTHMI8M7wA5syNbttRyBzqSNFtGU45Ts1Ugcs39sEsPF
         xjUjS1QCBvajmZQ7S1vTHTHW8vhCM7R8i33/13MD3D5yXy/kfTyMfNVmq88CPZf9qvz/
         x59LYN8gSkqOgtNPRZNlL8w4woGhJufgQvv3icIe5rxzORHPXHtFAPLAiIBMCNnQu4bc
         zzunS0e+Wf5JkmeVa33HDlgw6/QORMS3ARhuwbWgytoODOGAw3z0IIeAynZuGiHWddPB
         EO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=t6oyuMaPUmyNVT7v4DLW2+8p5dzVhG7Z1YsODEnTYJc=;
        b=bYIKMHY6lP9It2LLHmflG7V2bRhApMzt148ZuVsUcF855YODvvQz0YGTbWO6LnB/oS
         BfgZt9Vz5+RwHH6iqUIy8BGvez8DcQlRNlJ2B0EsdrFdbGf/B02G2/Fhb87l8pHZWh52
         Ywni/F0HdnKnc8hNJ72xtcKnHHg345CgNvm+SRYIedVJsi5k/1NOxKZPujhHZljLChhS
         kCcPg07vtxDT7idWl1zbDbnpTRrxK2sj/EEEc0CSSEuviWfRXO5072SKADwj6JZclMMA
         SZKspRctkOtrf5kZityCTj+B1tzfdCnNilihXc69MovN7okEP6V2tHp7LtV/wV6CQx+I
         rQ/g==
X-Gm-Message-State: APjAAAUOjHUEsc0iCH4K36Fp9QRuxM102IENZxQCTioxeXMSXRcPCg6k
        Q/Zo3mP8710Wa4cj4HFPSBMZ7A==
X-Google-Smtp-Source: APXvYqwIi/hxcdCKBT8nhkcuPpLBibqtX5z6zBX66YeevnNRqdhFxGxwgLWC6u6R7O5Jdy0QVwaWtQ==
X-Received: by 2002:ae9:d803:: with SMTP id u3mr29765098qkf.131.1570562011888;
        Tue, 08 Oct 2019 12:13:31 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id m14sm8803325qki.27.2019.10.08.12.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 12:13:31 -0700 (PDT)
Date:   Tue, 8 Oct 2019 12:13:20 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: phy: mscc: make arrays static, makes object
 smaller
Message-ID: <20191008121320.59959133@cakuba.netronome.com>
In-Reply-To: <20191007120308.2392-1-colin.king@canonical.com>
References: <20191007120308.2392-1-colin.king@canonical.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon,  7 Oct 2019 13:03:08 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate const arrays on the stack but instead make them
> static. Makes the object code smaller by 1058 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   29879	   6144	      0	  36023	   8cb7	drivers/net/phy/mscc.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   28437	   6528	      0	  34965	   8895	drivers/net/phy/mscc.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks.
