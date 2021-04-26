Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23AA936B592
	for <lists+kernel-janitors@lfdr.de>; Mon, 26 Apr 2021 17:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233573AbhDZPTl (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 26 Apr 2021 11:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233829AbhDZPTk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Apr 2021 11:19:40 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71610C061574
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Apr 2021 08:18:58 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id l189-20020a1cbbc60000b0290140319ad207so2961183wmf.2
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Apr 2021 08:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=d7c910HdFIDkEZtBVmU+xya0RUVFfE7u0NPc6LnaV4A=;
        b=zPI+wHnjxVRqB2h7HkKFXWNFbszfV2rYGIDDv9QRZjNNBzvOK2tGd9/nLf9U2zVhWL
         zx4JePmNRfZLB+aX6PDlMI3hp+L1GbRMyIfzteWIDwaHNxfQDG0b5mwcwM4I/K7uBrBg
         ruKzOXdtaFfXnlal6zJHaMxq3OCdD65IjjGrt5zx/1X9KXDEFJcMmKuFfqUbEMXTzdEJ
         bQPv4CBh+tcPHBf+oaQls+ZuzsDoh3+e1TxKSuDB0+JpULtVcjFww230XNhmKSmKNi8P
         pYqLoBQwcolRQx1/tIIwNAKPLzeUJn9kLQBMtGD9lZUcqaWWnNrIAFWeocS6sw6QUVvY
         drBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=d7c910HdFIDkEZtBVmU+xya0RUVFfE7u0NPc6LnaV4A=;
        b=JThtuUw7M9AT0Lo1TjQs8LxYTKZzNfcoB+z3+r3w2ei3rnmdS4vn0tNosHra0AEyEj
         CICSPDlHmlowfo65Im0E5wTcZAJkQeoW2Gzj1NE3l5MuI8bNyurFIZbyRmVtROqf8Aze
         WfxTPAETIFb1Pr2/eMpNZ/9Ti+188wsK5gazYiqRMUwZAyblZ9f847QjH5wD77zLKbmT
         +PBeyTo985E7tapsuBFhDQR/g3b1lHbHNeOBGZFxQJybbEgokNAyzy7fL1w6YJpZ6+Pd
         05BZXgw2gT8c7hXaCsOIuYAPeyEO0bCQT3egeXVd1v3UwiOKWTzM5TTL3XEg7Bm32Kds
         OthQ==
X-Gm-Message-State: AOAM533t6T3ONQGnE5Ei00knqdBbl4pMRUbe0+4FcVe2CEKsGaL6S7KX
        uXuJ4OvKnAHFOEw4ItvbtMpYBQ==
X-Google-Smtp-Source: ABdhPJzeVCEu0G7/KsNN5GV0idVuXFvH4c6Dd8NZqnG4S6Uym6BLFUkIBVE4h4nvQDzoIvKiCcOaug==
X-Received: by 2002:a1c:4382:: with SMTP id q124mr12824636wma.63.1619450337109;
        Mon, 26 Apr 2021 08:18:57 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id h8sm15920060wmq.19.2021.04.26.08.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 08:18:56 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Colin King <colin.king@canonical.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] serial: meson: remove redundant initialization of
 variable id
In-Reply-To: <20210426101106.9122-1-colin.king@canonical.com>
References: <20210426101106.9122-1-colin.king@canonical.com>
Date:   Mon, 26 Apr 2021 08:18:53 -0700
Message-ID: <7hwnspysyq.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> The variable id being initialized with a value that is never read
> and it is being updated later with a new value. The initialization is
> redundant and can be removed. Since id is just being used in a for-loop
> inside a local scope, move the declaration of id to that scope.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/tty/serial/meson_uart.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 529cd0289056..d7f55031b2cf 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -716,12 +716,13 @@ static int meson_uart_probe(struct platform_device *pdev)
>  	struct resource *res_mem, *res_irq;
>  	struct uart_port *port;
>  	int ret = 0;
> -	int id = -1;
>  
>  	if (pdev->dev.of_node)
>  		pdev->id = of_alias_get_id(pdev->dev.of_node, "serial");
>  
>  	if (pdev->id < 0) {
> +		int id;
> +
>  		for (id = AML_UART_PORT_OFFSET; id < AML_UART_PORT_NUM; id++) {
>  			if (!meson_ports[id]) {
>  				pdev->id = id;
> -- 
> 2.30.2
