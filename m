Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 468647244E7
	for <lists+kernel-janitors@lfdr.de>; Tue,  6 Jun 2023 15:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbjFFNvW (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 6 Jun 2023 09:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238047AbjFFNvU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 09:51:20 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CB910D5
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 06:51:18 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-30ae95c4e75so6263877f8f.2
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 06:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686059477; x=1688651477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tg/VBsADdjigusaXq4lLAILvxqOnbsjsYTbYXhbrt7U=;
        b=TdbhXMr3pt/OMg+LJvzgjxTvHvcFD7SbzeQqTCRBAoaUvHsATCXKFeduKwnMYSnVk6
         VFEv2FIsdlEi2ok3syp429azIqDF7sKdUHijItwtvL9VhUK8U+OkX9DDf/KSobmMGusc
         2ZRUredEl9IBbQ2Z3zk4TD9joHsyYVv4jZYChaY8e1RF0qJJASSltaK4HjvNwOPERZEt
         78tNuHWmKPKvSCLPVdPRfJDzd58hKv1IvUHYhRGBAUeuDrPXU354AHqi/D4FLWrQ/1P4
         WFPJMWqxvyzpDzCPFxo35Xix5tFJetf2ajHJr9/AMYtMdg0Hr2eLF3C9k0DdlXigodfU
         DpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686059477; x=1688651477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tg/VBsADdjigusaXq4lLAILvxqOnbsjsYTbYXhbrt7U=;
        b=VoBNQ2+hrN/iQpEL4fTc/KriLvNz83wRuOzO9hWmW/jAGFpJ9zfCJaohPhIUYorTwz
         yOfBrOjH/VLX0hPRS9+WFn7Z0K3jTQf2pLb5KznhVOlZ1r6TGqSjo0Qy/Y0opHWuKahz
         baq6xe6L6x/apPD0ei+Tfr0Ea0vEvj/ra6BXirrUNPMKcpC47YagSLLOvcnvJxMIJRbn
         hCSmbuFhFmbJifrOl47tdXMx0BVyQwllI3DAT7qpWw8bRPIvUtbtzRZz040jB1GzPxNm
         uw98gcdf47eV+9yPm+vOTdy7eEE8JVntTRnY3D5PK1n+ZYoZ7O+2jcHFPjbz4GeOUIWP
         21GQ==
X-Gm-Message-State: AC+VfDxp8t4o2AX9X/TOPxAToimwB1cz0AWzdPrm9FiJIAbiB+yX/SBY
        A4uLV70zxtJSY+FTkKbFj9JU6g==
X-Google-Smtp-Source: ACHHUZ4qsOPY/61cWWH9OrNgvb8evuqo3T/PgCwLT3GPzkZkRqfH5pxhD9z2e5shMqKSmA3zNyhblA==
X-Received: by 2002:adf:ea10:0:b0:30e:3ec5:aa62 with SMTP id q16-20020adfea10000000b0030e3ec5aa62mr2104610wrm.8.1686059477342;
        Tue, 06 Jun 2023 06:51:17 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c248400b003f604793989sm17709586wms.18.2023.06.06.06.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:51:15 -0700 (PDT)
Date:   Tue, 6 Jun 2023 16:51:13 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] serial: core: don't kfree device managed data
Message-ID: <c1a2467b-7a30-4eaa-9206-3b47d3ae64e6@kadam.mountain>
References: <ZH7tsTmWY5b/4m+6@moroto>
 <ZH8xwKuI9WqRUu5H@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZH8xwKuI9WqRUu5H@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 06, 2023 at 04:16:48PM +0300, Andy Shevchenko wrote:
> On Tue, Jun 06, 2023 at 11:26:25AM +0300, Dan Carpenter wrote:
> > The put_device() function will call serial_base_ctrl_release() or
> > serial_base_port_release() so these kfrees() are a double free bug.
> 
> ...
> 
> These labels are also called without device being even added.
> So, this is not good enough as far as I can tell.
> 

put_device() matches with the device_initialize() in
serial_base_device_init().  If we wanted to undo a device_add() the
function is device_del().

I originally wrote this patch last week but only resent it now because
of an issue with my mail set up.  I see that serial_base_device_init()
has actually changed and there is an issue now where the -EPROBE_DEFER
path leaks.

I think making callers handle -EPROBE_DEFER as a special case would be
an ongoing source of bugs.  So really I'd prefer something like this:

regards,
dan carpenter

diff --git a/drivers/tty/serial/serial_base_bus.c b/drivers/tty/serial/serial_base_bus.c
index 9354af7c11af..15fa0576d362 100644
--- a/drivers/tty/serial/serial_base_bus.c
+++ b/drivers/tty/serial/serial_base_bus.c
@@ -50,17 +50,17 @@ static int serial_base_device_init(struct uart_port *port,
 				   void (*release)(struct device *dev),
 				   int id)
 {
-	if (!serial_base_initialized) {
-		dev_err(port->dev, "uart_add_one_port() called before arch_initcall()?\n");
-		return -EPROBE_DEFER;
-	}
-
 	device_initialize(dev);
 	dev->type = type;
 	dev->parent = parent_dev;
 	dev->bus = &serial_base_bus_type;
 	dev->release = release;
 
+	if (!serial_base_initialized) {
+		dev_err(port->dev, "uart_add_one_port() called before arch_initcall()?\n");
+		return -EPROBE_DEFER;
+	}
+
 	return dev_set_name(dev, "%s.%s.%d", type->name, dev_name(port->dev), id);
 }
 

