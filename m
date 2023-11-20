Return-Path: <kernel-janitors+bounces-352-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2B47F191D
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Nov 2023 17:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB95B1F253C9
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Nov 2023 16:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899561E533;
	Mon, 20 Nov 2023 16:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="bp/7xqTW"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE2DBBA;
	Mon, 20 Nov 2023 08:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=IEmqZPNEHiRj9re2F4iCenA7GeqZoGYK1eYZxhU0tA4=; b=bp/7xqTWwBpASz6lw0QLmHwfKa
	nbLaNxx6zUa49+0GkKPCOz6bL/SGXVNBlUbiCFhawFla2zuB+XUkafOCRl8OqtJMErw2aiihhNHw5
	apeF4CXyT/Qhl0dJ9DqLblIcrZkNK04vhBRgD/0vop+i1u4tBGBxEL1E8VSTQ9Awzrtk=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:55666 helo=pettiford)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1r57V2-00009x-Lj; Mon, 20 Nov 2023 11:51:53 -0500
Date: Mon, 20 Nov 2023 11:51:52 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Richard Genoud <richard.genoud@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-Id: <20231120115152.77214ee015e6c501e500b22a@hugovil.com>
In-Reply-To: <f2e9790d8b49aeba8b43ce018d30a35b837ac1eb.1700409299.git.christophe.jaillet@wanadoo.fr>
References: <f2e9790d8b49aeba8b43ce018d30a35b837ac1eb.1700409299.git.christophe.jaillet@wanadoo.fr>
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
Subject: Re: [PATCH v2] serial: atmel: convert not to use
 dma_request_slave_channel()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

On Sun, 19 Nov 2023 16:55:15 +0100
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

Hi,
change the subject to:

"... replace deprecated dma_request_slave_channel()"

Hugo.


> dma_request_slave_channel() is deprecated. dma_request_chan() should
> be used directly instead.
> 
> Switch to the preferred function and update the error handling accordingly.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> v2: Also update atmel_prepare_rx_dma()
> ---
>  drivers/tty/serial/atmel_serial.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
> index 1946fafc3f3e..6aeb4648843b 100644
> --- a/drivers/tty/serial/atmel_serial.c
> +++ b/drivers/tty/serial/atmel_serial.c
> @@ -1013,14 +1013,18 @@ static int atmel_prepare_tx_dma(struct uart_port *port)
>  	struct device *mfd_dev = port->dev->parent;
>  	dma_cap_mask_t		mask;
>  	struct dma_slave_config config;
> +	struct dma_chan *chan;
>  	int ret, nent;
>  
>  	dma_cap_zero(mask);
>  	dma_cap_set(DMA_SLAVE, mask);
>  
> -	atmel_port->chan_tx = dma_request_slave_channel(mfd_dev, "tx");
> -	if (atmel_port->chan_tx == NULL)
> +	chan = dma_request_chan(mfd_dev, "tx");
> +	if (IS_ERR(chan)) {
> +		atmel_port->chan_tx = NULL;
>  		goto chan_err;
> +	}
> +	atmel_port->chan_tx = chan;
>  	dev_info(port->dev, "using %s for tx DMA transfers\n",
>  		dma_chan_name(atmel_port->chan_tx));
>  
> @@ -1188,6 +1192,7 @@ static int atmel_prepare_rx_dma(struct uart_port *port)
>  	dma_cap_mask_t		mask;
>  	struct dma_slave_config config;
>  	struct circ_buf		*ring;
> +	struct dma_chan *chan;
>  	int ret, nent;
>  
>  	ring = &atmel_port->rx_ring;
> @@ -1195,9 +1200,12 @@ static int atmel_prepare_rx_dma(struct uart_port *port)
>  	dma_cap_zero(mask);
>  	dma_cap_set(DMA_CYCLIC, mask);
>  
> -	atmel_port->chan_rx = dma_request_slave_channel(mfd_dev, "rx");
> -	if (atmel_port->chan_rx == NULL)
> +	chan = dma_request_chan(mfd_dev, "rx");
> +	if (IS_ERR(chan)) {
> +		atmel_port->chan_rx = NULL;
>  		goto chan_err;
> +	}
> +	atmel_port->chan_rx = chan;
>  	dev_info(port->dev, "using %s for rx DMA transfers\n",
>  		dma_chan_name(atmel_port->chan_rx));
>  
> -- 
> 2.34.1
> 

