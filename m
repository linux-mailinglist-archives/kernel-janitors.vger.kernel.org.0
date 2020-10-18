Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F95291704
	for <lists+kernel-janitors@lfdr.de>; Sun, 18 Oct 2020 12:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgJRKxK (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 18 Oct 2020 06:53:10 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:31966 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725287AbgJRKxK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 18 Oct 2020 06:53:10 -0400
X-IronPort-AV: E=Sophos;i="5.77,390,1596492000"; 
   d="scan'208";a="473157208"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Oct 2020 12:53:08 +0200
Date:   Sun, 18 Oct 2020 12:53:08 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Nigel Christian <nigel.l.christian@gmail.com>
cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hw_random : platform_get_irq() already prints an error
In-Reply-To: <20201018054912.GA76941@fedora-thirty-three>
Message-ID: <alpine.DEB.2.22.394.2010181249280.2759@hadrien>
References: <20201018054912.GA76941@fedora-thirty-three>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This should also go to the maintainers of the file, which you can find
using the script scripts/get_maintainer.pl.

hw_random is not the right way to start the subject line for this file.
Use git log --oneline to see what others have done.

On Sun, 18 Oct 2020, Nigel Christian wrote:

> coccicheck
> drivers/char//hw_random/imx-rngc.c:256:2-9: line 256 is redundant because platform_get_irq() already prints an error

The log message should be limited to at most 75 columns, because when it
ends up in git it will be slightly indented.

The log message should explain what you are doing and why, not just repeat
the output of a tool.  In particular, the file and line number should not
be included in the log message, because that information is already
available in the changes below.

julia

> Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
> ---
>  drivers/char/hw_random/imx-rngc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
> index 61c844baf26e..69f13ff1bbec 100644
> --- a/drivers/char/hw_random/imx-rngc.c
> +++ b/drivers/char/hw_random/imx-rngc.c
> @@ -253,7 +253,6 @@ static int imx_rngc_probe(struct platform_device *pdev)
>
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq <= 0) {
> -		dev_err(&pdev->dev, "Couldn't get irq %d\n", irq);
>  		return irq;
>  	}
>
> --
> 2.28.0
>
>
