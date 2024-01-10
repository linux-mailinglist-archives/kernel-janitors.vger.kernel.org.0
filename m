Return-Path: <kernel-janitors+bounces-1208-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E4D82A0DF
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jan 2024 20:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B395E1F22E66
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jan 2024 19:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6BA4E1C4;
	Wed, 10 Jan 2024 19:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="TpQ+dFrB"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF614E1BA;
	Wed, 10 Jan 2024 19:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=x5OoD7LDB+eOxQrGKVf5GoRlWflkCg8BImPGaKiaic0=; b=TpQ+dFrBOHWSt37kDizuvoIi50
	IE+lWrloFW8FskmBT1w1NPZk6E7VB8tgm9YfW4eo5biZ3xvv8uNPKCnYH2D9aTxVON9pjYRre+Bay
	03AClvXGl3sh4lYNaWy0TXaLTdzpNgHEwnarOKMEr7bo5kBt3YLkAwfNZq3AeRDtQbbk=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:48230 helo=pettiford)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1rNdzP-0008DC-Br; Wed, 10 Jan 2024 14:11:47 -0500
Date: Wed, 10 Jan 2024 14:11:46 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rengarajan S <rengarajan.s@microchip.com>, Kumaravel Thiagarajan
 <kumaravel.thiagarajan@microchip.com>, Tharun Kumar P
 <tharunkumar.pasumarthi@microchip.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Message-Id: <20240110141146.6422e7517fe7e07a833b66df@hugovil.com>
In-Reply-To: <59f8aa13-3f88-4174-8e20-aa4467e7adac@moroto.mountain>
References: <59f8aa13-3f88-4174-8e20-aa4467e7adac@moroto.mountain>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -0.0 T_SCC_BODY_TEXT_LINE No description available.
	* -3.1 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH] serial: 8250_pci1xxxx: off by one in
 pci1xxxx_process_read_data()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

On Wed, 10 Jan 2024 21:52:28 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> These > comparisons should be >= to prevent writing one element beyond
> the end of the rx_buff[] array.  The buffer has RX_BUF_SIZE[] elements.

Hi,
your commit title message is very confusing and doesn't hint that this
is a bug fix (or a potential bug fix)...

Hugo Villeneuve


> 
> Fixes: aba8290f368d ("8250: microchip: pci1xxxx: Add Burst mode reception support in uart driver for writing into FIFO")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> From static analysis, not testing.
> 
>  drivers/tty/serial/8250/8250_pci1xxxx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_pci1xxxx.c b/drivers/tty/serial/8250/8250_pci1xxxx.c
> index 558c4c7f3104..cd258922bd78 100644
> --- a/drivers/tty/serial/8250/8250_pci1xxxx.c
> +++ b/drivers/tty/serial/8250/8250_pci1xxxx.c
> @@ -302,7 +302,7 @@ static void pci1xxxx_process_read_data(struct uart_port *port,
>  	 * to read, the data is received one byte at a time.
>  	 */
>  	while (valid_burst_count--) {
> -		if (*buff_index > (RX_BUF_SIZE - UART_BURST_SIZE))
> +		if (*buff_index >= (RX_BUF_SIZE - UART_BURST_SIZE))
>  			break;
>  		burst_buf = (u32 *)&rx_buff[*buff_index];
>  		*burst_buf = readl(port->membase + UART_RX_BURST_FIFO);
> @@ -311,7 +311,7 @@ static void pci1xxxx_process_read_data(struct uart_port *port,
>  	}
>  
>  	while (*valid_byte_count) {
> -		if (*buff_index > RX_BUF_SIZE)
> +		if (*buff_index >= RX_BUF_SIZE)
>  			break;
>  		rx_buff[*buff_index] = readb(port->membase +
>  					     UART_RX_BYTE_FIFO);
> -- 
> 2.43.0
> 
> 

