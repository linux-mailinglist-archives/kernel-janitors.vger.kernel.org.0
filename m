Return-Path: <kernel-janitors+bounces-1210-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F44E82A102
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jan 2024 20:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 546B91F2397E
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jan 2024 19:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC3E4E1D6;
	Wed, 10 Jan 2024 19:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vn6/5AlL"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071364E1C5
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jan 2024 19:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e4f71288bso23862455e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Jan 2024 11:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704914726; x=1705519526; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dQnwa9px6BKW4u/hfAi/RL8hk5wyjWSQrl6JxcHdf9I=;
        b=vn6/5AlLyNfmgJGxGwkRdkjEpY7f0seugPNjn0PM7YCFnwHXyMFU8a5R1L/reXX5NV
         8+2d+dDg+7hIJALxNPsZ24Iy/IkkQHVX9hV7G0CmYCzrT8bcMIxrEP/A+wEDzUSAsAIN
         s6oCXTyCushldDgbcqMQ3HFcq0T84AZa/HQY+V5DSliOeDByhpfSycVKA9f5Y1TGZd4X
         jaJlR/x0sxqLaB9RLkWLQt83Aq61m5GvYngUhPig7u00sPh0aGavcRctvKd0NgO89iSE
         EhQxxMTKVXs7b7lsaPsAGiKW+adUF8CbfbRcOCD6uzrrbBz73kSE31D9zSe0jD7tFGx5
         9PEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704914726; x=1705519526;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dQnwa9px6BKW4u/hfAi/RL8hk5wyjWSQrl6JxcHdf9I=;
        b=Kmn8o/oT7jypvRsH7De/hCS9n7SPdQBlhHgtiyu/A+d49Jk+vJOtaZ6Kx+uuI79Wi/
         hvTIJrwOJ5xS9hMYLNtPBQpOC5t5EQvYApjqZYHrlBxhA7pzByDEyVWg7EK5ItI6bPoX
         TPGOICEFRZIvKfqILHpfBcMo5b/Fg7/B3MD24TOpme+S+VHn0WllYYxW5k2MlZB1tlF4
         XWuHKlNn3znxh2UE078B7UpDOszbd2bLOdtTiR0fL/piEbVEBczKnct+QoJq3tV/TZyp
         /zptGyBZDLbP+H+9SyPdyPatUJODNgXCOq0jFSeOJ9bRVzF9c7Vd+fD3w5uriwwe048I
         ATdg==
X-Gm-Message-State: AOJu0Ywzb6oc1ANlTY41vHtC7QXI2j3S7ee8lVTm1u6z1NEreKhRhhok
	z57LkivBfmnfWtGAW/rcqSXv1Jwo2tzNVw==
X-Google-Smtp-Source: AGHT+IFFFb+NnCbzo7h48kwBD+4AV/WKejkwdB8o9BDxHvwaYP5obvq8rlqdFdLhy/UVexiRH8LOrw==
X-Received: by 2002:a05:600c:4690:b0:40e:4210:6bc3 with SMTP id p16-20020a05600c469000b0040e42106bc3mr600189wmo.2.1704914726262;
        Wed, 10 Jan 2024 11:25:26 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id bg42-20020a05600c3caa00b0040e3733a32bsm3184881wmb.41.2024.01.10.11.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 11:25:26 -0800 (PST)
Date: Wed, 10 Jan 2024 22:25:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rengarajan S <rengarajan.s@microchip.com>
Cc: Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] serial: 8250_pci1xxxx: fix off by one in
 pci1xxxx_process_read_data()
Message-ID: <ZZ7vIfj7Jgh-pJn8@moroto>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

These > comparisons should be >= to prevent writing one element beyond
the end of the rx_buff[] array.  The rx_buff[] buffer has RX_BUF_SIZE
elements.  Fix the buffer overflow.

Fixes: aba8290f368d ("8250: microchip: pci1xxxx: Add Burst mode reception support in uart driver for writing into FIFO")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Add "fix" to the subject.  Fix a typo in the commit message as well.

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


