Return-Path: <kernel-janitors+bounces-1198-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F4182A077
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jan 2024 19:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B91CE28941C
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jan 2024 18:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E887B4D5B3;
	Wed, 10 Jan 2024 18:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s3NRXKIX"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F0E4CE05
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jan 2024 18:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40d60c49ee7so50762515e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Jan 2024 10:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704912752; x=1705517552; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4C4bIL4ANcAUBqFfK7c1D7Y+6k3toeGjRShUZaLe0dA=;
        b=s3NRXKIXexYfgny4Sdf0KCpf5nJTzA3LFhr5p54tzXLd4IM7JuiNH3qDXg1Rtm11Zb
         o5Cu4SkhsgCH4Hu3iW8IGcSM/lBs3JE31ffxIjZfXHwTOEB9RZT0T0ar/31hudFmhM8+
         92Pc6u3VUzxDyS4C5h6xl9XCaP56HG6CY9pLrJqVR9lMLiJdcm4XEX9Zb+L8JoM2hWDs
         NTeQjYZPYMAcxxHLGBDUsHkCO4lEgXQ5+pz8sZP9qnMZ1BL85orzApkkn2HHVjgSUuvq
         lD1U0dzBI9TY/rY1ILCkN7bV5wfYLyd+6nY0I8L1vWcp7IGiWDU+DCrxQ+zrqh08wA8A
         hasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704912752; x=1705517552;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4C4bIL4ANcAUBqFfK7c1D7Y+6k3toeGjRShUZaLe0dA=;
        b=WrDuA30d4iGWMWTConUlsvoj1WOxOpGMQlNtg/TvDkrEgRCjFfFMNUbSJkjJORAE5M
         Y7/Gh7UD9Km5B2LwinzWmpQlc2WGrsNtEmwGbkjxS6eKcJhuNNVeCXR9+Mbu+tDGa9kK
         GQmuta/QR+BRPHqwnTP2cZu6JmiNRjyLaaUl+UaTo6cFt41iK4ppgyyIzp5vYZyNj/mb
         aB79vozAPsWb8KsYabnY5wSAPxsVWRa/J0w/CK5q4HIE96O0E1NcPU825un1OjxP3Ttd
         wRCWoALxybE+IXIGr+b/+NrvDBD1JwPXFq0hHK0IxLUm3CGcY/WTgUVfUKx1W2IwCN5q
         QLKA==
X-Gm-Message-State: AOJu0Yx2MGiMBaZVRWoUmjmgSl86JPVhoR5c+CRds2odImMsSmeTFSBc
	kNOghK76VfGVbI7v5Hgj0dvzNyZ2Aiu5DA==
X-Google-Smtp-Source: AGHT+IHWUnbSg+Ja7LmWlDIoVa6MTShKY21FoSDQF6YRwXqrxGE5OpjGUZIwe+yqnWlPY9dvQunCNA==
X-Received: by 2002:a05:600c:19c7:b0:40e:4f80:4081 with SMTP id u7-20020a05600c19c700b0040e4f804081mr811864wmq.71.1704912752090;
        Wed, 10 Jan 2024 10:52:32 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id fm25-20020a05600c0c1900b0040e54381a85sm3116358wmb.26.2024.01.10.10.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 10:52:31 -0800 (PST)
Date: Wed, 10 Jan 2024 21:52:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rengarajan S <rengarajan.s@microchip.com>
Cc: Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] serial: 8250_pci1xxxx: off by one in
 pci1xxxx_process_read_data()
Message-ID: <59f8aa13-3f88-4174-8e20-aa4467e7adac@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These > comparisons should be >= to prevent writing one element beyond
the end of the rx_buff[] array.  The buffer has RX_BUF_SIZE[] elements.

Fixes: aba8290f368d ("8250: microchip: pci1xxxx: Add Burst mode reception support in uart driver for writing into FIFO")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis, not testing.

 drivers/tty/serial/8250/8250_pci1xxxx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_pci1xxxx.c b/drivers/tty/serial/8250/8250_pci1xxxx.c
index 558c4c7f3104..cd258922bd78 100644
--- a/drivers/tty/serial/8250/8250_pci1xxxx.c
+++ b/drivers/tty/serial/8250/8250_pci1xxxx.c
@@ -302,7 +302,7 @@ static void pci1xxxx_process_read_data(struct uart_port *port,
 	 * to read, the data is received one byte at a time.
 	 */
 	while (valid_burst_count--) {
-		if (*buff_index > (RX_BUF_SIZE - UART_BURST_SIZE))
+		if (*buff_index >= (RX_BUF_SIZE - UART_BURST_SIZE))
 			break;
 		burst_buf = (u32 *)&rx_buff[*buff_index];
 		*burst_buf = readl(port->membase + UART_RX_BURST_FIFO);
@@ -311,7 +311,7 @@ static void pci1xxxx_process_read_data(struct uart_port *port,
 	}
 
 	while (*valid_byte_count) {
-		if (*buff_index > RX_BUF_SIZE)
+		if (*buff_index >= RX_BUF_SIZE)
 			break;
 		rx_buff[*buff_index] = readb(port->membase +
 					     UART_RX_BYTE_FIFO);
-- 
2.43.0


