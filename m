Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B7930C94F
	for <lists+kernel-janitors@lfdr.de>; Tue,  2 Feb 2021 19:16:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233686AbhBBSPs (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 2 Feb 2021 13:15:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48760 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233694AbhBBOGp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 2 Feb 2021 09:06:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612274718;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LXlNwCxVBCnWTgIRZ67SF78i3D9tADdgI1TeYfcOFjI=;
        b=EhcXHDxBzyRiiU1U0u9HFjrlPdTu1K20D9gi+AHSrRcqXrnxU7KLVjdGoIVkpZ5zAi7/Zp
        vO5hquBzoSRQY8z1LZEEspSac1LUryImCKwZMGbQqxallc270PRvQ4kI8hb0Y8/eXKANO+
        rasSBXKrrPegT18D8nHR/adnATP3Xow=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-MZy2IOtzMOGYiCTsxYWnNg-1; Tue, 02 Feb 2021 09:05:17 -0500
X-MC-Unique: MZy2IOtzMOGYiCTsxYWnNg-1
Received: by mail-ed1-f72.google.com with SMTP id w23so372364edr.15
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Feb 2021 06:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LXlNwCxVBCnWTgIRZ67SF78i3D9tADdgI1TeYfcOFjI=;
        b=pJwMOLNNFvDN6wx9VSEEi+s9DTaO1U311+UXL/67ccTPeU+53tOR4bBNsavwEsOaBe
         T98Ht0rSpf+qUs/Ue9nF4lIyrhwyR4yIZ6PKuV12s1z7AUlH+1s2xVSdfiRRj/6MY8KR
         y/crMYUu541lwqVVHbUL3oodU/9hWZDqM+efyvysp1aZ4EmEXVpK0bVPY+iPnyWTQ2aw
         FtiM5mHvUH3DlEckRa+Y8Oc7UV59dSaESdpAXUZB4Eu0O0uJYn+TGOHavz0memydgkqb
         O5PIgR9663NTN9WkVBtoyI6j9LDdyioLfE7mH2CaJzSN89wOHRxSSJnEOklckZWh+Dgf
         qsXw==
X-Gm-Message-State: AOAM53192+obDSn6GDpZbnENX+Hh/GtEALuNLv67c7kNVesgn2BE/FEj
        q3GKAqfh72kKd/79w1/dZPdiRfKRXuAIxUcon8/XvFQkTRCPPim3igc4g1gSYZs/PmuRtSiZiMj
        wrGxeVe07xC2wAoUAiMMyk0T0RfQY
X-Received: by 2002:a17:906:780c:: with SMTP id u12mr22282917ejm.125.1612274715973;
        Tue, 02 Feb 2021 06:05:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQ/DyaGLIBeJhjBFt5cegtfQ7kGKj1VDMfIj8k1n8QaRu28f438c65QA8HfxsXqI6Pm6fGcw==
X-Received: by 2002:a17:906:780c:: with SMTP id u12mr22282903ejm.125.1612274715788;
        Tue, 02 Feb 2021 06:05:15 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id ec18sm9321262ejb.24.2021.02.02.06.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 06:05:15 -0800 (PST)
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: rectify length of title
 underline
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Nitin Joshi <njoshi1@lenovo.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210129040849.26740-1-lukas.bulwahn@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3b91a535-b818-09be-456b-c728838612dc@redhat.com>
Date:   Tue, 2 Feb 2021 15:05:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210129040849.26740-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 1/29/21 5:08 AM, Lukas Bulwahn wrote:
> Commit d7cbe2773aed ("platform/x86: thinkpad_acpi: set keyboard language")
> adds information on keyboard setting to the thinkpad documentation, but
> made the subsection title underline too short.
> 
> Hence, make htmldocs warns:
> 
>   Documentation/admin-guide/laptops/thinkpad-acpi.rst:1472: \
>     WARNING: Title underline too short.
> 
> Rectify length of subsection title underline.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
> applies cleanly on next-20210128
> 
> Nitin, please ack.
> 
> Hans, please pick this minor fixup for your platform/x86 -next tree.
> 
>  Documentation/admin-guide/laptops/thinkpad-acpi.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index b1188f05a99a..0e4c5bb7fb70 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -1469,7 +1469,7 @@ Sysfs notes
>  
>  
>  Setting keyboard language
> --------------------
> +-------------------------
>  
>  sysfs: keyboard_lang
>  
> 

