Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 709CC2A406A
	for <lists+kernel-janitors@lfdr.de>; Tue,  3 Nov 2020 10:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbgKCJg3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 3 Nov 2020 04:36:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25367 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726126AbgKCJg3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 3 Nov 2020 04:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604396188;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ETTAgVG1ue4Hn6DuCHm7ujjeEAEZk7xspJhHoihfwFo=;
        b=HVcIRuDV4OoCiFADR7v7R98iHQ9Eh4StphkYomiMjJVZlc3RWP2nq+3+7s3IXP80gakuvg
        SnstPvleP1/I2FdBioMf+p8VV0sxHWugnohqINJo4unkfz5mjA7g9Le6OQ39ESUfCK3qGM
        vPaf2RoebglKSMwHEmF14R0tdxlFxyw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-2hglxsD2NguWP3aOlPJriw-1; Tue, 03 Nov 2020 04:36:26 -0500
X-MC-Unique: 2hglxsD2NguWP3aOlPJriw-1
Received: by mail-ed1-f71.google.com with SMTP id t4so7259652edv.7
        for <kernel-janitors@vger.kernel.org>; Tue, 03 Nov 2020 01:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ETTAgVG1ue4Hn6DuCHm7ujjeEAEZk7xspJhHoihfwFo=;
        b=bpDpSpwFE/HI41wzUCvoV8WXXmcY2zn718dfhmjge7ikGv19RQSqufrhPlLryZZJyf
         Rs6o05Usifk6kBh6U8CHm6cD9fgF4ikhpchfHps5VTjqb9kzEtpv6q8RLGIi+QoDc5r0
         svp0sYvvnxXsvTqOQxvNVEjxHl02RaL4dHIsJFOHrHoQRhfOpLL4g2KsTzwsy+v7q3z4
         roHdy9PBotwtqWkZGC/VVNjRI3etDkVnwDbo1zNh/BPgukYyjB8siqD01dsT1i/4sXwH
         yzKCld28W3pcDhR2vJj9AJIt+Yncj55AvUI3+C9S6v6gcjKD7VWNxGxCqgxrE0nBeWo1
         WOWg==
X-Gm-Message-State: AOAM530BosIXrz/WTzQyEvW2ZvCWJu4Me5NjS4YLd29Lnmmy8FEVLIst
        bI8AVUNJ0rJVO/0QumxPkwdvqR1ysUWkAm63KkeQ13BhpWkNvwcqxgdPvriCliseVesdH0LCbyM
        15KRSXONhABBhTdWUyzNTdkZKGzNz
X-Received: by 2002:a17:906:d92c:: with SMTP id rn12mr16568672ejb.472.1604396185066;
        Tue, 03 Nov 2020 01:36:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBSoNawWfzPpeT7Pyu8XcjSdVANFSV5OBWs3ZaxTseppPFq/1qvXaKhi0Q2vqPFyIODCPx3Q==
X-Received: by 2002:a17:906:d92c:: with SMTP id rn12mr16568663ejb.472.1604396184921;
        Tue, 03 Nov 2020 01:36:24 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id d24sm11534047edq.34.2020.11.03.01.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 01:36:24 -0800 (PST)
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
Message-ID: <a3fe61e9-c126-2d38-6ca1-accbcdea91ad@redhat.com>
Date:   Tue, 3 Nov 2020 10:36:23 +0100
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

This time with content, sorry for the empty mail.

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

