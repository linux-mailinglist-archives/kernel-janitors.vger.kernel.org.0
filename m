Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC9C1ABDAC
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 Apr 2020 12:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441475AbgDPKNv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 16 Apr 2020 06:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436915AbgDPKNq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Apr 2020 06:13:46 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB32C061A0C
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Apr 2020 03:13:41 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id y24so4183765wma.4
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Apr 2020 03:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wf1Npf9XSC73Ejyy+DvRIDVeqsXEFPd8u8XiRzEMgUA=;
        b=V7ZUsQXrHaQgXeN9L6GIsDZcF5AXmwDSfb8Fu+bYTmu7cNylxhcGZmQO8ex3UvnUKl
         vnTPCRJxEgE979dRUeC+LRYyVqm7tlsyBIsZXlPH89z5nI1vlM2mtJzKJSkBiKxZvhoV
         E7B4hxkHnxkj+W7iRO4nzrzI5ZcbaehqM5QvpP4V53KA2a8e9S0WZDK2eCHDLDzcRsd7
         eq07Moye1J6gN+zHqKk/QS4TkK03UXSt/jDvKG3Z80N202RxmyxtXh/I0T1weeGvipUl
         PTBF1P6H91Jk7afn4eg9ncOVvJgvoXwVyMMcKtcCN6yh8Jhm+kM2aD8e7Og15Kb6Y6SH
         HEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wf1Npf9XSC73Ejyy+DvRIDVeqsXEFPd8u8XiRzEMgUA=;
        b=edFJDA8FwAEeRH/F6UPU7J2+G7YaeAvlEz4EUHC6id3UKoOHSLOhiZUKog8wYkFYda
         3ZsRVT5NWaH6vu8RE4nBsKUu9Y8XmYFvJw3vIp8hcVfX6NA4ANgSCxhQPRAjRo5L7Fx6
         azbtVSz2JgxmcD7ostBRdtCPSysvMNh0NVoDNeRq6U5/J5CE/HB5ZlYV0O6e4M5WBM52
         twc4XsuMfyU85vqb5Zq2ajeGM6NW6Wn8l1OeDCcaBigFmOjlncuee2SfbFeAgzAwIQHy
         Y1tMez5huL/9Grs3g0Ou2Bnz+sc1S1ecUYIKlF4580pAY3aAmqzyfgarxOwDr1JTbyrv
         Q0lg==
X-Gm-Message-State: AGi0PuY9RWzPHBxUpQ4jfm4H5v0peJb0yVScyIbGRVSAT5GebyjKiDDT
        Y+13DpIhjOpjf6lIBoEZWa9Srw==
X-Google-Smtp-Source: APiQypJXPwtuhD8dFO+JsNn5QLOU6Dyekq3TSruLoNK9phQLHnzSPcNF8U1T4kQiCuJrZMDNKiED+Q==
X-Received: by 2002:a1c:384:: with SMTP id 126mr4165777wmd.58.1587032020316;
        Thu, 16 Apr 2020 03:13:40 -0700 (PDT)
Received: from dell ([95.149.164.124])
        by smtp.gmail.com with ESMTPSA id y10sm3039407wma.5.2020.04.16.03.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 03:13:39 -0700 (PDT)
Date:   Thu, 16 Apr 2020 11:14:39 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     andrew@lunn.ch, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mfd: tqmx86: Fix a typo in MODULE_DESCRIPTION
Message-ID: <20200416101439.GD2167633@dell>
References: <20200412213047.4827-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200412213047.4827-1-christophe.jaillet@wanadoo.fr>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 12 Apr 2020, Christophe JAILLET wrote:

> Based on the file name and code of the driver, it is likely that this
> module is related to TQMx86 and not TQx86.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/mfd/tqmx86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
