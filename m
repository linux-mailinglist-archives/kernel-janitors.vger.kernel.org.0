Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9419724728
	for <lists+kernel-janitors@lfdr.de>; Tue,  6 Jun 2023 17:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237506AbjFFPB7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 6 Jun 2023 11:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237194AbjFFPB6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 11:01:58 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AAAA10FB
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 08:01:51 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f6d7abe934so54038555e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 08:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686063710; x=1688655710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DllZqK788w6lqoCKOwRGo9snKT873aGYAMBr/jTSFaM=;
        b=DtcE+BMkqh2t65sw5zab1/Q+N4M6AcXcCG9J6lFDcCdCUCujsejYYtDbwlB7oaKCPS
         Z0x45pm7jxvMIBQO4jkVX6xK0pG7L/dd+nvY3KC2kI9Zh8YDYE2sNSCbQveLwA4R09aP
         XPkoyV86ufGMq0/gQr5irwG3Lc/GHnCk1yKHanPoivvlBMynJFOdiFt9SyQpHND6VEO7
         dbHYA1QJid/XCYEr9QyEid3Dj8TiuZpmAZ9Z/IUQZ5BXs8wF8sOJE59FL7/zgaPe9Fr7
         OrqIPj2AjWyW/kbFwA6cRpZbvMbXQpNgqk0xZWtzTFKUBQ4BfUBoLLChoQKk/N+LkG69
         IH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686063710; x=1688655710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DllZqK788w6lqoCKOwRGo9snKT873aGYAMBr/jTSFaM=;
        b=L7MNGIyIRdCtaNcKT9id9R00169exPILz9i8n176a9YG9Cqx7em/lPuZBKnrYnIu59
         dzTtNgbpoOge22uRL7SLl9E75Uabj0+Pcyh1Wl6pskPQahCJcE70JAf4xPJxu3fuHi3S
         eQezzRY2nndkA7q1uBWmf4kMSWqgtKcJR2g3eOH92Ujhgt8bcuEfh1IjgUMSUEIvU1PD
         CnDNfKiv+ELvVcTIUTe3NoxEmSvdCQ92emN6HJceshrMG2bR05Dpem5QseutxSTOSqDA
         lU7gWk7bIRbzhf/W+o8euvp3UTVd3R2hTh4wdYIG3R+NzNfP+3raqk5YaFB1p7v1DqfG
         4tHg==
X-Gm-Message-State: AC+VfDyfeWClzzxznNGgV6NM+xdFc2ZAA4y7f/Nwo5eE7Fx86Oyho/IH
        RJrQBg8WuTaaF+w/VYY8bf63zA==
X-Google-Smtp-Source: ACHHUZ4qzbypF0nT0mHFkVdJEANMGfUEPXHfME6cvYeI1fogjWGZdl3GHFSipaKd2zIy4jaOmi0Q7g==
X-Received: by 2002:a1c:f20b:0:b0:3f6:389:73b1 with SMTP id s11-20020a1cf20b000000b003f6038973b1mr2242931wmc.6.1686063709983;
        Tue, 06 Jun 2023 08:01:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 6-20020a05600c228600b003f7ec54d900sm1396635wmf.9.2023.06.06.08.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 08:01:48 -0700 (PDT)
Date:   Tue, 6 Jun 2023 18:01:45 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] serial: core: don't kfree device managed data
Message-ID: <dbd168c0-1ef2-4270-b6e2-3a489cdf6a14@kadam.mountain>
References: <ZH7tsTmWY5b/4m+6@moroto>
 <ZH8xwKuI9WqRUu5H@smile.fi.intel.com>
 <c1a2467b-7a30-4eaa-9206-3b47d3ae64e6@kadam.mountain>
 <ZH9I1DCyfa8tEzIz@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZH9I1DCyfa8tEzIz@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 06, 2023 at 05:55:16PM +0300, Andy Shevchenko wrote:
> 
> I'm okay with the above, but it seems at the same time we need to limit the
> messages:
> 
> 	dev_err_once(port->dev, "uart_add_one_port() called before arch_initcall()?\n");
> 

Yeah.  I would prefer if that was only printed as a debug message.
-EPROBE_DEFER is supposed to be a normal part of the process.

regards,
dan carpenter


