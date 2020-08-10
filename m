Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3154524078F
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Aug 2020 16:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727800AbgHJOZv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 10 Aug 2020 10:25:51 -0400
Received: from netrider.rowland.org ([192.131.102.5]:34759 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726845AbgHJOZs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Aug 2020 10:25:48 -0400
Received: (qmail 300682 invoked by uid 1000); 10 Aug 2020 10:25:47 -0400
Date:   Mon, 10 Aug 2020 10:25:47 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Colin King <colin.king@canonical.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: storage: isd200: fix spelling mistake "removeable"
 -> "removable"
Message-ID: <20200810142547.GC299045@rowland.harvard.edu>
References: <20200810083211.48282-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200810083211.48282-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Aug 10, 2020 at 09:32:11AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a usb_stor_dbg debug message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/usb/storage/isd200.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/storage/isd200.c b/drivers/usb/storage/isd200.c
> index 89f5e33a6e6d..3c76336e43bb 100644
> --- a/drivers/usb/storage/isd200.c
> +++ b/drivers/usb/storage/isd200.c
> @@ -1383,7 +1383,7 @@ static int isd200_scsi_to_ata(struct scsi_cmnd *srb, struct us_data *us,
>  				ATA_CMD_MEDIA_LOCK : ATA_CMD_MEDIA_UNLOCK;
>  			isd200_srb_set_bufflen(srb, 0);
>  		} else {
> -			usb_stor_dbg(us, "   Not removeable media, just report okay\n");
> +			usb_stor_dbg(us, "   Not removable media, just report okay\n");
>  			srb->result = SAM_STAT_GOOD;
>  			sendToTransport = 0;
>  		}
> -- 

Acked-by: Alan Stern <stern@rowland.harvard.edu>
