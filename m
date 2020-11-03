Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCEBF2A4063
	for <lists+kernel-janitors@lfdr.de>; Tue,  3 Nov 2020 10:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727921AbgKCJgH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 3 Nov 2020 04:36:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60278 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726013AbgKCJgG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 3 Nov 2020 04:36:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604396165;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=utrPveW+BJMu+H8w9gP8ENBbrrz/FW0t+ZI2x7qQEJ0=;
        b=QbvwyPeRQeMlL5bKQOBXcGaZ5KP4eoXs+WpD8gfCm/7a16dnTyakDYVSM6tJ2Sg+0mMjJ/
        6/c5seGU2CuhfkYZSTEAoB8jl4Nzo4Wy0KRbLNiKA6fvsn0Kt9k/Xx3vpleDdsHsHrpoqn
        IPP89sq08Zi2iCQp279PIfZrTwD/ua0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-p3IzBsC1NASwbLKztRHKng-1; Tue, 03 Nov 2020 04:36:03 -0500
X-MC-Unique: p3IzBsC1NASwbLKztRHKng-1
Received: by mail-ej1-f72.google.com with SMTP id dx19so4630958ejb.7
        for <kernel-janitors@vger.kernel.org>; Tue, 03 Nov 2020 01:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=utrPveW+BJMu+H8w9gP8ENBbrrz/FW0t+ZI2x7qQEJ0=;
        b=LBn/ZyrEBh5P2h3K7DaFIsW9s69fNyLqWZrJTiGXNrdJG0syeL9YiR3tiI3MrKUj92
         AZXBZp14a4V7MfptZN+ci2bZleA5i5DV4I9/p7M83mcMMgFw6h9xbWyIs6gSpdNq7ySv
         QiMO1yyR01jl3mK2Twfvrn6XuctyZzaohNybSHz8ZfoTu1OweMYE88oO1Imr/B9L1Gil
         L3RT4DBCB355v/v5fSXZFEMDT7hkRP2Mh6DsFT10LLXr4Xi+BTaxvL4eRQ9GOuSyx3Uc
         GjY5mySMjjniO9SalvNRMhkKyl4oqfcgRNvrDyHwCIZxo1nSYriHhTnNIpgR5OkStj3D
         DhXA==
X-Gm-Message-State: AOAM532Tr3b8YiDaDHweoTcIWQfA+eGz9UUIhsD7IKXs2/Ttl17gAcSo
        bT9MlGrIJL1xwtCypofI1YNn4PGUv4IxqeirdrUq19aj5OfMviSDvYudGR/MXicTEouyDrJJnPi
        82oJTn4ZpVu13/eaLM9t6uhzLqCkZ
X-Received: by 2002:a17:906:edaf:: with SMTP id sa15mr16365526ejb.454.1604396162610;
        Tue, 03 Nov 2020 01:36:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySyprnOznFAnABrhRiUSLsGjXxSGaLlIw0abYlPr+aHBuTZm4tdcRRUniVh8KiZ9aMowrB4w==
X-Received: by 2002:a17:906:edaf:: with SMTP id sa15mr16365509ejb.454.1604396162372;
        Tue, 03 Nov 2020 01:36:02 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id d1sm10653069ejo.17.2020.11.03.01.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 01:36:01 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: rectify DELL WMI SYSMAN DRIVERS section
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Mario Limonciello <mario.limonciello@dell.com>,
        Prasanth KSR <prasanth.ksr@dell.com>,
        Joe Perches <joe@perches.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201029114425.22520-1-lukas.bulwahn@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0eea5f3d-b3bc-e3b4-1b7f-d6528f33bd44@redhat.com>
Date:   Tue, 3 Nov 2020 10:36:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201029114425.22520-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 10/29/20 12:44 PM, Lukas Bulwahn wrote:
> Commit e8a60aa7404b ("platform/x86: Introduce support for Systems
> Management Driver over WMI for Dell Systems") added a new section
> DELL WMI SYSMAN DRIVERS in MAINTAINERS, but slipped in a typo.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches    F:    drivers/platform/x86/dell-wmi-syman/*
> 
> Point the file entry to the right location and add an entry for its
> Documentation while at it.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>


> ---
> Divya, please ack.
> 
> Hans, please pick this minor non-urgent patch into your -next x86 platform
> driver tree on top of commit mentioned above.
> 
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b8a905354ee9..a0a86daa9c51 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4974,7 +4974,8 @@ M:	Mario Limonciello <mario.limonciello@dell.com>
>  M:	Prasanth Ksr <prasanth.ksr@dell.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> -F:	drivers/platform/x86/dell-wmi-syman/*
> +F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
> +F:	drivers/platform/x86/dell-wmi-sysman/
>  
>  DELL WMI NOTIFICATIONS DRIVER
>  M:	Matthew Garrett <mjg59@srcf.ucam.org>
> 

