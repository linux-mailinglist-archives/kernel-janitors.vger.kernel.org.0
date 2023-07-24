Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEE375ED04
	for <lists+kernel-janitors@lfdr.de>; Mon, 24 Jul 2023 10:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbjGXICB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 24 Jul 2023 04:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjGXICA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Jul 2023 04:02:00 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA18109
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jul 2023 01:01:58 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3159d5e409dso3167266f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jul 2023 01:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690185717; x=1690790517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5BZ3qHMKtpaZLuCX+s7e/+q/pcYmf/J0ZH/SwRJMXM8=;
        b=tEIvMw8l8rpvRxjVxpUx25UYutYUpUfBv6u+L4GWFsCFveDge4IrBjqITY6CWjMK9Y
         dEdbdiIj/ccUQyqAsdBq6M0kTZbKpZSl42euxUJw/bZDzSXTqjeN3MilZjOyFBk4XuU8
         YpGpAUfsqLNhFBfLKu7TWW3kAOZIj3QbTbY/ikuH9BxH3nxSNGPsVx3W4Ei2owgCYtlT
         qBM2J8WXefXruZ/1583fNGzwEirFERT7ACLulej3GKLv+j5Rm7DBW7iHwzHLBdjMfx9f
         Q66w/DllvMMAOSyN9beUD8DM/gBTjZVdLFPvRH6sJcR2Yl1nYg6f7nJCH4JAeHnt2SuO
         p/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690185717; x=1690790517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BZ3qHMKtpaZLuCX+s7e/+q/pcYmf/J0ZH/SwRJMXM8=;
        b=Sob1L56NkdH3Zo3TJ88xQHVvG6U853gU4mL99BtFFYvcjDX3+KYEACYG0dWslw3qPc
         8M9r5xT6X+ic99Gna/607uxyK2nhC4TPyUQjG2ZoqlaU9iKGkMpWdzpBMSZlPgXqGw3e
         B+V/FLa+7UnwuDAfzEuD5qre+RzVK1NcT43a5v+UfpFf5f62MzXI76w50wDH5WKaprJZ
         XJiotjigjBxlXIutT8vWQVIeYC1aTJ/8ujX9AbAxPevcXNIh31qebLz/OTu9RzAMKKM1
         hs2enqzBeVpSkF2MyCIK3KdsGKq3pIkmAMUeLHjR7Bt+/LqKLkmdJAtQTMe5XjYljp9H
         h4NQ==
X-Gm-Message-State: ABy/qLY+htdIexGE40TTZzc6p/SyG6yo881rSzbeLmpTHj2wl4IKF+iL
        uTqpYblvHhw094EHt9/DAKtpDA==
X-Google-Smtp-Source: APBJJlHQzTxAuPKiqAnspN9dLXsqwMkcN7m3i6ZJZ59TAOwyLGH3tp61pF2pOWg3KoDV4xJEhvuMog==
X-Received: by 2002:adf:f54e:0:b0:313:e391:e492 with SMTP id j14-20020adff54e000000b00313e391e492mr7097229wrp.17.1690185717083;
        Mon, 24 Jul 2023 01:01:57 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d438d000000b003159d2dabbasm11967501wrq.94.2023.07.24.01.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 01:01:56 -0700 (PDT)
Date:   Mon, 24 Jul 2023 11:01:54 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jiri Slaby <jirislaby@kernel.org>
Cc:     Markus Elfring <Markus.Elfring@web.de>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Minjie Du <duminjie@vivo.com>, linux-wireless@vger.kernel.org,
        kernel-janitors@vger.kernel.org, opensource.kernel@vivo.com,
        LKML <linux-kernel@vger.kernel.org>,
        Kalle Valo <kvalo@kernel.org>,
        Nick Kossifidis <mickflemm@gmail.com>
Subject: Re: [PATCH] drivers: wireless: ath5k: fix parameter check in
 ath5k_debug_init_device
Message-ID: <91fe0855-0c78-4dc9-b55a-9dbe09bc9f51@kadam.mountain>
References: <ZK7wqH86hEswxGo6@bombadil.infradead.org>
 <3e831a9c-b469-f1d3-1eaf-c9e275a74da5@web.de>
 <986bc150-1ab3-4ec1-dd76-d3be69bfcef9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <986bc150-1ab3-4ec1-dd76-d3be69bfcef9@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jul 13, 2023 at 07:47:53AM +0200, Jiri Slaby wrote:
> On 12. 07. 23, 21:07, Markus Elfring wrote:
> > > > +++ b/drivers/net/wireless/ath/ath5k/debug.c
> > > > @@ -982,7 +982,7 @@ ath5k_debug_init_device(struct ath5k_hw *ah)
> > > >   	ah->debug.level = ath5k_debug;
> > > > 
> > > >   	phydir = debugfs_create_dir("ath5k", ah->hw->wiphy->debugfsdir);
> > > -	if (!phydir)
> > > > +	if (IS_ERR(phydir))
> > > 
> > > Please use IS_ERR_OR_NULL() instead.

The correct thing for debugfs is to delete the error handling entirely.
Checking for NULL is harmless but checking for IS_ERR() will break the
driver if debugfs is turned off.

Debugfs is a special case where the error handling was deliberately
written so that it's basically impossible to do it correctly.  Because
as I said at the start, the correct thing is to delete it.

regards,
dan carpenter

