Return-Path: <kernel-janitors+bounces-5331-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8722973DCB
	for <lists+kernel-janitors@lfdr.de>; Tue, 10 Sep 2024 18:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDAE81C2534A
	for <lists+kernel-janitors@lfdr.de>; Tue, 10 Sep 2024 16:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB5D1A2573;
	Tue, 10 Sep 2024 16:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9Ff+jWp"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E74D1A0734;
	Tue, 10 Sep 2024 16:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987213; cv=none; b=ETe+FWWej1MrIeXEu11W3SLkTRsi/vkRpu06b9OJSj72UUwTziOR5f9IVK78QgHAdqL9h98YnRyvsMcH/gFabkDNu12tJb6PqWqQnQDdC+BjHijI1CuKR4drkYozxn64D/CGHvEGmG3/bIcyo4bE+QxBYa6OVP/5cIDu4iP66ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987213; c=relaxed/simple;
	bh=QqPLbbHi/y62yGV05KW2VKqTAkd4QxRf7UtBYOI31rY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hl1J6xufFZF/qH3jJMhIap0dFUsj+uIsICWSt0WgMDgpbY+6m7b8h3Nt72MxeeltrGr6EGAGcMWZRYBEtfBXvMad936qbxCS8HVXlSkdknNE1ayB7dvVcAT9QRCTbPCHWEUBLtsz7fDSTFBWw88HzhehtNOUI0FYQRTvMNfZSYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9Ff+jWp; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c3d20eed0bso1187182a12.0;
        Tue, 10 Sep 2024 09:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725987210; x=1726592010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hQa5LNGq7eQazmyNqUVHWLch3OzwxActy75H1w12TsQ=;
        b=B9Ff+jWprOT+jE/94ziLRt3u5/PIXGOIySWB8QLTx4gMmGYNmSAUIqfpqZGHIMobnp
         JiGqCE4STfrxI2OV6hYKVr26OgpYVdorOb1HoDIx3O09lo+et2dy4gZ4TCHFtb05I3tK
         fRgR3U7FuR1AzJ0veRzAP8ojkgPq3MYzKeg3hBa4wEDJ97+RQWVh66Tp9SXmPcpbkd8K
         gk4+mRVeR8rtoQEKvdAtxAaAPmFc9h6iZEFziybQ9IrXaq1J/xKjrIGkMB9Mf4OPdsO1
         drvQ3E+7CFdqhpZVQSH7kfUegWsNe3QCjGe1gzs2HzjhzfcLspRXCnyVcR5zNDyN+umW
         AzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725987210; x=1726592010;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQa5LNGq7eQazmyNqUVHWLch3OzwxActy75H1w12TsQ=;
        b=gXkzpo/4upoHCxvc0PoJZXhj1o3LFsIlNCA+2lxMnhZyXJAg+CnWudd64wxCj9jGtO
         /N9fRKQq395nFOLj+jw4Y+2r/VuGJ+ZGdnnELjrRmEqALrAIfNgPd/IYfnn3EINW4oOJ
         hFzuNvZHrhIgC+PXUkL8GAN/p0kBSmGVZXmuPXaKmgk6UWVt4aatdF/ydv06WHACP7kd
         vxt1xuUIDZawW+CbrCG6VzRw4FOnB6FT66Ytmwvw0B4/ptwxvJZpQFOGMq4XoPIevuXJ
         +SrI3VqhmKljyhvYMDjQzvJtSHRLqzYqCM3t4n0M3rch2ARhTbE/ZMDFylCnjn40wrZ/
         Z+DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB8RaF8wXXA80xkjo2rkt+GVKTZou4VNKnggObVBusAiLFozaRxaxB10hv4R3YU1PEDBq6Dnyr8cK6N5E=@vger.kernel.org, AJvYcCW9P58hvNhgguPs6v6E7w46cF94LDRi5X5m2OF6hOUiVCukg+iirwkdg6MYS/BC2CF4UAzbAzCI@vger.kernel.org
X-Gm-Message-State: AOJu0YwBCvtzk3MpZPP+2uttqgTC86thkZ+Mq1XMV9ahcCniQvPouRDv
	r+TrRql1mwkr9a5nLc7MPgUPfY2KOLlOqoYZnzVZAHsPIEEjJUKv
X-Google-Smtp-Source: AGHT+IG8MBMM8QUQyC/0REiXhPMV32Y9c+ievX2rUad3n4KfyAzCVWjTwkOIdvjE98VwpZt8c0AA0g==
X-Received: by 2002:a05:6402:35cf:b0:5c2:5f0a:4a45 with SMTP id 4fb4d7f45d1cf-5c40bc5ba04mr70581a12.31.1725987210087;
        Tue, 10 Sep 2024 09:53:30 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a1e4:b900:551f:92c7:e4c2:de47? (dynamic-2a02-3100-a1e4-b900-551f-92c7-e4c2-de47.310.pool.telefonica.de. [2a02:3100:a1e4:b900:551f:92c7:e4c2:de47])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5c409572cd4sm531346a12.27.2024.09.10.09.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 09:53:29 -0700 (PDT)
Message-ID: <4e97063c-e561-4bef-82c2-910c2d6617e0@gmail.com>
Date: Tue, 10 Sep 2024 18:53:32 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] r8169: Fix spelling mistake: "tx_underun" ->
 "tx_underrun"
To: Colin Ian King <colin.i.king@gmail.com>, nic_swsd@realtek.com,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240909140021.64884-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20240909140021.64884-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.09.2024 16:00, Colin Ian King wrote:
> There is a spelling mistake in the struct field tx_underun, rename
> it to tx_underrun.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/net/ethernet/realtek/r8169_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
Reviewed-by: Heiner Kallweit <hkallweit1@gmail.com>

