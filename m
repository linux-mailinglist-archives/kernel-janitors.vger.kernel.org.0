Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 876572FC628
	for <lists+kernel-janitors@lfdr.de>; Wed, 20 Jan 2021 01:54:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730733AbhATAxp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 Jan 2021 19:53:45 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2087 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730094AbhATAxX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Jan 2021 19:53:23 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B60077edb0005>; Tue, 19 Jan 2021 16:52:43 -0800
Received: from [172.27.0.115] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Jan
 2021 00:52:42 +0000
Subject: Re: [bug report] net/mlx5: DR, Move STEv0 setters and getters
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     <kernel-janitors@vger.kernel.org>,
        Saeed Mahameed <saeedm@nvidia.com>
References: <X/hbL24ZTflzKF09@mwanda>
From:   Yevgeny Kliteynik <kliteyn@nvidia.com>
Message-ID: <a795d0f6-f719-63ec-6a2e-f2dce01934f2@nvidia.com>
Date:   Wed, 20 Jan 2021 02:52:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <X/hbL24ZTflzKF09@mwanda>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611103963; bh=XT/BLxoPR6FQTzAmMvHSWqEIqH1RJ03IWivOXz9zK0A=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=DQa46PZvEz4hLkEUdXS5GCYWKTnQqTu6JSjPyJ7vBrJYw561gle7iVXIi26WX2nyn
         mNP+shnZ6Jc1JuEskMGDvD9Ar27qwAEZYjmMkbdnQ8AwKN1M6JHEZBU8ETpoeURq7x
         5snsFfO+eIi5G36Z5ELLWayl+z/BuEeNCjkOrn8k97+DzAhUFVwlX3kcbrtcfTrlgw
         ZanWr+OmKXi6Ab+UePY6mtWyH9JzGtlT9si1ZGIv5e90vOzNdPxKCYeK1wSmiwmIwO
         0UkHVd/H0e1h0YAjcY+UEDUEdsDGnn+t8guD+i//ArRHm0bE6yXl98uA4ul70FH4E4
         klkaxDKPNIKzw==
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 08-Jan-21 15:16, Dan Carpenter wrote:
> 
> The patch 6b93b400aa88: "net/mlx5: DR, Move STEv0 setters and
> getters" from Nov 19, 2020, leads to the following static checker
> warning:
> 
>          drivers/net/ethernet/mellanox/mlx5/core/steering/dr_ste_v0.c:252 dr_ste_v0_get_miss_addr()
>          warn: potential shift truncation.  '0xff (0-255) << 26'
> 
> drivers/net/ethernet/mellanox/mlx5/core/steering/dr_ste_v0.c
>     248  static u64 dr_ste_v0_get_miss_addr(u8 *hw_ste_p)
>     249  {
>     250          u64 index =
>     251                  (MLX5_GET(ste_rx_steering_mult, hw_ste_p, miss_address_31_6) |
>     252                   MLX5_GET(ste_rx_steering_mult, hw_ste_p, miss_address_39_32) << 26);
>                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This is shifting a u32 value in the 0-255 range by << 26 which could
> result in shift wrapping.  "index" is a u64 but ORing two u32 values
> will result in a u32.

Thanks Dan, will send a fix shortly.

-- YK
