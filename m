Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3F8377BD8
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 May 2021 07:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbhEJFq6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 10 May 2021 01:46:58 -0400
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:50750 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbhEJFqW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 May 2021 01:46:22 -0400
Received: from [192.168.1.18] ([86.243.172.93])
        by mwinf5d29 with ME
        id 2tlG2500C21Fzsu03tlHlq; Mon, 10 May 2021 07:45:17 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 10 May 2021 07:45:17 +0200
X-ME-IP: 86.243.172.93
Subject: Re: [RFC 1/2] rtc: max77686: use symbolic error messages
To:     Julia Lawall <julia.lawall@inria.fr>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Edmundo Carmona Antoranz <eantoranz@gmail.com>,
        kernel-janitors@vger.kernel.org
References: <20210509004112.421100-1-eantoranz@gmail.com>
 <20210510043044.GN1955@kadam>
 <alpine.DEB.2.22.394.2105100704070.3126@hadrien>
From:   Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <e9862151-430d-1c02-d28f-49a1437ab1fb@wanadoo.fr>
Date:   Mon, 10 May 2021 07:45:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2105100704070.3126@hadrien>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


Le 10/05/2021 à 07:06, Julia Lawall a écrit :
> Any idea what %i is?  Does it actually exist?

%i = %d
(https://elixir.bootlin.com/linux/v5.13-rc1/source/lib/vsprintf.c#L2592)

CJ


> julia
