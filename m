Return-Path: <kernel-janitors+bounces-3610-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD538FB60A
	for <lists+kernel-janitors@lfdr.de>; Tue,  4 Jun 2024 16:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C5CB1F269F6
	for <lists+kernel-janitors@lfdr.de>; Tue,  4 Jun 2024 14:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654C714C5A7;
	Tue,  4 Jun 2024 14:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GCr3CgbG"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570E514A606
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Jun 2024 14:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717512141; cv=none; b=Ywb7WY+MwcpYqOWzo+vmeQQcXJygx1Q1mS5ZlEZGj37hBnFyGGrO/E06hVTM7S7ZnXk0dyabjk+OJFynZkl53u8lxA5rom0JbKwvSJ554TXcTjLSqAiiBGHZslyGxAlEklBFHFHdnTcETgCutwqYkeLT3w7xFJafPtgoW4rSIIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717512141; c=relaxed/simple;
	bh=Ghqj7sm86kY0ZfjVRuy7AMU0AJWf5Kbzzfiaeeu4Smc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nDPh+g+W0pf4dwSIov2H8Pg0CO5Z9maUVcEcWIT+GtezKyQ2E/RoYOfJSAbNWZ7oEPOvMztn2JOGuLQh6Rg0z2dHiQKP4yzTBWw0I1aNy1lCrLcYPtMwN4vdaQXdI3afQ4Ky2atoqrBeZSXiOLBbR/pnYeCI+zRzhQIi2319wcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GCr3CgbG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717512138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6GSKZn5YJoJ3kMztNbh4Ff0sh8p7A+Y7W7uSyuwooK8=;
	b=GCr3CgbGFtppbFBknp5GHAFYpN3skru48lJfzrg7+r9ZcCjhPDtx79mUh0VY238EMQd+jD
	PPK4FjKBAWuCBtjfXqJDUJevEGy4PDuS+UjiGsVZN5UYOfNL7s5EXkKQLpGHHqwe8nBzU8
	LkTjgKDx2ETeYGFQer2pBfwJETkGxNM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-0wSr0suXODiKTtEzM1ld2Q-1; Tue, 04 Jun 2024 10:42:16 -0400
X-MC-Unique: 0wSr0suXODiKTtEzM1ld2Q-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a68f2d64342so37515266b.1
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Jun 2024 07:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717512135; x=1718116935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6GSKZn5YJoJ3kMztNbh4Ff0sh8p7A+Y7W7uSyuwooK8=;
        b=tcLGh6Q0mr8ra4h/mN3a7ZdiiahDiFpPMOW0XLnPYIwCVdLlSPlW1E+ieXDhd62oI4
         lBUdO1/RZOr2mM6wb9taxZ7vQsJRU64G2SgfCEriAv/EHW6rngbTdSiOa90KKpJ6h24M
         gFX31KeJZERFx0UcAH5JAbKKIS9g2cStKAOumbA+2YL75+WEWWxlxnLyMTWZCmNrP9ov
         guZt3b6vLpoQyw6nixLbGt1Vwe9Nki11PC8gnaRQB9jZFtEsrJnz1V+4u9mDjQCMJTkb
         XyMgKC1HH4ZTbVkk7jc3EkIqa5uMMjxui0Ozj7VWr9//Pr6FXMqy/2ZNh5ZuL6WU8Jw5
         EcHg==
X-Forwarded-Encrypted: i=1; AJvYcCWYPtHpf8Otp6ae8DcMWUYOgY8RFvxgeT65Q7odFLJ2sZ/TdH8532ssHF7u6lei0jL3e5SJlFtYifAjML7Xzb8xwxmqLXWBfOVU6SpTHL/2
X-Gm-Message-State: AOJu0YzJZwDgYX4/mVPsY7KmQWnbfLwLfYKKLGMiO8k1oBjvHOEi2TDY
	/3r/M+BXdl6nBVIZP3DEqwr3lnlc4rvSzFe1eRtbz+rDinpMLzgu5eNPlLfMADyPRnzWixMb9C/
	wzWfamaH4DzBpRawAWHq1NYRut+9zYX5i3wsd4ENvBFI7OZS+J+d2keoeKpwBP+aq6A==
X-Received: by 2002:a17:906:a946:b0:a65:d7f7:f3f2 with SMTP id a640c23a62f3a-a6820be934fmr797485766b.36.1717512135499;
        Tue, 04 Jun 2024 07:42:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdDULiev1oH5nT3hJB3si4jO9YRCWfF0/Nqzsz2PAZuFe5bOc8WIqL7WohgMsV7xNUgCC15g==
X-Received: by 2002:a17:906:a946:b0:a65:d7f7:f3f2 with SMTP id a640c23a62f3a-a6820be934fmr797484566b.36.1717512135073;
        Tue, 04 Jun 2024 07:42:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:e7a9:b143:57e6:261b? (2001-1c00-2a07-3a01-e7a9-b143-57e6-261b.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:e7a9:b143:57e6:261b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68e940ed6asm411617666b.22.2024.06.04.07.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 07:42:14 -0700 (PDT)
Message-ID: <ad6c1af5-b0bb-430a-9d6f-0cdb1d2d8904@redhat.com>
Date: Tue, 4 Jun 2024 16:42:13 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: lg-g15: add missing MODULE_DESCRIPTION() macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240604-md-hid-lg-g15-v1-1-265b094db089@quicinc.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240604-md-hid-lg-g15-v1-1-265b094db089@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/4/24 4:33 PM, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lg-g15.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/hid/hid-lg-g15.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
> index acbec1dcf196..53e7b90f9cc3 100644
> --- a/drivers/hid/hid-lg-g15.c
> +++ b/drivers/hid/hid-lg-g15.c
> @@ -954,4 +954,5 @@ static struct hid_driver lg_g15_driver = {
>  module_hid_driver(lg_g15_driver);
>  
>  MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
> +MODULE_DESCRIPTION("HID driver for gaming keys on Logitech gaming keyboards");
>  MODULE_LICENSE("GPL");
> 
> ---
> base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
> change-id: 20240604-md-hid-lg-g15-e4a106ba126b
> 


