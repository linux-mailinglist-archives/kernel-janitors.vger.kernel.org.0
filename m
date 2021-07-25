Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E04F3D4EBF
	for <lists+kernel-janitors@lfdr.de>; Sun, 25 Jul 2021 18:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbhGYPvq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 25 Jul 2021 11:51:46 -0400
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:35714 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbhGYPvq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 25 Jul 2021 11:51:46 -0400
Received: from [192.168.1.18] ([86.243.172.93])
        by mwinf5d27 with ME
        id ZUYA2500B21Fzsu03UYAaA; Sun, 25 Jul 2021 18:32:14 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 25 Jul 2021 18:32:14 +0200
X-ME-IP: 86.243.172.93
Subject: Re: [PATCH 09/18] staging: rtl8188eu: remove unused _HAL_INTF_C_
 define
To:     Martin Kaiser <martin@kaiser.cx>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210725155902.32433-1-martin@kaiser.cx>
 <20210725155902.32433-9-martin@kaiser.cx>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <2bfef837-e8f6-0a89-b0ac-967de12ed067@wanadoo.fr>
Date:   Sun, 25 Jul 2021 18:32:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210725155902.32433-9-martin@kaiser.cx>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 25/07/2021 à 17:58, Martin Kaiser a écrit :
> This define can be removed.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/rtl8188eu/hal/hal_intf.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8188eu/hal/hal_intf.c b/drivers/staging/rtl8188eu/hal/hal_intf.c
> index f09620c54e69..3e132e00c81c 100644
> --- a/drivers/staging/rtl8188eu/hal/hal_intf.c
> +++ b/drivers/staging/rtl8188eu/hal/hal_intf.c
> @@ -5,7 +5,6 @@
>    *
>    ******************************************************************************/
>   
> -#define _HAL_INTF_C_
>   #include <hal_intf.h>
>   
>   uint rtw_hal_init(struct adapter *adapt)
> 

Hi,

This one looks like an include guard.

#ifndef _HAL_INTF_C_
#define _HAL_INTF_C_
...
#endif /* _HAL_INTF_C_ */

?
